// ignore_for_file: no_leading_underscores_for_local_identifiers

part of layout_builder;

@freezed
class TabItem with _$TabItem {
  const factory TabItem({
    required String title,
    required Widget icon,
    GlobalKey<NavigatorState>? navigatorKey,
    Widget? selectedIcon,
    PlatformTabNavigator? router,
    String? initialLocation,
    @Default(false) bool? popToFirstRoute,
  }) = _TabItem;
}

final appLogoProvider = Provider<Widget>((_) => const SizedBox.shrink());

final tabsProvider = Provider<List<TabItem>>((_) => []);

final scrollControllerProvider = StateProvider<ScrollController?>((_) {
  return null;
});

final currentTabIndexProvider = StateProvider<int>((_) => 0);

class PlatformTabScaffold
    extends PlatformWidgetBase<AnnotatedRegion, CupertinoTabScaffold, Widget> {
  const PlatformTabScaffold({
    Key? key,
  }) : super(key: key);

  ValueChanged<int>? onTap(int index, WidgetRef ref) {
    if (ref.read(currentTabIndexProvider) == index) {
      final tabs = ref.watch(tabsProvider);
      final router = tabs[index].router;
      final navigator = router!.navigatorKey.currentState!;

      final tab = tabs[index];
      final scrollController = ref.read(scrollControllerProvider);
      if (scrollController != null &&
          scrollController.hasClients &&
          scrollController.offset > 0) {
        scrollController.animateTo(
          0,
          duration: const Duration(milliseconds: 200),
          curve: Curves.ease,
        );
      } else if (tab.popToFirstRoute == true) {
        navigator.popUntil((route) => route.isFirst);
      } else {
        navigator.maybePop();
      }
    } else {
      ref.read(scrollControllerProvider.notifier).state = null;
      ref.read(currentTabIndexProvider.notifier).state = index;
    }
    return null;
  }

  @override
  AnnotatedRegion createMaterialWidget(BuildContext context, WidgetRef ref) {
    final systemOverlayStyle = ref.watch(systemOverlayStyleProvider);
    final appTheme = ref.watch(appThemeProvider);
    final currentTabIndex = ref.watch(currentTabIndexProvider.notifier).state;
    final tabs = ref.watch(tabsProvider);

    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: systemOverlayStyle,
      child: WillPopScope(
        onWillPop: () async {
          return true;
        },
        child: Scaffold(
          body: Stack(
            children: tabs.asMap().entries.map((entry) {
              return Offstage(
                offstage: currentTabIndex != entry.key,
                child: entry.value.router,
              );
            }).toList(),
          ),
          bottomNavigationBar: BottomNavigationBar(
            backgroundColor: appTheme.tabBarBackgroundColor ??
                appTheme.scaffoldBackgroundColor,
            showUnselectedLabels: true,
            selectedFontSize: 12,
            unselectedFontSize: 12,
            currentIndex: currentTabIndex,
            type: BottomNavigationBarType.fixed,
            iconSize: 30,
            onTap: (index) => onTap(index, ref),
            items: tabs.map((item) => _tabItem(item)).toList(),
          ),
        ),
      ),
    );
  }

  @override
  CupertinoTabScaffold createCupertinoWidget(
      BuildContext context, WidgetRef ref) {
    final tabs = ref.watch(tabsProvider);
    final appTheme = ref.watch(appThemeProvider);
    final currentTabIndex = ref.watch(currentTabIndexProvider);
    final _controller = CupertinoTabController(initialIndex: currentTabIndex);

    ref.listen<int>(currentTabIndexProvider, (_, tabIndex) {
      _controller.index = tabIndex;
    });

    return CupertinoTabScaffold(
      controller: _controller,
      tabBar: CupertinoTabBar(
        //currentIndex: currentTabIndex,
        onTap: (index) => onTap(index, ref),
        backgroundColor: appTheme.cupertinoTabBarBackgroundColor,
        inactiveColor: Colors.grey,
        iconSize: 30,
        items: tabs.map((item) => _tabItem(item)).toList(),
        border: Border(
          top: BorderSide(color: appTheme.navigationBarBorderColor),
        ),
      ),
      tabBuilder: (_, index) => tabs[index].router!,
    );
  }

  @override
  Widget createWebWidget(
    BuildContext context,
    WidgetRef ref,
  ) {
    final tabs = ref.watch(tabsProvider);
    final currentTabIndex = ref.watch(currentTabIndexProvider);
    final appLogo = ref.watch(appLogoProvider);
    final padding = context.sliverHorizontalPadding();

    return Scaffold(
      appBar: AppBar(
        leadingWidth: padding + 200,
        leading: Padding(
          padding: EdgeInsets.only(left: padding),
          child: appLogo,
        ),
        actions: [
          for (TabItem tab in tabs) ...[
            NavigationLink(item: tab),
          ],
          SizedBox(width: padding),
        ],
      ),
      body: Stack(
        children: tabs.asMap().entries.map((entry) {
          return Offstage(
            offstage: currentTabIndex != entry.key,
            child: entry.value.router,
          );
        }).toList(),
      ),
    );
  }

  BottomNavigationBarItem _tabItem(TabItem item) {
    return BottomNavigationBarItem(
      icon: Padding(
        padding: const EdgeInsets.symmetric(vertical: 3),
        child: item.icon,
      ),
      label: item.title,
    );
  }
}

