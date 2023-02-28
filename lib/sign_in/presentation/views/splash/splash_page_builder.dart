part of sign_in;

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

class SplashPageBuilder extends ConsumerWidget {
  const SplashPageBuilder({
    required this.home,
    required this.landing,
    this.loader = const ScaffoldLoader(),
    Key? key,
  }) : super(key: key);

  final Widget loader;
  final Widget landing;
  final Widget home;

  void _pop(BuildContext context) {
    final navigator = Navigator.of(context, rootNavigator: true);
    Future.delayed(const Duration(milliseconds: 300), () {
      navigator.pop();
    });
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    ref.listen<AuthState>(authStateProvider, (
      previousState,
      authState,
    ) {
      authState.maybeWhen(
        authed: (_) {
          previousState?.maybeWhen(
            needUserInformation: () => _pop(context),
            orElse: () {
              final supplier = ref.watch(signInSupplierProvider);
              if (supplier != null &&
                  supplier != SignInSupplier.anonymous &&
                  !supplier.isThirdParty) {
                _pop(context);
              }
            },
          );
        },
        needUserInformation: () {
          final supplier = ref.watch(signInSupplierProvider);
          if (supplier != null && !supplier.isThirdParty) {
            final navigator = SignInNavigatorKeys.modal.currentState!;
            navigator.pushReplacementNamed(SignInRoutes.signInUserInfoPage);
          } else {
            final navigator = Navigator.of(context, rootNavigator: true);
            Future.delayed(const Duration(milliseconds: 300), () {
              navigator.pushNamed(SignInRoutes.signInUserInfoPage,
                  arguments: true);
            });
          }
        },
        orElse: () => null,
      );
    });

    final authSplashState = ref.watch(authSplashProvider);

    return authSplashState.maybeWhen(
      initializing: () => loader,
      authed: () => home,
      orElse: () => landing,
    );
  }
}
