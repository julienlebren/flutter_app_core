library app_router;

import 'package:flutter/material.dart';
import 'package:flutter_app_core/layout_builder/layout_builder.dart';
import 'package:flutter_app_core/settings/settings.dart';
import 'package:flutter_app_core/sign_in/sign_in.dart';
import 'package:go_router/go_router.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'app_router.g.dart';

class NavigatorKeys {
  static final root = GlobalKey<NavigatorState>();
  static final tabs = GlobalKey<NavigatorState>();
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

@Riverpod(keepAlive: true)
// ignore: unsupported_provider_value
GoRouter goRouter(GoRouterRef ref) {
  final mainRoute = ref.watch(routeProvider);

  // All the routes provided by the app
  final routes = mainRoute.routes;
  print("routes: $routes");

  //
  final signInUserInfoRoute = routes.cast<GoRoute?>().firstWhere(
        (r) => r!.name == SignInRoute.info.name,
        orElse: () => null,
      );

  //final otherRoutes = routes.where((r) => r!.name != SignInRoute.info.name);

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
            pageBuilder: openCustomDialog,
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
                  return openCustomDialog(
                    context,
                    state,
                    const CountriesPage(),
                  );
                },
              ),
              //if (signInUserInfoRoute != null) signInUserInfoRoute,
            ],
          ),
          ...routes,
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
/*
@Riverpod(keepAlive: true)
// ignore: unsupported_provider_value
List<RouteBase> signInRouter(SignInRouterRef ref) {
  return [
    ShellRoute(
      navigatorKey: NavigatorKeys.signIn,
      pageBuilder: (context, state, child) {
        return PlatformDialogPage(child: child);
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
            return PlatformDialogPage(child: const CountriesPage());
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
*/