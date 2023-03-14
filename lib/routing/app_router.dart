library app_router;

import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_app_core/layout_builder/layout_builder.dart';
import 'package:flutter_app_core/sign_in/sign_in.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'modal_stack.dart';
part 'app_router.g.dart';

class NavigatorKeys {
  static final root = GlobalKey<NavigatorState>();
  static final tab = GlobalKey<NavigatorState>();
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
GoRoute route(RouteRef ref) => throw Exception(
    "Unable to find a route with path '/', did you override goRouterProvider in the root ProviderScope?");

@riverpod
Page modalTransition(
  ModalTransitionRef ref, {
  LocalKey? key,
  required Widget child,
}) {
  final screenWidth = window.physicalSize.width / window.devicePixelRatio;
  if (screenWidth > Breakpoints.modal) {
    return CustomTransitionPage<void>(
      key: key,
      child: ModalStack(child: child),
      barrierDismissible: true,
      barrierColor: Colors.black38,
      opaque: false,
      transitionDuration: const Duration(milliseconds: 200),
      transitionsBuilder: (context, animation, secondaryAnimation, child) {
        const begin = Offset(0.0, 1.0);
        const end = Offset.zero;
        const curve = Curves.ease;

        var tween =
            Tween(begin: begin, end: end).chain(CurveTween(curve: curve));

        return SlideTransition(
          position: animation.drive(tween),
          child: child,
        );
      },
    );
  } else {
    return platformPage(
      key: key,
      fullscreenDialog: true,
      child: child,
    );
  }
}

@Riverpod(keepAlive: true)
// ignore: unsupported_provider_value
GoRouter goRouter(
  GoRouterRef ref, {
  TabItem? tabItem,
}) {
  final mainRoute = ref.watch(routeProvider);
  final authSplashState = ref.watch(authSplashProvider);

  return GoRouter(
    navigatorKey: NavigatorKeys.root,
    initialLocation: tabItem?.initialLocation ?? "/",
    debugLogDiagnostics: false,
    routes: [
      GoRoute(
        path: '/',
        name: SignInRoute.landing.name,
        parentNavigatorKey: NavigatorKeys.root,
        pageBuilder: (context, state) {
          return NoTransitionPage(child: mainRoute.builder!(context, state));
        },
        routes: authSplashState.maybeWhen(
          authed: () => [
            // If we have tabs, it means that we display the app in a
            // Scaffold with BottomNavigationBar (or CupertinoTabScaffold on iOS)
            if (tabItem != null)
              ShellRoute(
                navigatorKey: tabItem.navigatorKey,
                pageBuilder: (_, __, child) {
                  return NoTransitionPage(
                    child: PlatformTabScaffold2(
                      key: GlobalKey(),
                      child: child,
                    ),
                  );
                },
                routes: mainRoute.routes,
              ),
          ],
          orElse: () => [
            // This is the container for all the sign-in routes
            ShellRoute(
              navigatorKey: NavigatorKeys.signIn,
              pageBuilder: (context, state, child) {
                return ref.read(
                  modalTransitionProvider(
                    key: state.pageKey,
                    child: child,
                  ),
                );
              },
              routes: [
                GoRoute(
                  path: 'register',
                  name: SignInRoute.emailRegister.name,
                  builder: (_, __) => const SignInEmailRegisterPage(),
                ),
                GoRoute(
                  path: 'login',
                  name: SignInRoute.emailLogin.name,
                  builder: (_, __) => const SignInEmailLoginPage(),
                ),
                GoRoute(
                  path: 'reset',
                  name: SignInRoute.emailReset.name,
                  builder: (_, __) => const SignInEmailResetPage(),
                ),
                GoRoute(
                  path: 'phone',
                  name: SignInRoute.phoneLogin.name,
                  builder: (_, __) => const SignInPhonePage(),
                ),
                GoRoute(
                  path: 'verification',
                  name: SignInRoute.phoneVerification.name,
                  builder: (_, __) => const SignInPhoneVerificationPage(),
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
                ...mainRoute.routes,
              ],
            ),
          ],
        ),
      ),
    ],
    //errorBuilder: (context, state) => const NotFoundScreen(),
  );
}
