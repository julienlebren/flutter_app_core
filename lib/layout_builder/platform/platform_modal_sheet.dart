part of layout_builder;

void showPlatformModalSheet({
  required BuildContext context,
  required WidgetRef ref,
  String? title,
  required List<PlatformModalSheetAction> actions,
}) {
  if (isCupertino()) {
    showCupertinoModalPopup(
      context: context,
      useRootNavigator: true,
      builder: (BuildContext context) {
        return CupertinoActionSheet(
          title: title != null ? Text(title) : null,
          actions: actions,
          cancelButton: CupertinoActionSheetAction(
            child: Text(
              MaterialLocalizations.of(context)
                  .cancelButtonLabel
                  .toLowerCase()
                  .capitalize(),
              style: const TextStyle(
                fontSize: 19.0,
                fontWeight: FontWeight.w500,
                letterSpacing: -0.8,
              ),
            ),
            onPressed: () {
              Navigator.pop(context);
            },
          ),
        );
      },
    );
  } else {
    showModalBottomSheet(
      context: context,
      useRootNavigator: true,
      builder: (BuildContext context) {
        return Wrap(
          children: <Widget>[
            if (title != null)
              Padding(
                padding: const EdgeInsets.only(
                    top: 16, left: 20, right: 20, bottom: 10),
                child: Text(
                  title,
                  style: const TextStyle(
                    fontSize: 22.0,
                    fontWeight: FontWeight.w700,
                  ),
                ),
              ),
            for (Widget widget in actions) widget,
            Container(height: 20),
          ],
        );
      },
    );
  }
}

class PlatformModalSheet
    extends PlatformWidgetBase<Wrap, CupertinoActionSheet, Wrap> {
  const PlatformModalSheet({
    super.key,
    required this.title,
    required this.actions,
  });

  final String title;
  final List<PlatformModalSheetAction> actions;

  @override
  Wrap createMaterialWidget(BuildContext context, WidgetRef ref) {
    return Wrap(
      children: <Widget>[
        Padding(
          padding: const EdgeInsets.all(20),
          child: Text(
            title,
            style: const TextStyle(
              fontSize: 22.0,
              fontWeight: FontWeight.w700,
            ),
          ),
        ),
        for (Widget widget in actions) widget
      ],
    );
  }

  @override
  CupertinoActionSheet createCupertinoWidget(
      BuildContext context, WidgetRef ref) {
    return CupertinoActionSheet(
      title: Text(title),
      actions: actions,
    );
  }

  @override
  Wrap createWebWidget(BuildContext context, WidgetRef ref) =>
      createMaterialWidget(context, ref);
}

class PlatformModalSheetAction
    extends PlatformWidgetBase<ListTile, CupertinoActionSheetAction, ListTile> {
  const PlatformModalSheetAction({
    super.key,
    required this.title,
    this.icon,
    required this.onPressed,
    this.isDestructiveAction = false,
    this.isDefaultAction = false,
  });

  final String title;
  final IconData? icon;
  final VoidCallback onPressed;
  final bool isDestructiveAction;
  final bool isDefaultAction;

  @override
  ListTile createMaterialWidget(BuildContext context, WidgetRef ref) {
    return ListTile(
      leading: Icon(
        icon,
        color: isDestructiveAction ? Colors.red : null,
      ),
      title: Text(
        title,
        style: isDestructiveAction ? const TextStyle(color: Colors.red) : null,
      ),
      onTap: () {
        Navigator.of(context).pop();
        onPressed.call();
      },
    );
  }

  @override
  CupertinoActionSheetAction createCupertinoWidget(
      BuildContext context, WidgetRef ref) {
    return CupertinoActionSheetAction(
      onPressed: () {
        Navigator.of(context, rootNavigator: true).pop();
        onPressed.call();
      },
      isDefaultAction: isDefaultAction,
      isDestructiveAction: isDestructiveAction,
      child: Text(
        title,
        style: const TextStyle(
          fontSize: 19.0,
          letterSpacing: -0.8,
        ),
      ),
    );
  }

  @override
  ListTile createWebWidget(BuildContext context, WidgetRef ref) =>
      createMaterialWidget(context, ref);
}

void showPlatformModalPopup({
  required BuildContext context,
  required WidgetRef ref,
  required double height,
  String? title,
  VoidCallback? onPressed,
  required Widget child,
}) {
  final appTheme = ref.watch(appThemeProvider);
  final formTheme = ref.watch(formThemeProvider);
  showCupertinoModalPopup(
    context: context,
    builder: (context) {
      final safePadding = MediaQuery.of(context).padding.bottom;
      return Container(
        color: formTheme.rowBackgroundColor,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            if (onPressed != null || title != null)
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  if (title != null) ...[
                    Container(
                      padding: const EdgeInsets.all(15),
                      child: Text(
                        title,
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: appTheme.textColor,
                        ),
                      ),
                    ),
                  ],
                  const Spacer(),
                  if (onPressed != null)
                    CupertinoButton(
                      child: Text(
                        MaterialLocalizations.of(context).okButtonLabel,
                      ),
                      onPressed: () {
                        onPressed.call();
                      },
                    ),
                ],
              ),
            ProviderScope(
              overrides: [
                formThemeProvider.overrideWithValue(
                  formTheme.copyWith(rowDividerPadding: 0),
                )
              ],
              child: const FormRowDivider(),
            ),
            SizedBox(
              height: height + safePadding,
              child: Align(
                alignment: Alignment.topRight,
                child: child,
              ),
            ),
          ],
        ),
      );
    },
  );
}
