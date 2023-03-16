part of app_router;

const minPaddingTop = 40.0;
const maxModalHeight = 650.0;

class ModalStack extends ConsumerWidget {
  const ModalStack({
    required this.child,
    super.key,
  });

  final Widget child;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final screenWidth = window.physicalSize.width / window.devicePixelRatio;
    final screenHeight = window.physicalSize.height / window.devicePixelRatio;

    ref.watch(keyboardVisibilityProvider).maybeWhen(
          data: (isVisible) => isVisible,
          orElse: () => false,
        );

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

    return /*Stack(
      children: [
        SizedBox(
          width: screenWidth,
          height: screenHeight,
          child: BackdropFilter(
            filter: ImageFilter.blur(sigmaX: 5, sigmaY: 5),
            child: Container(
              color: Colors.black.withOpacity(0.01),
            ),
          ),
        ),*/
        AnimatedPadding(
      duration: const Duration(milliseconds: 150),
      curve: Curves.linear,
      padding: EdgeInsets.only(
        left: (screenWidth - Breakpoints.modal) / 2,
        right: (screenWidth - Breakpoints.modal) / 2,
        top: topPadding,
        bottom: bottomPadding,
      ),
      child: ClipRect(
        child: Container(
          transform:
              isCupertino() ? Matrix4.translationValues(0.0, -20.0, 0.0) : null,
          child: child,
        ),
      ),
      //),
      //],
    );
  }
}
