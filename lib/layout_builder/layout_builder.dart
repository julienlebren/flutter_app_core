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
import 'package:go_router/go_router.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';
import 'package:numberpicker/numberpicker.dart';
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
