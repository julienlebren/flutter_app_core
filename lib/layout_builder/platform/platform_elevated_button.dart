part of layout_builder;

class PlatformElevatedButton extends PlatformWidgetBase<ElevatedButton,
    CupertinoButton, ElevatedButton> {
  const PlatformElevatedButton({
    super.key,
    this.title,
    this.child,
    this.onPressed,
    this.color,
  }) : assert(child != null || title != null,
            'You must provide a title or a child.');

  final String? title;
  final Widget? child;
  final VoidCallback? onPressed;
  final Color? color;

  @override
  ElevatedButton createMaterialWidget(BuildContext context, WidgetRef ref) {
    final elevatedButtonRadius = ref.watch(
      appThemeProvider.select((appTheme) => appTheme.elevatedButtonRadius),
    );
    final elevatedButtonPadding = ref.watch(
      appThemeProvider.select((appTheme) => appTheme.elevatedButtonPadding),
    );
    final backgroundColor = color ??
        ref.watch(
          appThemeProvider.select((appTheme) => appTheme.primaryColor),
        );
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        backgroundColor: backgroundColor,
        foregroundColor: backgroundColor?.textColorFromBackgroundColor(),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(elevatedButtonRadius),
        ),
      ),
      onPressed: onPressed,
      child: Padding(
        padding: EdgeInsets.all(elevatedButtonPadding),
        child: child ??
            Text(
              title!,
              style: const TextStyle(
                fontSize: 17.0,
                fontWeight: FontWeight.w400,
              ),
            ),
      ),
    );
  }

  @override
  CupertinoButton createCupertinoWidget(BuildContext context, WidgetRef ref) {
    final elevatedButtonRadius = ref.watch(
      appThemeProvider.select((appTheme) => appTheme.elevatedButtonRadius),
    );
    final elevatedButtonPadding = ref.watch(
      appThemeProvider.select((appTheme) => appTheme.elevatedButtonPadding),
    );
    final primaryColor = ref.watch(
      appThemeProvider.select((appTheme) => appTheme.primaryColor),
    );
    return CupertinoButton(
      color: color ?? primaryColor,
      padding: EdgeInsets.all(elevatedButtonPadding),
      onPressed: onPressed,
      borderRadius: BorderRadius.circular(elevatedButtonRadius),
      child: child != null
          ? child!
          : Text(
              title!,
              style: const TextStyle(
                fontSize: 20.0,
                fontWeight: FontWeight.w400,
                letterSpacing: -0.5,
              ),
            ),
    );
  }

  @override
  ElevatedButton createWebWidget(BuildContext context, WidgetRef ref) =>
      createMaterialWidget(context, ref);
}

class PlatformFullSizedElevatedButton extends StatelessWidget {
  const PlatformFullSizedElevatedButton({
    super.key,
    required this.title,
    this.onPressed,
  });

  final String title;
  final VoidCallback? onPressed;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: PlatformElevatedButton(
        title: title,
        onPressed: onPressed,
      ),
    );
  }
}
