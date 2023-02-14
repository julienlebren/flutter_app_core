library flutter_app_core;

import 'package:flutter_app_core/l10n/flutter_app_core_l10n.dart';
import 'package:flutter_app_core/localization/localization.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

export 'ad_manager/ad_manager.dart';
export 'extensions/extensions.dart';
export 'firebase_storage_service/firebase_storage_service.dart';
export 'firestore_service/firestore_service.dart';
export 'layout_builder/layout_builder.dart';
export 'localization/localization.dart';
export 'notifications/notifications.dart';
export 'purchases/purchases.dart';
export 'sign_in/sign_in.dart';

part 'flutter_app_core.g.dart';

@Riverpod(keepAlive: true)
FlutterAppCoreLocalizations flutterAppCoreLocalizations(
    FlutterAppCoreLocalizationsRef ref) {
  final locale = ref.watch(localeProvider);
  return lookupFlutterAppCoreLocalizations(locale);
}
