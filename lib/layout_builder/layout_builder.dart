library layout_builder;

import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_app_core/flutter_app_core.dart';
import 'package:flutter_app_core/routing/app_router.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';
import 'package:numberpicker/numberpicker.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:visibility_detector/visibility_detector.dart';

export 'constants/breakpoints.dart';
export 'package:google_fonts/google_fonts.dart' show GoogleFonts;

// Form widgets
part 'form/form_centered_button.dart';
part 'form/form_loader.dart';
part 'form/form_page.dart';
part 'form/form_row.dart';
part 'form/form_row_divider.dart';
part 'form/form_section.dart';
part 'form/form_section_divider.dart';
part 'form/form_switch.dart';
part 'form/form_tappable_field.dart';
part 'form/form_label_field.dart';

// Platform widgets
part 'platform/platform_activity_indicator.dart';
part 'platform/platform_alert_dialog.dart';
part 'platform/platform_app.dart';
part 'platform/platform_datetime_picker.dart';
part 'platform/platform_elevated_button.dart';
part 'platform/platform_icon_button.dart';
part 'platform/platform_icons.dart';
part 'platform/platform_grouped_list.dart';
part 'platform/platform_list_tile.dart';
part 'platform/platform_list_view.dart';
part 'platform/platform_modal_navigator.dart';
part 'platform/platform_modal_page.dart';
part 'platform/platform_modal_sheet.dart';
part 'platform/platform_multi_picker.dart';
part 'platform/platform_navigation_bar_button.dart';
part 'platform/platform_navigation_bar.dart';
part 'platform/platform_number_picker.dart';
part 'platform/platform_page.dart';
part 'platform/platform_picker_checkbox.dart';
part 'platform/platform_popup_menu.dart';
part 'platform/platform_route.dart';
part 'platform/platform_scaffold.dart';
part 'platform/platform_scrollbar.dart';
part 'platform/platform_search_bar.dart';
part 'platform/platform_sheet_alert.dart';
part 'platform/platform_single_picker.dart';
part 'platform/platform_switch.dart';
part 'platform/platform_tab_navigator.dart';
part 'platform/platform_tab_scaffold.dart';
part 'platform/platform_text_button.dart';
part 'platform/platform_textfield.dart';
part 'platform/platform_textstyle.dart';
part 'platform/platform_widget_base.dart';

// Theme
part 'theme/material_color.dart';
part 'theme/theme_providers.dart';
part 'theme/theme_type.dart';
part 'theme/theme.dart';

// Widgets
part 'widgets/loader.dart';
part 'widgets/network.dart';
part 'widgets/split_view.dart';

// Generated files
part 'layout_builder.freezed.dart';
part 'layout_builder.g.dart';

bool isMaterial() {
  return defaultTargetPlatform == TargetPlatform.android;
}

bool isCupertino() {
  return defaultTargetPlatform == TargetPlatform.iOS;
}

bool isWeb() {
  return kIsWeb;
}

bool isMacOs() {
  return !kIsWeb && defaultTargetPlatform == TargetPlatform.macOS;
}

bool isApple() {
  return isCupertino() || isMacOs();
}

bool isMobile() {
  return defaultTargetPlatform == TargetPlatform.iOS ||
      defaultTargetPlatform == TargetPlatform.android;
}

bool isTablet() {
  final data = MediaQueryData.fromWindow(WidgetsBinding.instance.window);
  return data.size.shortestSide > 600;
}

class UnsupportedPlatformException implements Exception {
  UnsupportedPlatformException();
}

final routeProvider = Provider<RouteFactory>((_) {
  throw UnimplementedError();
});

mixin FormElement {}

/// The provider of the [AppTheme]
/// Needs to be overridden in the [ProviderScope] of the app.
@Riverpod(keepAlive: true)
AppTheme appTheme(AppThemeRef ref) => throw UnimplementedError();

/// This provider is used by [Scaffold] or other widgets that handle
/// an [AnnotatedRegion] to specify the layout of status bars
/// and navigation bar on Android devices.
@Riverpod(keepAlive: true, dependencies: [appTheme])
SystemUiOverlayStyle systemOverlayStyle(SystemOverlayStyleRef ref) {
  final appTheme = ref.watch(appThemeProvider);

  // workaround because if the user is in dark mode and sets the theme of the app
  // to dark mode, a dark layer is applied to the color passed to systemNavigationBarColor
  // so we cannot get a full white. Instead of producing a weird behaviour with
  // dark buttons and dark background, we skip this feature and keep the black
  // navigation bar. Honestly, so few people will set light mode while their device
  // is in dark mode, isn't it?
  if (appTheme.brightness == Brightness.light &&
      WidgetsBinding.instance.window.platformBrightness == Brightness.dark) {
    return const SystemUiOverlayStyle(statusBarColor: Colors.transparent);
  } else {
    return SystemUiOverlayStyle(
      statusBarColor: appTheme.statusBarColor,
      systemNavigationBarColor: appTheme.materialSystemBarColor,
      systemNavigationBarIconBrightness: appTheme.materialSystemBarColor != null
          ? appTheme.materialSystemBarColor!.brightness
          : null,
    );
  }
}