class PlatformTabScaffold2
    extends PlatformWidgetBase<AnnotatedRegion, CupertinoTabScaffold, Widget> {
  const PlatformTabScaffold2({
    Key? key,
    required this.child,
  }) : super(key: key);

  final Widget child;

  ValueChanged<int>? onTap(int index, WidgetRef ref) {
    if (ref.read(currentTabIndexProvider) == index) {
      final tabs = ref.watch(tabsProvider);
      final router = tabs[index].router;
      final navigator = router!.navigatorKey.currentState!;

      final tab = tabs[index];
      final scrollController = ref.read(scrollControllerProvider);
      if (scrollController != null &&
          scrollController.hasClients &&
          scrollController.offset > 0) {
        scrollController.animateTo(
          0,
          duration: const Duration(milliseconds: 200),
          curve: Curves.ease,
        );
      } else if (tab.popToFirstRoute == true) {
        navigator.popUntil((route) => route.isFirst);
      } else {
        navigator.maybePop();
      }
    } else {
      ref.read(scrollControllerProvider.notifier).state = null;
      ref.read(currentTabIndexProvider.notifier).state = index;
    }
    return null;
  }

  @override
  AnnotatedRegion createMaterialWidget(BuildContext context, WidgetRef ref) {
    final systemOverlayStyle = ref.watch(systemOverlayStyleProvider);
    final appTheme = ref.watch(appThemeProvider);
    final currentTabIndex = ref.watch(currentTabIndexProvider.notifier).state;
    final tabs = ref.watch(tabsProvider);

    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: systemOverlayStyle,
      child: WillPopScope(
        onWillPop: () async {
          return true;
        },
        child: Scaffold(
          body: Stack(
            children: tabs.asMap().entries.map((entry) {
              return Offstage(
                offstage: currentTabIndex != entry.key,
                child: entry.value.router,
              );
            }).toList(),
          ),
          bottomNavigationBar: BottomNavigationBar(
            backgroundColor: appTheme.tabBarBackgroundColor ??
                appTheme.scaffoldBackgroundColor,
            showUnselectedLabels: true,
            selectedFontSize: 12,
            unselectedFontSize: 12,
            currentIndex: currentTabIndex,
            type: BottomNavigationBarType.fixed,
            iconSize: 30,
            onTap: (index) => onTap(index, ref),
            items: tabs.map((item) => _tabItem(item)).toList(),
          ),
        ),
      ),
    );
  }

  @override
  CupertinoTabScaffold createCupertinoWidget(
      BuildContext context, WidgetRef ref) {
    final tabs = ref.watch(tabsProvider);
    final appTheme = ref.watch(appThemeProvider);
    final currentTabIndex = ref.watch(currentTabIndexProvider);
    final _controller = CupertinoTabController(initialIndex: currentTabIndex);

    ref.listen<int>(currentTabIndexProvider, (_, tabIndex) {
      _controller.index = tabIndex;
    });

    return CupertinoTabScaffold(
      controller: _controller,
      tabBar: CupertinoTabBar(
        currentIndex: currentTabIndex,
        onTap: (index) => onTap(index, ref),
        backgroundColor: appTheme.cupertinoTabBarBackgroundColor,
        inactiveColor: Colors.grey,
        iconSize: 30,
        items: tabs.map((item) => _tabItem(item)).toList(),
        border: Border(
          top: BorderSide(color: appTheme.navigationBarBorderColor),
        ),
      ),
      tabBuilder: (_, __) => child,
    );
  }

  @override
  Widget createWebWidget(
    BuildContext context,
    WidgetRef ref,
  ) {
    final tabs = ref.watch(tabsProvider);
    final currentTabIndex = ref.watch(currentTabIndexProvider);
    final appLogo = ref.watch(appLogoProvider);
    final padding = context.sliverHorizontalPadding();

    return Scaffold(
      appBar: AppBar(
        leadingWidth: padding + 200,
        leading: Padding(
          padding: EdgeInsets.only(left: padding),
          child: appLogo,
        ),
        actions: [
          for (TabItem tab in tabs) ...[
            NavigationLink(item: tab),
          ],
          SizedBox(width: padding),
        ],
      ),
      body: Stack(
        children: tabs.asMap().entries.map((entry) {
          return Offstage(
            offstage: currentTabIndex != entry.key,
            child: entry.value.router,
          );
        }).toList(),
      ),
    );
  }

  BottomNavigationBarItem _tabItem(TabItem item) {
    return BottomNavigationBarItem(
      icon: Padding(
        padding: const EdgeInsets.symmetric(vertical: 3),
        child: item.icon,
      ),
      label: item.title,
    );
  }
}

