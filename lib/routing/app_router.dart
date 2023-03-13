library app_router;

import 'dart:ui';

import 'package:flutter/cupertino.dart';
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

// Plusieurs GoRouter, un par tab ?

@Riverpod(keepAlive: true)
// ignore: unsupported_provider_value
GoRouter goRouter(
  GoRouterRef ref, {
  String initialLocation = '/a',
}) {
  final mainRoute = ref.watch(routeProvider);
  final tabs = ref.read(tabsProvider);

  return GoRouter(
    navigatorKey: NavigatorKeys.root,
    initialLocation: initialLocation,
    debugLogDiagnostics: false,
    routes: [
      // If we have tabs, it means that we display the app in a
      //Scaffold with BottomNavigationBar (or CupertinoTabScaffold on iOS)
      if (tabs.isNotEmpty)
        ShellRoute(
          navigatorKey: NavigatorKeys.tab,
          builder: (BuildContext context, GoRouterState state, Widget child) {
            return ScaffoldWithNavBar(child: child);
          },
          routes: mainRoute.routes,
        ),
      /*GoRoute(
        path: '/',
        name: SignInRoute.landing.name,
        parentNavigatorKey: NavigatorKeys.root,
        pageBuilder: (context, state) {
          return NoTransitionPage(child: mainRoute.builder!(context, state));
        },
        routes: [
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
    ],
    //errorBuilder: (context, state) => const NotFoundScreen(),
  );
}

class ScaffoldWithNavBar extends StatelessWidget {
  const ScaffoldWithNavBar({required this.child, Key? key}) : super(key: key);

  final Widget child;

  @override
  Widget build(BuildContext context) {
    return CupertinoTabScaffold(
      tabBar: CupertinoTabBar(
        currentIndex: _calculateSelectedIndex(context),
        onTap: (int index) => _onItemTapped(index, context),
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'A Screen',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.business),
            label: 'B Screen',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.notification_important_rounded),
            label: 'C Screen',
          ),
        ],
      ),
      tabBuilder: (BuildContext context, int index) => child,
    );
  }

  int _calculateSelectedIndex(BuildContext context) {
    final GoRouter route = GoRouter.of(context);
    final String location = route.location;
    if (location.startsWith('/a')) {
      return 0;
    }
    if (location.startsWith('/b')) {
      return 1;
    }
    if (location.startsWith('/c')) {
      return 2;
    }
    return 0;
  }

  void _onItemTapped(int index, BuildContext context) {
    switch (index) {
      case 0:
        GoRouter.of(context).go('/a');
        break;
      case 1:
        GoRouter.of(context).go('/b');
        break;
      case 2:
        GoRouter.of(context).go('/c');
        break;
    }
  }
}

/// The first screen in the bottom navigation bar.
class ScreenA extends StatelessWidget {
  /// Constructs a [ScreenA] widget.
  const ScreenA({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      navigationBar: const CupertinoNavigationBar(),
      child: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            const Text('Screen A'),
            TextButton(
              onPressed: () {
                GoRouter.of(context).go('/a/details');
              },
              child: const Text('View A details'),
            ),
          ],
        ),
      ),
    );
  }
}

/// The second screen in the bottom navigation bar.
class ScreenB extends StatelessWidget {
  /// Constructs a [ScreenB] widget.
  const ScreenB({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      navigationBar: const CupertinoNavigationBar(),
      child: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            const Text('Screen B'),
            TextButton(
              onPressed: () {
                GoRouter.of(context).go('/b/details');
              },
              child: const Text('View B details'),
            ),
          ],
        ),
      ),
    );
  }
}

/// The third screen in the bottom navigation bar.
class ScreenC extends StatelessWidget {
  /// Constructs a [ScreenC] widget.
  const ScreenC({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      navigationBar: const CupertinoNavigationBar(),
      child: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            const Text('Screen C'),
            TextButton(
              onPressed: () {
                GoRouter.of(context).go('/c/details');
              },
              child: const Text('View C details'),
            ),
          ],
        ),
      ),
    );
  }
}

class DetailsScreen extends StatelessWidget {
  const DetailsScreen({required this.label, Key? key}) : super(key: key);

  final String label;

  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      navigationBar: const CupertinoNavigationBar(
        middle: Text('Details Screen'),
      ),
      child: Center(
        child: Text(
          'Details for $label',
          style: Theme.of(context).textTheme.headlineMedium,
        ),
      ),
    );
  }
}
