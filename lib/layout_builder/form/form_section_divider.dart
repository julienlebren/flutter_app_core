part of layout_builder;

class FormSectionDivider extends PlatformWidgetBase<Widget, SizedBox, Widget> {
  const FormSectionDivider({Key? key}) : super(key: key);

  @override
  Widget createMaterialWidget(BuildContext context, WidgetRef ref) {
    final formTheme = ref.watch(formThemeProvider);
    if (formTheme.displaySectionDivider) {
      return Padding(
        padding: EdgeInsets.only(
          top: 0,
          bottom: formTheme.sectionDividerPadding,
        ), // 20 if gray background
        child: Container(
          width: double.infinity,
          height: 1,
          decoration: BoxDecoration(
            color: formTheme.sectionDividerColor,
            boxShadow: [
              BoxShadow(
                color: formTheme.sectionDividerColor,
                blurRadius: 1,
                offset: const Offset(0, 1),
              ),
            ],
          ),
        ),
      );
    } else {
      return const SizedBox.shrink();
    }
  }

  @override
  SizedBox createCupertinoWidget(BuildContext context, WidgetRef ref) {
    return const SizedBox(height: 18);
  }

  @override
  Widget createWebWidget(BuildContext context, WidgetRef ref) =>
      createMaterialWidget(context, ref);
}
