part of layout_builder;

class PlatformSearchBar
    extends PlatformWidgetBase<TextField, Container, TextField> {
  const PlatformSearchBar({
    super.key,
    required this.controller,
    this.focusNode,
    this.placeholder,
  });

  final TextEditingController controller;
  final FocusNode? focusNode;
  final String? placeholder;

  @override
  TextField createMaterialWidget(BuildContext context, WidgetRef ref) {
    return TextField(
      style: const TextStyle(fontSize: 18),
      focusNode: focusNode,
      controller: controller,
      decoration: InputDecoration(
        hintText: placeholder,
        focusedBorder: InputBorder.none,
        enabledBorder: InputBorder.none,
        suffixIcon: IconButton(
          onPressed: () => controller.clear(),
          icon: const Icon(Icons.clear, color: Colors.black, size: 24),
        ),
      ),
    );
  }

  @override
  Container createCupertinoWidget(BuildContext context, WidgetRef ref) {
    final searchBarRadius = ref.watch(appThemeProvider.select(
      (theme) => theme.searchBarRadius,
    ));

    return Container(
      color: CupertinoTheme.of(context).barBackgroundColor,
      padding: const EdgeInsets.only(
        left: 15,
        right: 15,
        bottom: 10,
      ),
      child: CupertinoSearchTextField(
        borderRadius: BorderRadius.circular(searchBarRadius),
        controller: controller,
        focusNode: focusNode,
        placeholder: placeholder,
      ),
    );
  }

  @override
  TextField createWebWidget(BuildContext context, WidgetRef ref) =>
      createMaterialWidget(context, ref);
}
