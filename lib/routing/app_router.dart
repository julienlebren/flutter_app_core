import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_app_core/layout_builder/layout_builder.dart';
import 'package:flutter_app_core/sign_in/sign_in.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'app_router.g.dart';

class _NavigatorKeys {
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

const minPaddingTop = 40.0;
const maxModalHeight = 650.0;

class ModalStack extends ConsumerWidget {
  const ModalStack({
    required this.child,
    super.key,
  });

  final Widget child;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final screenWidth = window.physicalSize.width / window.devicePixelRatio;
    final screenHeight = window.physicalSize.height / window.devicePixelRatio;
    final isVisible = ref.watch(keyboardVisibilityProvider).maybeWhen(
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
    double bottomPadding = modalHeight < maxModalHeight ? 0 : verticalPadding;

    print(
        "Keyboard: $isVisible / availableHeight: $availableHeight / keyboardHeight: $keyboardHeight");

    return Stack(
      children: [
        SizedBox(
          width: screenWidth,
          height: screenHeight,
          child: BackdropFilter(
            filter: ImageFilter.blur(sigmaX: 5, sigmaY: 5),
            child: Container(
              color: Colors.black.withOpacity(0.01),
            ),
          ),
        ),
        AnimatedPadding(
          duration: const Duration(seconds: 2),
          curve: Curves.easeInOut,
          padding: EdgeInsets.only(
            left: (screenWidth - Breakpoints.modal) / 2,
            right: (screenWidth - Breakpoints.modal) / 2,
            top: topPadding,
            bottom: bottomPadding,
          ),
          child: ClipRect(
            child: Container(
              transform: Matrix4.translationValues(0.0, -20.0, 0.0),
              child: child,
            ),
          ),
        ),
      ],
    );
  }
}

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
    navigatorKey: _NavigatorKeys.root,
    initialLocation: '/',
    debugLogDiagnostics: false,
    routes: [
      GoRoute(
        path: '/',
        name: SignInRoute.landing.name,
        parentNavigatorKey: _NavigatorKeys.root,
        pageBuilder: (context, state) {
          return NoTransitionPage(child: mainRoute.builder!(context, state));
        },
        routes: [
          ...otherRoutes,
          ShellRoute(
            navigatorKey: _NavigatorKeys.signIn,
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
        ],
      ),
    ],
    //errorBuilder: (context, state) => const NotFoundScreen(),
  );
}
