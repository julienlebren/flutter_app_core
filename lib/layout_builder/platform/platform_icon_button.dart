part of layout_builder;

class PlatformIconButton
    extends PlatformWidgetBase<IconButton, CupertinoButton, IconButton> {
  const PlatformIconButton({
    super.key,
    required this.icon,
    this.color,
    this.size = 28,
    this.onPressed,
  });

  final IconData icon;
  final double? size;
  final Color? color;
  final VoidCallback? onPressed;

  @override
  IconButton createMaterialWidget(BuildContext context, WidgetRef ref) {
    return IconButton(
      icon: Icon(icon),
      color: color,
      iconSize: size,
      onPressed: onPressed,
    );
  }

  @override
  CupertinoButton createCupertinoWidget(BuildContext context, WidgetRef ref) {
    return CupertinoButton(
      padding: EdgeInsets.zero,
      onPressed: onPressed,
      borderRadius: BorderRadius.circular(32.0),
      child: Icon(
        icon,
        size: size,
        color: color,
      ),
    );
  }

  @override
  IconButton createWebWidget(BuildContext context, WidgetRef ref) =>
      createMaterialWidget(context, ref);
}

class PlatformIconPlainButton extends PlatformWidgetBase<RawMaterialButton,
    CupertinoButton, RawMaterialButton> {
  const PlatformIconPlainButton({
    super.key,
    required this.icon,
    this.onPressed,
    this.backgroundColor = Colors.transparent,
    this.color = Colors.black,
    this.size = 22,
  });
  final IconData icon;
  final VoidCallback? onPressed;
  final Color backgroundColor;
  final Color color;
  final double size;

  @override
  RawMaterialButton createMaterialWidget(BuildContext context, WidgetRef ref) {
    return RawMaterialButton(
      onPressed: onPressed,
      fillColor: backgroundColor,
      padding: const EdgeInsets.all(8.0),
      shape: const CircleBorder(),
      child: Icon(icon, color: color, size: size),
    );
  }

  @override
  CupertinoButton createCupertinoWidget(BuildContext context, WidgetRef ref) {
    return CupertinoButton(
      color: backgroundColor,
      padding: const EdgeInsets.all(6.0),
      onPressed: onPressed,
      borderRadius: BorderRadius.circular(size + 4),
      minSize: 28,
      child: Icon(icon, color: color, size: size + 2),
    );
  }

  @override
  RawMaterialButton createWebWidget(BuildContext context, WidgetRef ref) =>
      createMaterialWidget(context, ref);
}
