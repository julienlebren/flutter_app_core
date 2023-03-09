part of sign_in;

class SignInInfoPageBuilder extends ConsumerWidget {
  const SignInInfoPageBuilder({
    Key? key,
    required this.child,
  }) : super(key: key);

  final Widget child;

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
        orElse: () => null,
      );
    });

    return child;
  }
}
