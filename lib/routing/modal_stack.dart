part of app_router;

const minPaddingTop = 40.0;
const maxModalHeight = 650.0;

class ModalStack extends ConsumerWidget {
  const ModalStack({
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

    return AnimatedPadding(
      duration: insetAnimationDuration,
      curve: insetAnimationCurve,
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
    );
  }
}

/*
class Dialog extends StatelessWidget {
  /// Creates a dialog.
  ///
  /// Typically used in conjunction with [showDialog].
  const Dialog({
    super.key,
    this.backgroundColor,
    this.elevation,
    this.shadowColor,
    this.surfaceTintColor,
    this.insetAnimationDuration = const Duration(milliseconds: 100),
    this.insetAnimationCurve = Curves.decelerate,
    this.insetPadding = _defaultInsetPadding,
    this.clipBehavior = Clip.none,
    this.shape,
    this.alignment,
    this.child,
  }) : assert(clipBehavior != null),
       assert(elevation == null || elevation >= 0.0),
       _fullscreen = false;

  /// Creates a fullscreen dialog.
  ///
  /// Typically used in conjunction with [showDialog].
  const Dialog.fullscreen({
    super.key,
    this.backgroundColor,
    this.insetAnimationDuration = Duration.zero,
    this.insetAnimationCurve = Curves.decelerate,
    this.child,
  }) : elevation = 0,
       shadowColor = null,
       surfaceTintColor = null,
       insetPadding = EdgeInsets.zero,
       clipBehavior = Clip.none,
       shape = null,
       alignment = null,
       _fullscreen = true;

  /// {@template flutter.material.dialog.backgroundColor}
  /// The background color of the surface of this [Dialog].
  ///
  /// This sets the [Material.color] on this [Dialog]'s [Material].
  ///
  /// If `null`, [ThemeData.dialogBackgroundColor] is used.
  /// {@endtemplate}
  final Color? backgroundColor;

  /// {@template flutter.material.dialog.elevation}
  /// The z-coordinate of this [Dialog].
  ///
  /// Controls how far above the parent the dialog will appear. Elevation is
  /// represented by a drop shadow if [shadowColor] is non null,
  /// and a surface tint overlay on the background color if [surfaceTintColor] is
  /// non null.
  ///
  /// If null then [DialogTheme.elevation] is used, and if that is null then
  /// the elevation will match the Material Design specification for Dialogs.
  ///
  /// See also:
  ///   * [Material.elevation], which describes how [elevation] effects the
  ///     drop shadow or surface tint overlay.
  ///   * [shadowColor], color of the drop shadow used to indicate the elevation.
  ///   * [surfaceTintColor], color of an overlay on top of the background
  ///     color used to indicate the elevation.
  ///   * <https://m3.material.io/components/dialogs/overview>, the Material
  ///     Design specification for dialogs.
  /// {@endtemplate}
  final double? elevation;

  /// {@template flutter.material.dialog.shadowColor}
  /// The color used to paint a drop shadow under the dialog's [Material],
  /// which reflects the dialog's [elevation].
  ///
  /// If null and [ThemeData.useMaterial3] is true then no drop shadow will
  /// be rendered.
  ///
  /// If null and [ThemeData.useMaterial3] is false then it will default to
  /// [ThemeData.shadowColor].
  ///
  /// See also:
  ///   * [Material.shadowColor], which describes how the drop shadow is painted.
  ///   * [elevation], which affects how the drop shadow is painted.
  ///   * [surfaceTintColor], which can be used to indicate elevation through
  ///     tinting the background color.
  /// {@endtemplate}
  final Color? shadowColor;

  /// {@template flutter.material.dialog.surfaceTintColor}
  /// The color used as a surface tint overlay on the dialog's background color,
  /// which reflects the dialog's [elevation].
  ///
  /// If [ThemeData.useMaterial3] is false property has no effect.
  ///
  /// If null and [ThemeData.useMaterial3] is true then [ThemeData]'s
  /// [ColorScheme.surfaceTint] will be used.
  ///
  /// To disable this feature, set [surfaceTintColor] to [Colors.transparent].
  ///
  /// See also:
  ///   * [Material.surfaceTintColor], which describes how the surface tint will
  ///     be applied to the background color of the dialog.
  ///   * [elevation], which affects the opacity of the surface tint.
  ///   * [shadowColor], which can be used to indicate elevation through
  ///     a drop shadow.
  /// {@endtemplate}
  final Color? surfaceTintColor;

  /// {@template flutter.material.dialog.insetAnimationDuration}
  /// The duration of the animation to show when the system keyboard intrudes
  /// into the space that the dialog is placed in.
  ///
  /// Defaults to 100 milliseconds when [Dialog] is used, and [Duration.zero]
  /// when [Dialog.fullscreen] is used.
  /// {@endtemplate}
  final Duration insetAnimationDuration;

  /// {@template flutter.material.dialog.insetAnimationCurve}
  /// The curve to use for the animation shown when the system keyboard intrudes
  /// into the space that the dialog is placed in.
  ///
  /// Defaults to [Curves.decelerate].
  /// {@endtemplate}
  final Curve insetAnimationCurve;

  /// {@template flutter.material.dialog.insetPadding}
  /// The amount of padding added to [MediaQueryData.viewInsets] on the outside
  /// of the dialog. This defines the minimum space between the screen's edges
  /// and the dialog.
  ///
  /// Defaults to `EdgeInsets.symmetric(horizontal: 40.0, vertical: 24.0)`.
  /// {@endtemplate}
  final EdgeInsets? insetPadding;

  /// {@template flutter.material.dialog.clipBehavior}
  /// Controls how the contents of the dialog are clipped (or not) to the given
  /// [shape].
  ///
  /// See the enum [Clip] for details of all possible options and their common
  /// use cases.
  ///
  /// Defaults to [Clip.none], and must not be null.
  /// {@endtemplate}
  final Clip clipBehavior;

  /// {@template flutter.material.dialog.shape}
  /// The shape of this dialog's border.
  ///
  /// Defines the dialog's [Material.shape].
  ///
  /// The default shape is a [RoundedRectangleBorder] with a radius of 4.0
  /// {@endtemplate}
  final ShapeBorder? shape;

  /// {@template flutter.material.dialog.alignment}
  /// How to align the [Dialog].
  ///
  /// If null, then [DialogTheme.alignment] is used. If that is also null, the
  /// default is [Alignment.center].
  /// {@endtemplate}
  final AlignmentGeometry? alignment;

  /// The widget below this widget in the tree.
  ///
  /// {@macro flutter.widgets.ProxyWidget.child}
  final Widget? child;

  /// This value is used to determine if this is a fullscreen dialog.
  final bool _fullscreen;

  @override
  Widget build(BuildContext context) {
    final ThemeData theme = Theme.of(context);
    final DialogTheme dialogTheme = DialogTheme.of(context);
    final EdgeInsets effectivePadding = MediaQuery.of(context).viewInsets + (insetPadding ?? EdgeInsets.zero);
    final DialogTheme defaults = theme.useMaterial3
      ? (_fullscreen ? _DialogFullscreenDefaultsM3(context) : _DialogDefaultsM3(context))
      : _DialogDefaultsM2(context);

    Widget dialogChild;

    if (_fullscreen) {
      dialogChild = Material(
        color: backgroundColor ?? dialogTheme.backgroundColor ?? defaults.backgroundColor,
        child: child,
      );
    } else {
      dialogChild = Align(
        alignment: alignment ?? dialogTheme.alignment ?? defaults.alignment!,
        child: ConstrainedBox(
          constraints: const BoxConstraints(minWidth: 280.0),
          child: Material(
            color: backgroundColor ?? dialogTheme.backgroundColor ?? Theme.of(context).dialogBackgroundColor,
            elevation: elevation ?? dialogTheme.elevation ?? defaults.elevation!,
            shadowColor: shadowColor ?? dialogTheme.shadowColor ?? defaults.shadowColor,
            surfaceTintColor: surfaceTintColor ?? dialogTheme.surfaceTintColor ?? defaults.surfaceTintColor,
            shape: shape ?? dialogTheme.shape ?? defaults.shape!,
            type: MaterialType.card,
            clipBehavior: clipBehavior,
            child: child,
          ),
        ),
      );
    }

    return AnimatedPadding(
      padding: effectivePadding,
      duration: insetAnimationDuration,
      curve: insetAnimationCurve,
      child: MediaQuery.removeViewInsets(
        removeLeft: true,
        removeTop: true,
        removeRight: true,
        removeBottom: true,
        context: context,
        child: dialogChild,
      ),
    );
  }
}
*/