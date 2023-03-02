part of sign_in;

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
            //final navigator = SignInNavigatorKeys.modal.currentState!;
            //navigator.pushReplacementNamed(SignInRoutes.signInUserInfoPage);
            context.pushReplacementNamed(SignInRoute.info.name);
          } else {
            Future.delayed(const Duration(milliseconds: 300), () {
              //final navigator = Navigator.of(context, rootNavigator: true);
              //navigator.pushNamed(SignInRoutes.signInUserInfoPage, arguments: true);
              context.push(SignInRoute.info.name);
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
