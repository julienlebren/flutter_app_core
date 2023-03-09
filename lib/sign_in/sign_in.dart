library sign_in;

import 'dart:async';
import 'dart:ui' as ui;
import 'dart:ui';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_app_core/extensions/extensions.dart';
import 'package:flutter_app_core/firebase_auth_service/firebase_auth_service.dart';
import 'package:flutter_app_core/layout_builder/layout_builder.dart';
import 'package:flutter_app_core/localization/flutter_app_core_l10n.dart';
import 'package:flutter_app_core/localization/localization.dart';
import 'package:flutter_app_core/routing/app_router.dart';
import 'package:flutter_keyboard_visibility/flutter_keyboard_visibility.dart';
import 'package:flutter_libphonenumber/flutter_libphonenumber.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:go_router/go_router.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';
import 'package:pinput/pinput.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'controllers/sign_in_buttons_controller.dart';
part 'controllers/sign_in_email_login_controller.dart';
part 'controllers/sign_in_email_link_controller.dart';
part 'controllers/sign_in_email_reset_controller.dart';
part 'controllers/sign_in_email_register_controller.dart';
part 'controllers/sign_in_phone_controller.dart';
part 'controllers/sign_in_phone_verification_controller.dart';
part 'core/enums/sign_in_area.dart';
part 'core/enums/sign_in_suppliers.dart';
part 'core/models/auth_splash_state.dart';
part 'core/models/auth_state.dart';
part 'core/models/firestore_user.dart';
part 'core/models/sign_in_theme.dart';
part 'presentation/painters/apple_logo.dart';
part 'presentation/painters/google_logo.dart';
part 'presentation/views/sign_in_countries_page.dart';
part 'presentation/views/sign_in_email_link_page.dart';
part 'presentation/views/sign_in_email_login_page.dart';
part 'presentation/views/sign_in_email_reset_page.dart';
part 'presentation/views/sign_in_email_register_page.dart';
part 'presentation/views/sign_in_phone_page.dart';
part 'presentation/views/sign_in_phone_verification_page.dart';
part 'presentation/widgets/password_requirement.dart';
part 'presentation/widgets/sign_in_buttons.dart';
part 'presentation/widgets/sign_in_divider.dart';
part 'presentation/widgets/sign_in_landing_page_builder.dart';
part 'presentation/widgets/sign_in_page_builder.dart';
part 'presentation/widgets/sign_in_tappable_field.dart';

part 'sign_in.freezed.dart';
part 'sign_in.g.dart';

/// Provider which defines the list of sign-in suppliers
/// Default is empty, you need to override it on the main scope
@Riverpod(keepAlive: true)
List<SignInSupplier> signInSuppliers(SignInSuppliersRef ref) => [];

/// Name of the users collection
const firestoreUserPath = "users";

/// A reference to the user document with a conversion to [FirestoreUser]
/// Your custom [User] model in the app should implement all the variables
/// of [FirestoreUser] to ensure everything will work well.
@riverpod
Function(Map<String, dynamic> json) userConverter(UserConverterRef ref) {
  return FirestoreUser.fromJson;
}

@Riverpod(keepAlive: true)
Stream<bool> keyboardVisibility(KeyboardVisibilityRef ref) {
  var keyboardVisibilityController = KeyboardVisibilityController();
  return keyboardVisibilityController.onChange;
}

/// A provider for listening changed to the Firestore user object
/// Only intended to return a correct [AuthState], not to get custom properties
/// of the real [User] object used in the app.
@Riverpod(keepAlive: true)
Stream<dynamic> userStream(UserStreamRef ref) {
  final authStateChanges = ref.watch(authStateChangesProvider);

  return authStateChanges.maybeWhen(
    data: (user) {
      if (user != null) {
        final userRef = FirebaseFirestore.instance
            .collection(firestoreUserPath)
            .withConverter<dynamic>(
              fromFirestore: (snapshot, _) {
                final converter = ref.read(userConverterProvider);
                final userFromJson = converter(snapshot.data()!);
                return userFromJson.copyWith(id: snapshot.id);
              },
              toFirestore: (_, __) => {},
            );
        return userRef
            .doc(user.uid)
            .snapshots()
            .map((snapshot) => snapshot.data());
      } else {
        return const Stream.empty();
      }
    },
    orElse: () => const Stream.empty(),
  );
}

/// The provider for the [AuthState] of the app
/// Watches the authStateChanges of the Firebase auth stream,
/// then if the user is authenticated, watches the Firestore
/// user document from the [firestoreUserPath] defined below.
/// If the document does not exist, we consider that the creation
/// is in progress in Cloud Functions (waitingUserCreation).
/// If the document exists and the user.needInfo is true, it seems
/// that the user needs to add more information to complete the
/// registration process.
/// Otherwise, the user is authenticated!
@Riverpod(keepAlive: true)
AuthState authState(AuthStateRef ref) {
  final authStateChanges = ref.watch(authStateChangesProvider);

  return authStateChanges.when(
    loading: () => const AuthState.initializing(),
    error: (error, _) => AuthState.error(error.toString()),
    data: (firebaseUser) {
      if (firebaseUser == null) {
        return const AuthState.notAuthed();
      } else {
        final isSigninIn = ref.watch(signInSupplierProvider) != null;
        final user = ref.watch(userStreamProvider);
        return user.when(
          loading: () {
            if (isSigninIn) {
              return const AuthState.notAuthed();
            } else {
              return const AuthState.initializing();
            }
          },
          error: (error, stack) {
            return AuthState.error(error.toString());
          },
          data: (user) {
            if (user == null) {
              return const AuthState.waitingUserCreation();
            } else {
              if (user.needInfo) {
                return const AuthState.needUserInformation();
              } else {
                return AuthState.authed(user);
              }
            }
          },
        );
      }
    },
  );
}

/// Simplified version of [AuthState], this provider is used
/// in the [SplashPageBuilder] and managed less cases than [AuthState].
@Riverpod(keepAlive: true)
AuthSplashState authSplash(AuthSplashRef ref) {
  final authState = ref.watch(authStateProvider);

  return authState.maybeWhen(
    initializing: () => const AuthSplashState.initializing(),
    needUserInformation: () {
      final signInArea = ref.read(signInAreaProvider);
      if (signInArea == SignInArea.signIn) {
        return const AuthSplashState.notAuthed();
      } else if (signInArea == SignInArea.settings) {
        return const AuthSplashState.authed();
      } else {
        return const AuthSplashState.initializing();
      }
    },
    authed: (_) => const AuthSplashState.authed(),
    error: (error) => AuthSplashState.error(error),
    orElse: () => const AuthSplashState.notAuthed(),
  );
}

/// Theming the sign-in pages
@riverpod
SignInTheme signInTheme(SignInThemeRef ref) {
  final appTheme = ref.watch(appThemeProvider);
  final formTheme = ref.watch(formThemeProvider);

  return SignInTheme(
    primaryColor: appTheme.primaryColor,
    scaffoldBackgroundColor: appTheme.scaffoldBackgroundColor,
    textColor: appTheme.textColor,
    buttonBackgroundColor: formTheme.rowBackgroundColor,
    buttonTextColor: appTheme.textColor,
    dividerColor: appTheme.dividerColor,
    borderColor: appTheme.borderColor,
  );
}

/*
@Riverpod(keepAlive: true)
class SignInArea extends _$SignInArea {
  @override
  Area? build() => null;

  void update(Area area) => state = area;
}

@Riverpod(keepAlive: true)
class SignInSupplier extends _$SignInSupplier {
  @override
  Supplier? build() => null;

  void update(Supplier? supplier) => state = supplier;
}
*/