class NavigationLink extends ConsumerWidget {
  const NavigationLink({
    required this.item,
    super.key,
  });

  final TabItem item;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final appTheme = ref.watch(appThemeProvider);

    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: 5,
        vertical: 14,
      ),
      child: TextButton(
        style: ButtonStyle(
          backgroundColor: MaterialStateProperty.resolveWith<Color?>(
            (Set<MaterialState> states) {
              if (states.contains(MaterialState.hovered)) {
                return Theme.of(context).colorScheme.primary.withOpacity(0.7);
              }
              return null; // Use the component's default.
            },
          ),
          foregroundColor: MaterialStateProperty.resolveWith<Color?>(
            (Set<MaterialState> states) {
              if (states.contains(MaterialState.hovered)) {
                return Colors.white;
              }
              return appTheme.textColor; // Use the component's default.
            },
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: 8,
          ),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              item.icon,
              const SizedBox(width: 10),
              Text(
                item.title,
                style:
                    const TextStyle(fontSize: 17, fontWeight: FontWeight.w500),
              ),
            ],
          ),
        ),
        onPressed: () {},
      ),
    );
  }
}

class WebAppBar extends ConsumerWidget implements PreferredSizeWidget {
  const WebAppBar({
    Key? key,
  }) : super(key: key);

  @override
  Size get preferredSize => const Size(double.infinity, 64);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final appLogo = ref.watch(appLogoProvider);
    final tabs = ref.watch(tabsProvider);
    final navigationBarBackgroundColor = ref.watch(
      appThemeProvider.select((theme) => theme.webAppBarBackgroundColor),
    );

    return Container(
      color: navigationBarBackgroundColor,
      height: 150,
      child: Padding(
        padding: EdgeInsets.symmetric(
          horizontal: context.sliverHorizontalPadding(),
        ),
        child: Row(
          children: [
            appLogo,
            const Spacer(),
            for (TabItem tab in tabs) ...[
              _navigationLink(tab),
            ]
          ],
        ),
      ),
    );
  }

  SizedBox _navigationLink(TabItem item) {
    return SizedBox(
      height: 48,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8),
        child: TextButton(
          child: Text(
            item.title,
          ),
          onPressed: () {},
        ),
      ),
    );
  }
}
