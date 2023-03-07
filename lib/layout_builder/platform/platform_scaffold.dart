part of layout_builder;

class PlatformScaffold
    extends PlatformWidgetBase<AnnotatedRegion, Widget, AnnotatedRegion> {
  const PlatformScaffold({
    super.key,
    this.appBar,
    this.isModal = false,
    this.floatingActionButton,
    required this.body,
  });

  final bool isModal;
  final PlatformNavigationBar? appBar;
  final Widget? floatingActionButton;
  final Widget body;

  @override
  AnnotatedRegion createMaterialWidget(BuildContext context, WidgetRef ref) {
    final systemOverlayStyle = ref.watch(systemOverlayStyleProvider);

    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: systemOverlayStyle,
      child: Scaffold(
        appBar: appBar?.createMaterialWidget(context, ref),
        body: body,
        floatingActionButton: floatingActionButton,
        resizeToAvoidBottomInset: false,
      ),
    );
  }

  @override
  Widget createCupertinoWidget(BuildContext context, WidgetRef ref) {
    final appTheme = ref.watch(appThemeProvider);
    final formTheme = ref.watch(formThemeProvider);

    final backgroundColor = body is FormWithOverlay || body is FormPage
        ? formTheme.backgroundColor
        : appTheme.scaffoldBackgroundColor;

    return CupertinoPageScaffold(
      backgroundColor: backgroundColor,
      navigationBar: appBar?.createCupertinoWidget(context, ref),
      resizeToAvoidBottomInset: false,
      child: SafeArea(
        bottom: !isModal,
        child: body,
      ),
    );
  }

  @override
  AnnotatedRegion createWebWidget(BuildContext context, WidgetRef ref) =>
      createMaterialWidget(context, ref);
}

class PlatformModalScaffold extends PlatformScaffold {
  const PlatformModalScaffold({super.key, appBar, body, floatingActionButton})
      : super(
          appBar: appBar,
          body: body,
          floatingActionButton: floatingActionButton,
        );

  @override
  Widget createCupertinoWidget(BuildContext context, WidgetRef ref) {
    final appTheme = ref.watch(appThemeProvider);
    final formTheme = ref.watch(formThemeProvider);

    final backgroundColor = body is FormWithOverlay ||
            body is FormPage ||
            body is FormWithFixedFooter
        ? formTheme.backgroundColor
        : appTheme.scaffoldBackgroundColor;

    return Container(
      color: appTheme.navigationBarBackgroundColor,
      padding: EdgeInsets.only(top: appBar != null ? 10 : 0),
      child: CupertinoPageScaffold(
        backgroundColor: backgroundColor,
        navigationBar: appBar?.createCupertinoWidget(
          context,
          ref,
          isCupertinoModal: true,
        ),
        child: SafeArea(
          top: false,
          bottom: false,
          child: body,
        ),
      ),
    );
  }
}

class PlatformNetworkScaffold extends ConsumerWidget {
  const PlatformNetworkScaffold({
    super.key,
    this.appBar,
    this.isModal = false,
    this.floatingActionButton,
    required this.body,
  });

  final bool isModal;
  final PlatformNavigationBar? appBar;
  final Widget? floatingActionButton;
  final Widget body;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final hasConnection = ref.watch(connectionStatusProvider);

    return PlatformScaffold(
      appBar: PlatformNavigationBar(
        navigatorKey: appBar?.navigatorKey,
        title: appBar?.title,
        leading:
            (appBar?.leading != null && hasConnection ? appBar!.leading : null),
        trailing: (appBar?.trailing != null && hasConnection
            ? appBar!.trailing
            : null),
        hasBorder: appBar?.hasBorder ?? false,
      ),
      body: hasConnection ? body : const NetWorkError(),
    );
  }
}
