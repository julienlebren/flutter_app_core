part of layout_builder;

bool isChildOfCustomDialog(BuildContext context) =>
    context.findAncestorWidgetOfExactType<CustomDialog>() != null;

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

const _kDialogWidth = 600.0;
const _kDialogHeight = 750.0;
const _kDialogBorderRadius = 10.0;
const _kDialogPaddingMaxGap = 50.0;
const _kCupertinoExternalKeyboardHeight = 69.0;
const _kCupertinoKeyboardBottomPadding = 20.0;

Page openCustomDialog<T>(
  BuildContext context,
  GoRouterState state,
  Widget child,
) {
  final screenWidth = window.physicalSize.width / window.devicePixelRatio;
  if (screenWidth > _kDialogWidth) {
    return CustomTransitionPage(
      key: state.pageKey,
      transitionsBuilder: (_, animation, ___, ____) {
        const begin = Offset(0.0, 1.0);
        const end = Offset.zero;
        const curve = Curves.ease;

        var tween =
            Tween(begin: begin, end: end).chain(CurveTween(curve: curve));

        return SlideTransition(
          position: animation.drive(tween),
          child: CustomDialog(child: child),
        );
      },
      transitionDuration: const Duration(milliseconds: 200),
      barrierDismissible: true,
      barrierColor: Colors.black38,
      opaque: false,
      child: child,
    );
  } else if (isMaterial()) {
    return MaterialPage(
      key: state.pageKey,
      fullscreenDialog: true,
      child: child,
    );
  } else if (isCupertino()) {
    return CupertinoPage(
      key: state.pageKey,
      fullscreenDialog: true,
      child: child,
    );
  }

  return NoTransitionPage(
    key: state.pageKey,
    child: child,
  );
}

class CustomDialog extends ConsumerWidget {
  const CustomDialog({
    required this.child,
    this.insetAnimationDuration = const Duration(milliseconds: 200),
    this.insetAnimationCurve = Curves.decelerate,
    super.key,
  });

  final Widget child;
  final Duration insetAnimationDuration;
  final Curve insetAnimationCurve;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final screenWidth = window.physicalSize.width / window.devicePixelRatio;
    final screenHeight = window.physicalSize.height / window.devicePixelRatio;

    final keyboardHeight = MediaQuery.of(context).viewInsets.bottom;
    final availableHeight = screenHeight - keyboardHeight;
    final horizontalPadding = (screenWidth - _kDialogWidth) / 2;
    final verticalPadding = (screenHeight - _kDialogHeight) / 2;

    // We define the keyboard as opened only if it's more than 69 pixels
    // because when an external keyboard is connected to the iPad,
    // a language button is displayed on the bottom right corner,
    // which is considered in `viewInsets.bottom`.
    final isKeyboardOpen = keyboardHeight > _kCupertinoExternalKeyboardHeight;
    final isKeyboardHidingDialog = keyboardHeight > _kDialogHeight;

    double topPadding = verticalPadding;
    if (isKeyboardOpen) {
      if (availableHeight >= _kDialogHeight && isKeyboardHidingDialog) {
        topPadding = (availableHeight - _kDialogHeight);
      } else {
        topPadding = (verticalPadding - _kDialogPaddingMaxGap);
      }
    }

    double bottomPadding = verticalPadding;
    if (isKeyboardOpen) {
      if (availableHeight >= _kDialogHeight) {
        bottomPadding = verticalPadding + _kDialogPaddingMaxGap;
      } else {
        bottomPadding = (keyboardHeight -
            _kCupertinoKeyboardBottomPadding -
            _kDialogBorderRadius);
      }
    }

    // We put two ClipRRect here because the first one clips the
    // container which is moved up by the transform, and the second
    // one clips the child view
    return AnimatedPadding(
      duration: insetAnimationDuration,
      curve: insetAnimationCurve,
      padding: EdgeInsets.only(
        left: horizontalPadding,
        right: horizontalPadding,
        top: topPadding,
        bottom: bottomPadding,
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(_kDialogBorderRadius),
        child: Container(
          transform: Matrix4.translationValues(
              0.0, 3.0 - MediaQuery.of(context).padding.top, 0.0),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(_kDialogBorderRadius),
            child: child,
          ),
        ),
      ),
    );
  }
}
