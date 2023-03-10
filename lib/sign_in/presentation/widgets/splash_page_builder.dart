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
    final navigator = NavigatorKeys.root.currentState!;
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
              if (supplier != null && !supplier.isThirdParty) {
                _pop(context);
              }
            },
          );
        },
        needUserInformation: () {
          Future.delayed(const Duration(milliseconds: 3000), () {
            context.goNamed(SignInRoute.info.name);
          });
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