/// The [ThemeData] that will be used in the [MaterialApp]
/// Retrieves all the data from the [AppTheme].
@Riverpod(keepAlive: true, dependencies: [appTheme])
ThemeData materialTheme(MaterialThemeRef ref) {
  final appTheme = ref.watch(appThemeProvider);
  return ThemeData(
    brightness: appTheme.brightness,
    scaffoldBackgroundColor: appTheme.scaffoldBackgroundColor,
    primarySwatch: createMaterialColor(appTheme.primaryColor),
    textTheme: kIsWeb ? GoogleFonts.poppinsTextTheme() : null,
    appBarTheme: AppBarTheme(
      toolbarHeight: kIsWeb ? 64 : null,
      shadowColor:
          kIsWeb ? Colors.transparent : appTheme.scaffoldBackgroundColor,
      backgroundColor: kIsWeb
          ? appTheme.webAppBarBackgroundColor
          : appTheme.navigationBarBackgroundColor,
      foregroundColor:
          appTheme.navigationBarBackgroundColor.computeLuminance() > 0.5
              ? Colors.black
              : Colors.white,
      iconTheme: IconThemeData(
        color: appTheme.navigationBarBackgroundColor.computeLuminance() > 0.5
            ? Colors.black
            : Colors.white,
      ),
      actionsIconTheme: IconThemeData(
        color: appTheme.navigationBarBackgroundColor.computeLuminance() > 0.5
            ? Colors.black
            : Colors.white,
      ),
    ),
    dividerColor: appTheme.dividerColor,
    unselectedWidgetColor: const Color(0xFF757575),
    bottomNavigationBarTheme: BottomNavigationBarThemeData(
      backgroundColor: appTheme.scaffoldBackgroundColor,
      elevation: 8,
      selectedIconTheme: IconThemeData(
        color: appTheme.primaryColor,
      ),
      selectedItemColor: appTheme.primaryColor,
    ),
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        foregroundColor: appTheme.primaryColor,
      ),
    ),
    textButtonTheme: TextButtonThemeData(
      style: TextButton.styleFrom(
        foregroundColor: appTheme.primaryColor,
      ),
    ),
  );
}

/// The [CupertinoThemeData] that will be used in the [CupertinoApp]
/// Retrieves all the data from the [AppTheme].
@Riverpod(keepAlive: true, dependencies: [appTheme])
CupertinoThemeData cupertinoTheme(CupertinoThemeRef ref) {
  final appTheme = ref.watch(appThemeProvider);
  return CupertinoThemeData(
    brightness: appTheme.brightness,
    primaryColor: appTheme.primaryColor,
    scaffoldBackgroundColor: appTheme.scaffoldBackgroundColor,
    barBackgroundColor: appTheme.cupertinoNavigationBarBackgroundColor,
    /*textTheme: CupertinoTextThemeData(
      primaryColor: appTheme.primaryColor,
      textStyle: GoogleFonts.poppins(),
    ),*/
  );
}

/// Theme with specific parameters for List that can be overridden
/// at any part of the app with inside a ProviderScope for specific needs
/// (such as have a greater padding in a view).
@Riverpod(keepAlive: true, dependencies: [appTheme])
ListViewTheme listViewTheme(ListViewThemeRef ref) {
  final appTheme = ref.watch(appThemeProvider);
  return ListViewTheme(
    labelColor: appTheme.textColor,
    valueColor: const Color(0xFF939393),
    captionColor: Colors.grey.shade600,
  );
}

/// Theme with specific parameters for Form hat can be overridden
/// at any part of the app with inside a ProviderScope for specific needs
/// (such as a special backgroundColor in one form).
@Riverpod(keepAlive: true, dependencies: [appTheme])
FormTheme formTheme(FormThemeRef ref) {
  final appTheme = ref.watch(appThemeProvider);
  if (appTheme.brightness == Brightness.dark) {
    return const FormTheme(
      backgroundColor: Color(0xFF000000),
      rowBackgroundColor: Color(0xFF262626),
      rowDividerColor: Color(0xFF333333),
      sectionDividerColor: Color(0xFF333333),
    );
  } else {
    return FormTheme(
      backgroundColor:
          isCupertino() ? const Color(0xFFF5F5F5) : const Color(0xFFFFFFFF),
      rowBackgroundColor: const Color(0xFFFFFFFF),
      rowDividerColor: const Color(0xFFE6E6E6),
      sectionDividerColor: const Color(0xFFE6E6E6),
    );
  }
}
