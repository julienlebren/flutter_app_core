part of layout_builder;

Page platformPage({
  required Widget child,
  bool fullscreenDialog = false,
  LocalKey? key,
}) {
  if (kIsWeb) {
    return NoTransitionPage(
      key: key,
      child: child,
    );
  } else if (isMaterial()) {
    return MaterialPage(
      key: key,
      fullscreenDialog: fullscreenDialog,
      child: child,
    );
  } else {
    return CupertinoPage(
      key: key,
      fullscreenDialog: fullscreenDialog,
      child: child,
    );
  }
}
