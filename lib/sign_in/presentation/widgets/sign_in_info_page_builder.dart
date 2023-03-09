part of sign_in;

class SignInInfoPageBuilder extends SignInPageBuilder {
  const SignInInfoPageBuilder({
    Key? key,
    required String title,
    String? subtitle,
    Widget? leadingButton,
    required Widget child,
    Widget? submitButton,
    bool isLoading = false,
    String? errorText,
  }) : super(
          key: key,
          title: title,
          subtitle: subtitle,
          leadingButton: leadingButton,
          child: child,
          submitButton: submitButton,
          isLoading: isLoading,
          errorText: errorText,
        );

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

    return super.build(context, ref);
  }
}
