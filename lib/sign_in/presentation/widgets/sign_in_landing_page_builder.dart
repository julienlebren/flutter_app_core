part of sign_in;

class SignInLandingPageBuilder extends ConsumerWidget {
  const SignInLandingPageBuilder({
    Key? key,
    this.child,
  }) : super(key: key);

  final Widget? child;

  void _pop(BuildContext context) {
    final navigator = Navigator.of(context, rootNavigator: true);
    Future.delayed(const Duration(milliseconds: 300), () {
      navigator.pop();
    });
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final signInTheme = ref.watch(signInThemeProvider);

    ref.listen<AuthState>(authStateProvider, (
      previousState,
      authState,
    ) {
      print("authState: $authState");
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
            context.goNamed(SignInRoute.info.name);
          } else {
            Future.delayed(const Duration(milliseconds: 300), () {
              //final navigator = Navigator.of(context, rootNavigator: true);
              //navigator.pushNamed(SignInRoutes.signInUserInfoPage, arguments: true);
              context.pushNamed(SignInRoute.info.name);
            });
          }
        },
        orElse: () => null,
      );
    });

    return AnnotatedRegion<SystemUiMode>(
      value: SystemUiMode.edgeToEdge,
      child: AnnotatedRegion<SystemUiOverlayStyle>(
        value: SystemUiOverlayStyle(
          statusBarBrightness: signInTheme.scaffoldBackgroundColor.brightness,
          statusBarColor: Colors.transparent,
          statusBarIconBrightness:
              signInTheme.scaffoldBackgroundColor.invertedBrightness,
          systemNavigationBarColor: signInTheme.scaffoldBackgroundColor,
          systemNavigationBarIconBrightness:
              signInTheme.scaffoldBackgroundColor.invertedBrightness,
        ),
        child: SafeArea(
          top: false,
          bottom: false,
          child: DecoratedBox(
            decoration: BoxDecoration(
              color: signInTheme.scaffoldBackgroundColor,
              image: signInTheme.backgroundImage != null
                  ? DecorationImage(
                      image: AssetImage(signInTheme.backgroundImage!),
                      fit: BoxFit.cover,
                    )
                  : null,
            ),
            child: Scaffold(
              backgroundColor: Colors.transparent,
              body: SafeArea(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 40.0),
                  child: child,
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class SignInDivider extends ConsumerWidget {
  const SignInDivider({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final theme = ref.watch(signInThemeProvider);

    return Container(
      color: theme.dividerColor,
      height: 0.5,
    );
  }
}
