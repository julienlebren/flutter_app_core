part of layout_builder;

class PlatformSwitch
    extends PlatformWidgetBase<Switch, CupertinoSwitch, Switch> {
  const PlatformSwitch({
    super.key,
    required this.value,
    required this.onChanged,
  });

  final bool value;
  final ValueChanged<bool>? onChanged;

  @override
  Switch createMaterialWidget(BuildContext context, WidgetRef ref) {
    return Switch(
      value: value,
      onChanged: onChanged,
    );
  }

  @override
  CupertinoSwitch createCupertinoWidget(BuildContext context, WidgetRef ref) {
    return CupertinoSwitch(
      value: value,
      onChanged: onChanged,
    );
  }

  @override
  Switch createWebWidget(BuildContext context, WidgetRef ref) =>
      createMaterialWidget(context, ref);
}
