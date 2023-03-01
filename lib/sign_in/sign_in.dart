library sign_in;

import 'dart:async';
import 'dart:ui' as ui;

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
import 'package:flutter_libphonenumber/flutter_libphonenumber.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
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
part 'core/enums/sign_in_suppliers.dart';
part 'core/models/auth_splash_state.dart';
part 'core/models/auth_state.dart';
part 'core/models/sign_in_theme.dart';
part 'presentation/painters/apple_logo.dart';
part 'presentation/painters/google_logo.dart';
part 'presentation/router/sign_in_router.dart';
part 'presentation/views/sign_in/sign_in_countries_page.dart';
part 'presentation/views/sign_in/sign_in_email_link_page.dart';
part 'presentation/views/sign_in/sign_in_email_login_page.dart';
part 'presentation/views/sign_in/sign_in_email_reset_page.dart';
part 'presentation/views/sign_in/sign_in_email_register_page.dart';
part 'presentation/widgets/sign_in_landing_page_builder.dart';
part 'presentation/views/sign_in/sign_in_phone_page.dart';
part 'presentation/views/sign_in/sign_in_phone_verification_page.dart';
part 'presentation/views/sign_in/sign_in_unknown_page.dart';
part 'presentation/views/splash/splash_page_builder.dart';
part 'presentation/widgets/password_requirement.dart';
part 'presentation/widgets/sign_in_buttons.dart';
part 'presentation/widgets/sign_in_page_builder.dart';
part 'presentation/widgets/sign_in_tappable_field.dart';

part 'sign_in.freezed.dart';
part 'sign_in.g.dart';

/// Name of the users collection
const firestoreUserPath = "users";

/// Provider which defines the list of sign-in suppliers
/// Default is empty, you need to override it on the main scope
@Riverpod(keepAlive: true)
List<SignInSupplier> signInSuppliers(SignInSuppliersRef ref) => [];

/// A reference to the user document with a conversion to [FirestoreUser]
/// Your custom [User] model in the app should implement all the variables
/// of [FirestoreUser] to ensure everything will work well.
final userRef = FirebaseFirestore.instance
    .collection(firestoreUserPath)
    .withConverter<FirestoreUser>(
      fromFirestore: (snapshot, _) {
        final userFromJson = FirestoreUser.fromJson(snapshot.data()!);
        return userFromJson.copyWith(id: snapshot.id);
      },
      toFirestore: (_, __) => {},
    );

final userStreamProvider = StreamProvider<FirestoreUser?>((ref) {
  final authStateChanges = ref.watch(authStateChangesProvider);

  return authStateChanges.maybeWhen(
    data: (user) {
      if (user != null) {
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
});

@Riverpod(keepAlive: true)
AuthState authState(AuthStateRef ref) {
  print("authState called");
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

@Riverpod(keepAlive: true)
AuthSplashState authSplash(AuthSplashRef ref) {
  print("authSplash called");
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

@Riverpod(keepAlive: true, dependencies: [appTheme, formTheme])
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

@freezed
class FirestoreUser with _$FirestoreUser {
  const factory FirestoreUser({
    String? id,
    String? displayName,
    String? emailAddress,
    @Default(false) bool emailVerified,
    @Default(false) bool hasPassword,
    @Default(false) bool needInfo,
  }) = _FirestoreUser;

  factory FirestoreUser.fromJson(Map<String, dynamic> json) =>
      _$FirestoreUserFromJson(json);
}
