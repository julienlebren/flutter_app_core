library flutter_app_core;

import 'package:flutter_app_core/l10n/flutter_app_core_l10n.dart';
import 'package:flutter_app_core/localization/localization.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

export 'localization/localization.dart';
export 'notifications/notifications.dart';

part 'flutter_app_core.g.dart';

@Riverpod(keepAlive: true)
FlutterAppCoreLocalizations flutterAppCoreLocalizations(
    FlutterAppCoreLocalizationsRef ref) {
  final locale = ref.watch(localeProvider);
  return lookupFlutterAppCoreLocalizations(locale);
}
