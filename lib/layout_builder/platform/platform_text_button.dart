part of layout_builder;

class PlatformTextButton
    extends PlatformWidgetBase<TextButton, CupertinoButton, TextButton> {
  const PlatformTextButton({
    super.key,
    required this.title,
    required this.onPressed,
    this.textAlign = TextAlign.center,
    this.fontSize = 16.0,
    this.padding = 16.0,
    this.color,
  });

  final String title;
  final VoidCallback? onPressed;
  final TextAlign textAlign;
  final double fontSize;
  final double padding;
  final Color? color;

  @override
  TextButton createMaterialWidget(BuildContext context, WidgetRef ref) {
    return TextButton(
      onPressed: onPressed,
      style: TextButton.styleFrom(
        padding: EdgeInsets.all(padding),
        foregroundColor: color,
        textStyle: TextStyle(
          fontFamily: Theme.of(context).textTheme.bodyMedium?.fontFamily,
          fontSize: fontSize,
        ),
      ),
      child: Text(
        title,
        textAlign: textAlign,
      ),
    );
  }

  @override
  CupertinoButton createCupertinoWidget(BuildContext context, WidgetRef ref) {
    return CupertinoButton(
      padding: EdgeInsets.all(padding),
      alignment: Alignment.center,
      disabledColor: const Color(0xFFBDBDBD),
      onPressed: onPressed,
      child: Text(
        title,
        textAlign: textAlign,
        style: TextStyle(
          fontSize: fontSize,
          color: color,
        ),
      ),
    );
  }

  @override
  TextButton createWebWidget(BuildContext context, WidgetRef ref) =>
      createMaterialWidget(context, ref);
}
