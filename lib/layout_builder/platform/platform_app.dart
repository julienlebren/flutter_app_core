part of layout_builder;

class PlatformApp
    extends PlatformWidgetBase<MaterialApp, CupertinoApp, MaterialApp> {
  const PlatformApp({
    super.key,
    this.initialRoute,
    required this.onGenerateRoute,
    this.localizationsDelegates,
    required this.supportedLocales,
    this.navigatorKey,
    this.builder,
    this.locale,
    this.home,
  }) : assert(initialRoute != null || home != null);

  final String? initialRoute;
  final RouteFactory onGenerateRoute;
  final Iterable<LocalizationsDelegate<dynamic>>? localizationsDelegates;
  final Iterable<Locale> supportedLocales;
  final GlobalKey<NavigatorState>? navigatorKey;
  final Widget Function(BuildContext context, Widget? child)? builder;
  final Locale? locale;
  final Widget? home;

  @override
  MaterialApp createMaterialWidget(BuildContext context, WidgetRef ref) {
    final materialTheme = ref.watch(materialThemeProvider);
    final goRouter = ref.watch(goRouterProvider());
    return MaterialApp.router(
      routerConfig: goRouter,
      locale: locale,
      localizationsDelegates: localizationsDelegates,
      supportedLocales: supportedLocales,
      debugShowCheckedModeBanner: false,
      theme: materialTheme,
      builder: builder,
    );

    /*return ProviderScope(
      overrides: [
        routeProvider.overrideWithValue(onGenerateRoute),
      ],
      child: MaterialApp(
        locale: locale,
        navigatorKey: navigatorKey,
        localizationsDelegates: localizationsDelegates,
        supportedLocales: supportedLocales,
        debugShowCheckedModeBanner: false,
        theme: materialTheme,
        builder: builder,
        initialRoute: initialRoute,
        onGenerateRoute: onGenerateRoute,
        home: home,
      ),
    );*/
  }

  @override
  CupertinoApp createCupertinoWidget(BuildContext context, WidgetRef ref) {
    final cupertinoTheme = ref.watch(cupertinoThemeProvider);
    final currentTabIndex = ref.watch(currentTabIndexProvider);
    final currentTab = ref.watch(tabsProvider)[currentTabIndex];
    final goRouter = ref.watch(goRouterProvider(tabItem: currentTab));
    return CupertinoApp.router(
      routerConfig: goRouter,
      locale: locale,
      localizationsDelegates: localizationsDelegates,
      supportedLocales: supportedLocales,
      debugShowCheckedModeBanner: false,
      theme: cupertinoTheme,
      builder: builder,
    );

    /*return ProviderScope(
      overrides: [
        routeProvider.overrideWithValue(onGenerateRoute),
      ],
      child: CupertinoApp(
        locale: locale,
        navigatorKey: navigatorKey,
        localizationsDelegates: localizationsDelegates,
        supportedLocales: supportedLocales,
        debugShowCheckedModeBanner: false,
        theme: cupertinoTheme,
        builder: builder,
        initialRoute: initialRoute,
        onGenerateRoute: onGenerateRoute,
        home: home,
      ),
    );*/
  }

  @override
  MaterialApp createWebWidget(BuildContext context, WidgetRef ref) =>
      createMaterialWidget(context, ref);
}
