part of layout_builder;

@freezed
class AppTheme with _$AppTheme {
  const factory AppTheme({
    required Brightness brightness,
    required Color primaryColor,
    required Color secondaryColor,
    required Color scaffoldBackgroundColor,
    Color? statusBarColor,
    Color? materialSystemBarColor,
    required Color navigationBarBackgroundColor,
    required Color navigationBarBorderColor,
    Color? cupertinoNavigationBarBackgroundColor,
    Color? webAppBarBackgroundColor,
    Color? tabBarBackgroundColor,
    Color? cupertinoTabBarBackgroundColor,
    required Color groupedListBackgroundColor,
    required Color listTileBackground,
    @Default(5.0) double elevatedButtonRadius,
    @Default(16.0) double elevatedButtonPadding,
    @Default(24.0) double searchBarRadius,
    required Color selectedColor,
    required Color borderColor,
    required Color textColor,
    required Color dividerColor,
    required Color shadowColor,
    required Color disclosureIndicatorColor,
  }) = _AppTheme;
}

@freezed
class ListViewTheme with _$ListViewTheme {
  const factory ListViewTheme({
    @Default(15) double separatorPadding,
    required Color labelColor,
    required Color valueColor,
    @Default(false) bool valueColorEnforced,
    @Default(17) double labelFontSize,
    required Color captionColor,
    @Default(13) double captionFontSize,
    @Default(1) int? labelMaxLines,
    @Default(1) int? captionMaxLines,
    @Default(EdgeInsets.only(left: 15, right: 8))
        EdgeInsetsGeometry cellPadding,
  }) = _ListViewTheme;
}

@freezed
class FormTheme with _$FormTheme {
  const factory FormTheme({
    required Color backgroundColor,
    required Color rowBackgroundColor,
    required Color rowDividerColor,
    required Color sectionDividerColor,
    @Default(15) double rowDividerPadding,
    @Default(true) bool displayRowDivider,
    @Default(10) double sectionDividerPadding, // 20 if gray background
    @Default(true) bool displaySectionDivider,
  }) = _FormTheme;
}
