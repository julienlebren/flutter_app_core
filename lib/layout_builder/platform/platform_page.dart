part of layout_builder;

Page platformPage({
  required Widget child,
}) {
  if (isMaterial()) {
    return MaterialPage(
      child: child,
    );
  } else {
    return CupertinoPage(
      child: child,
    );
  }
}
