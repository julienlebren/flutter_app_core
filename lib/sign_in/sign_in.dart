library sign_in;

import 'dart:async';
import 'dart:ui' as ui;

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

class AuthSettings {
  AuthSettings({
    required this.suppliers,
    required this.userStreamProvider,
    this.needUserInfoProvider,
  });

  final List<SignInSupplier> suppliers;
  final StreamProvider userStreamProvider;
  final Provider<bool?>? needUserInfoProvider;
}

@Riverpod(keepAlive: true)
AuthSettings authSettings(AuthSettingsRef ref) {
  throw UnimplementedError("AuthSettings has not been overridden as required.");
}

@Riverpod(keepAlive: true, dependencies: [authSettings])
AuthState authState(AuthStateRef ref) {
  final settings = ref.watch(authSettingsProvider);
  final authStateChanges = ref.watch(authStateChangesProvider);

  return authStateChanges.when(
    loading: () => const AuthState.initializing(),
    error: (error, _) => AuthState.error(error.toString()),
    data: (firebaseUser) {
      if (firebaseUser == null) {
        return const AuthState.notAuthed();
      } else {
        final isSigninIn = ref.watch(signInSupplierProvider) != null;
        final user = ref.watch(settings.userStreamProvider);
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
              if (settings.needUserInfoProvider != null) {
                final needUserInfo = ref.watch(settings.needUserInfoProvider!);
                if (needUserInfo == true) {
                  return const AuthState.needUserInformation();
                } else if (needUserInfo == false) {
                  return AuthState.authed(user);
                } else {
                  if (isSigninIn) {
                    return const AuthState.notAuthed();
                  } else {
                    return const AuthState.initializing();
                  }
                }
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

/*
final authStateProvider =
    Provider.family<AuthState, AuthSettings>((ref, settings) {
  final authStateChanges = ref.watch(authStateChangesProvider);

  return authStateChanges.when(
    loading: () => const AuthState.initializing(),
    error: (error, _) => AuthState.error(error.toString()),
    data: (firebaseUser) {
      if (firebaseUser == null) {
        return const AuthState.notAuthed();
      } else {
        final isSigninIn = ref.watch(signInSupplierProvider) != null;
        final user = ref.watch(settings.userStreamProvider);
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
              if (settings.needUserInfoProvider != null) {
                final needUserInfo = ref.watch(settings.needUserInfoProvider!);
                if (needUserInfo == true) {
                  return const AuthState.needUserInformation();
                } else if (needUserInfo == false) {
                  return AuthState.authed(user);
                } else {
                  if (isSigninIn) {
                    return const AuthState.notAuthed();
                  } else {
                    return const AuthState.initializing();
                  }
                }
              } else {
                return AuthState.authed(user);
              }
            }
          },
        );
      }
    },
  );
});
*/