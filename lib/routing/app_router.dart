library app_router;

import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_app_core/layout_builder/layout_builder.dart';
import 'package:flutter_app_core/settings/settings.dart';
import 'package:flutter_app_core/sign_in/sign_in.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'modal_stack.dart';
part 'app_router.g.dart';

class NavigatorKeys {
  static final root = GlobalKey<NavigatorState>();
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

enum SettingsRoute {
  overview,
  account,
  email,
  password,
  delete,
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

class AlertDialog2 extends Page {
  const AlertDialog2({required this.child});

  final Widget child;

  @override
  Route createRoute(BuildContext context) {
    final screenWidth = window.physicalSize.width / window.devicePixelRatio;

    return RawDialogRoute(
      pageBuilder: (context, animation, secondaryAnimation) {
        return ModalStack2(
          child: Dialog(
            insetPadding: EdgeInsets.symmetric(
              horizontal: (screenWidth - Breakpoints.modal) / 2,
              vertical: 24,
            ),
            child: child,
          ),
        );
      },
      settings: this,
    );
  }
}

class ModalStack2 extends ConsumerWidget {
  const ModalStack2({
    required this.child,
    super.key,
  });

  final Widget child;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final screenHeight = window.physicalSize.height / window.devicePixelRatio;

    ref.watch(keyboardVisibilityProvider).maybeWhen(
          data: (isVisible) => isVisible,
          orElse: () => false,
        );

    final keyboardHeight = MediaQuery.of(context).viewInsets.bottom;
    final availableHeight = screenHeight - keyboardHeight;
    final modalHeight = availableHeight > (maxModalHeight + minPaddingTop)
        ? maxModalHeight
        : (availableHeight - minPaddingTop);

    final verticalPadding = (screenHeight - modalHeight) / 2;
    double topPadding =
        modalHeight < maxModalHeight ? minPaddingTop : verticalPadding;
    double bottomPadding =
        modalHeight < maxModalHeight ? keyboardHeight : verticalPadding;

    final isKeyboardOpen = MediaQuery.of(context).viewInsets.bottom > 0;

    return Container(
      transform:
          Matrix4.translationValues(0.0, isKeyboardOpen ? -20.0 : 0.0, 0.0),
      child: child,
    );
  }
}

@Riverpod(keepAlive: true)
// ignore: unsupported_provider_value
GoRouter goRouter(GoRouterRef ref) {
  final mainRoute = ref.watch(routeProvider);
  final authSplashState = ref.watch(authSplashProvider);

  // All the routes provided by the app
  final routes = mainRoute.routes.cast<GoRoute>();

  //
  final signInUserInfoRoute = routes.cast<GoRoute?>().firstWhere(
        (r) => r!.name == SignInRoute.info.name,
        orElse: () => null,
      );

  return GoRouter(
    navigatorKey: NavigatorKeys.root,
    initialLocation: '/',
    routes: [
      GoRoute(
        path: '/',
        name: SignInRoute.landing.name,
        parentNavigatorKey: NavigatorKeys.root,
        pageBuilder: (context, state) {
          return NoTransitionPage(child: mainRoute.builder!(context, state));
        },
        routes: [
          // This is the container for all the sign-in routes
          ShellRoute(
            navigatorKey: NavigatorKeys.signIn,
            pageBuilder: (context, state, child) {
              return AlertDialog2(child: child);
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
              if (signInUserInfoRoute != null) signInUserInfoRoute,
            ],
          ),
        ],

        /*
        routes: authSplashState.maybeWhen(
          authed: () {
            return [
              ShellRoute(
                navigatorKey: NavigatorKeys.tabs,
                pageBuilder: (_, __, child) {
                  return const NoTransitionPage(
                    child: PlatformTabScaffold(),
                  );
                },
                routes: [
                  GoRoute(
                    path: settingsRoute.path,
                    name: settingsRoute.name,
                    builder: (context, state) {
                      return settingsRoute.builder!(context, state);
                    },
                    routes: [
                      GoRoute(
                        path: 'account',
                        name: SettingsRoute.account.name,
                        builder: (_, __) => const SettingsAccountPage(),
                      ),
                      GoRoute(
                        path: 'email',
                        name: SettingsRoute.email.name,
                        builder: (_, __) => const SettingsEmailPage(),
                      ),
                      GoRoute(
                        path: 'password',
                        name: SettingsRoute.password.name,
                        builder: (_, __) => const SettingsPasswordPage(),
                      ),
                      GoRoute(
                        path: 'delete',
                        name: SettingsRoute.delete.name,
                        builder: (_, __) => const SettingsDeletePage(),
                      ),
                    ],
                  ),
                  ...otherRoutes,
                ],
              ),
            ];
          },
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
        ),*/
      ),
    ],
    //errorBuilder: (context, state) => const NotFoundScreen(),
  );
}

@Riverpod(keepAlive: true)
// ignore: unsupported_provider_value
List<RouteBase> signInRouter(SignInRouterRef ref) {
  return [
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
      ],
    ),
  ];
}

@Riverpod(keepAlive: true)
// ignore: unsupported_provider_value
List<RouteBase> settingsRouter(SettingsRouterRef ref) {
  return [
    GoRoute(
      path: 'account',
      name: SettingsRoute.account.name,
      builder: (_, __) => const SettingsAccountPage(),
    ),
    GoRoute(
      path: 'email',
      name: SettingsRoute.email.name,
      builder: (_, __) => const SettingsEmailPage(),
    ),
    GoRoute(
      path: 'password',
      name: SettingsRoute.password.name,
      builder: (_, __) => const SettingsPasswordPage(),
    ),
    GoRoute(
      path: 'delete',
      name: SettingsRoute.delete.name,
      builder: (_, __) => const SettingsDeletePage(),
    ),
  ];
}
