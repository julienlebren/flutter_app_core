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

const minPaddingTop = 40.0;
const maxModalHeight = 750.0;
const maxModalWidth = 600.0;

class PlatformDialogPage<T> extends NoTransitionPage<T> {
  PlatformDialogPage({
    required super.child,
    super.key,
  }) {
    final screenWidth = window.physicalSize.width / window.devicePixelRatio;
    if (screenWidth > maxModalWidth) {
      CustomTransitionPage(
        transitionsBuilder: _transitionsBuilder,
        transitionDuration: const Duration(microseconds: 200),
        barrierDismissible: true,
        barrierColor: Colors.black38,
        opaque: false,
        child: child,
      );
    } else if (isMaterial()) {
      MaterialPage(
        key: key,
        fullscreenDialog: true,
        child: child,
      );
    } else {
      CupertinoPage(
        key: key,
        fullscreenDialog: true,
        child: child,
      );
    }
  }

  static Widget _transitionsBuilder(
      BuildContext context,
      Animation<double> animation,
      Animation<double> secondaryAnimation,
      Widget child) {
    const begin = Offset(0.0, 1.0);
    const end = Offset.zero;
    const curve = Curves.ease;

    var tween = Tween(begin: begin, end: end).chain(CurveTween(curve: curve));

    return SlideTransition(
      position: animation.drive(tween),
      child: CustomDialog(child: child),
    );
  }
}

class CustomDialog extends ConsumerWidget {
  const CustomDialog({
    required this.child,
    this.insetAnimationDuration = const Duration(milliseconds: 100),
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
    final modalHeight = availableHeight > (maxModalHeight + minPaddingTop)
        ? maxModalHeight
        : (availableHeight - minPaddingTop);

    final verticalPadding = (screenHeight - modalHeight) / 2;
    double topPadding =
        modalHeight < maxModalHeight ? minPaddingTop : verticalPadding;
    double bottomPadding =
        modalHeight < maxModalHeight ? keyboardHeight : verticalPadding;
    double horizontalPadding = (screenWidth - maxModalWidth) / 2;

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
        borderRadius: BorderRadius.circular(10),
        child: Container(
          transform:
              isCupertino() ? Matrix4.translationValues(0.0, -20.0, 0.0) : null,
          child: child,
        ),
      ),
    );
  }
}
