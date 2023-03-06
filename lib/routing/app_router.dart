import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_app_core/layout_builder/constants/breakpoints.dart';
import 'package:flutter_app_core/layout_builder/layout_builder.dart';
import 'package:flutter_app_core/sign_in/sign_in.dart';
import 'package:go_router/go_router.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'app_router.g.dart';

class _NavigatorKeys {
  static final signIn = GlobalKey<NavigatorState>();
}

enum SignInRoute {
  landing,
  emailLogin,
  emailReset,
  emailRegister,
  phoneLogin,
  phoneVerification,
  countries,
  info,
}

@Riverpod(keepAlive: true)
List<GoRoute> routes(RoutesRef ref) {
  return [];
}

@riverpod
Page modalTransition(
  ModalTransitionRef ref, {
  LocalKey? key,
  required Widget child,
}) {
  final screenWidth = window.physicalSize.width;
  if (screenWidth > Breakpoints.modal) {
    return CustomTransitionPage<void>(
      key: key,
      child: Padding(
        padding: EdgeInsets.symmetric(
          horizontal: (screenWidth - Breakpoints.modal) / 2,
          vertical: 100,
        ),
        child: child,
      ),
      barrierDismissible: true,
      barrierColor: Colors.black38,
      opaque: false,
      transitionDuration: Duration.zero,
      transitionsBuilder: (_, __, ___, child) => child,
    );
  } else {
    return platformPage(
      key: key,
      fullscreenDialog: true,
      child: child,
    );
  }
}

/*ref.read(
                modalTransitionProvider(
                  key: state.pageKey,
                  child: const SizedBox.shrink(),
                ),
              );*/

@Riverpod(keepAlive: true)
// ignore: unsupported_provider_value
GoRouter goRouter(GoRouterRef ref) {
  final routes = ref.watch(routesProvider);
  final mainRoute = routes.firstWhere(
    (route) => route.path == '/',
    orElse: () {
      throw Exception(
          "Unable to find a route with path '/', did you override goRouterProvider in the root ProviderScope?");
    },
  );
  final otherRoutes = routes.where((route) => route.path != '/');

  return GoRouter(
    initialLocation: '/',
    debugLogDiagnostics: false,
    //refreshListenable: ref.watch(authStateChangesProvider),
    routes: [
      GoRoute(
        path: '/',
        name: SignInRoute.landing.name,
        pageBuilder: mainRoute.pageBuilder,
        routes: [
          ...otherRoutes,
          ShellRoute(
            navigatorKey: _NavigatorKeys.signIn,
            pageBuilder: (context, state, child) {
              return ref.read(
                modalTransitionProvider(
                  key: state.pageKey,
                  child: const SizedBox.shrink(),
                ),
              );
            },
            routes: [
              GoRoute(
                path: 'login',
                name: SignInRoute.emailLogin.name,
                pageBuilder: (context, state) {
                  return platformPage(
                    key: state.pageKey,
                    child: const SignInEmailLoginPage(),
                  );
                },
              ),
              GoRoute(
                path: 'register',
                name: SignInRoute.emailRegister.name,
                pageBuilder: (context, state) {
                  return platformPage(
                    key: state.pageKey,
                    child: const SignInEmailRegisterPage(),
                  );
                },
              ),
              GoRoute(
                path: 'reset',
                name: SignInRoute.emailReset.name,
                pageBuilder: (context, state) {
                  return platformPage(
                    key: state.pageKey,
                    child: const SignInEmailResetPage(),
                  );
                },
              ),
              GoRoute(
                path: 'phone',
                name: SignInRoute.phoneLogin.name,
                pageBuilder: (context, state) {
                  return ref.read(
                    modalTransitionProvider(
                      key: state.pageKey,
                      child: const SignInPhonePage(),
                    ),
                  );
                },
              ),
              GoRoute(
                path: 'verification',
                name: SignInRoute.phoneVerification.name,
                pageBuilder: (context, state) {
                  return ref.read(
                    modalTransitionProvider(
                      key: state.pageKey,
                      child: const SignInPhoneVerificationPage(),
                    ),
                  );
                },
              ),
              GoRoute(
                path: 'countries',
                name: SignInRoute.countries.name,
                pageBuilder: (context, state) {
                  return ref.read(
                    modalTransitionProvider(
                      key: state.pageKey,
                      child: const CountriesPage(),
                    ),
                  );
                },
              ),
            ],
          ),
        ],
      ),
    ],
    //errorBuilder: (context, state) => const NotFoundScreen(),
  );
}
