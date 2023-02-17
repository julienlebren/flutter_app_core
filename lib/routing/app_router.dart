import 'package:flutter_app_core/layout_builder/layout_builder.dart';
import 'package:flutter_app_core/sign_in/sign_in.dart';
import 'package:go_router/go_router.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'app_router.g.dart';

enum SignInRoute {
  landing,
  emailLogin,
  emailReset,
  emailRegister,
  phoneLogin,
  phoneVerification,
  countries,
}

@Riverpod(keepAlive: true)
List<GoRoute> routes(RoutesRef ref) {
  return [];
}

//@Riverpod(keepAlive: true, dependencies: [routes, authSplash, authSettings])
//GoRouter goRouter(GoRouterRef ref) {
final goRouterProvider = Provider<GoRouter>((ref) {
  final settings = ref.read(authSettingsProvider);
  final authSplashState = ref.watch(authSplashProvider(settings));

  return GoRouter(
    initialLocation: '/',
    debugLogDiagnostics: false,
    //refreshListenable: ref.watch(authStateChangesProvider),
    routes: authSplashState.maybeWhen(
      authed: () => ref.watch(routesProvider),
      orElse: () => [
        GoRoute(
          path: '/login',
          name: SignInRoute.emailLogin.name,
          pageBuilder: (context, state) => platformPage(
            key: state.pageKey,
            child: const SignInEmailLoginPage(),
          ),
        ),
        GoRoute(
          path: '/register',
          name: SignInRoute.emailRegister.name,
          pageBuilder: (context, state) => platformPage(
            key: state.pageKey,
            child: const SignInEmailRegisterPage(),
          ),
        ),
        GoRoute(
          path: '/reset',
          name: SignInRoute.emailReset.name,
          pageBuilder: (context, state) => platformPage(
            key: state.pageKey,
            child: const SignInEmailResetPage(),
          ),
        ),
        GoRoute(
          path: '/phone',
          name: SignInRoute.phoneLogin.name,
          pageBuilder: (context, state) => platformPage(
            key: state.pageKey,
            child: const SignInPhonePage(),
          ),
        ),
        GoRoute(
          path: '/verification',
          name: SignInRoute.phoneVerification.name,
          pageBuilder: (context, state) => platformPage(
            key: state.pageKey,
            child: const SignInPhoneVerificationPage(),
          ),
        ),
        GoRoute(
          path: '/countries',
          name: SignInRoute.countries.name,
          pageBuilder: (context, state) => platformPage(
            key: state.pageKey,
            child: const CountriesPage(),
            fullscreenDialog: true,
          ),
        ),
      ],
    ),
    //errorBuilder: (context, state) => const NotFoundScreen(),
  );
}, dependencies: [
  authSettingsProvider,
  authSplashProvider,
]);
