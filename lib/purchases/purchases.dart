library purchases;

import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_app_core/flutter_app_core.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:purchases_flutter/purchases_flutter.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:url_launcher/url_launcher.dart';

part 'controllers/purchases_controller.dart';
part 'core/models/purchases_event.dart';
part 'core/models/purchases_settings.dart';
part 'core/models/purchases_state.dart';
part 'core/models/purchases_theme.dart';
part 'services/purchases_service.dart';
part 'widgets/cupertino_disclaimer.dart';
part 'widgets/buttons.dart';
part 'widgets/feature_tile.dart';
part 'widgets/price.dart';
part 'widgets/subscription_page_builder.dart';

part 'purchases.freezed.dart';
part 'purchases.g.dart';

const googlePlayURL = "https://play.google.com/store/account/subscriptions";
const appStoreURL = "https://apps.apple.com/account/subscriptions";

@Riverpod(keepAlive: true)
PurchasesSettings purchasesSettings(PurchasesSettingsRef ref) {
  throw UnimplementedError(
    "You need to override purchasesSettingsProvider before calling purchasesServiceProvider!",
  );
}

@Riverpod(keepAlive: true)
PurchasesService purchasesService(PurchasesServiceRef ref) {
  final settings = ref.watch(purchasesSettingsProvider);
  return PurchasesService(settings: settings);
}

final purchasesControllerProvider =
    StateNotifierProvider.autoDispose<PurchasesController, PurchasesState>(
        (ref) {
  final service = ref.watch(purchasesServiceProvider);
  return PurchasesController(service);
}, dependencies: [purchasesServiceProvider]);

@Riverpod(keepAlive: true, dependencies: [appTheme, formTheme])
PurchasesTheme purchasesTheme(PurchasesThemeRef ref) {
  final appTheme = ref.watch(appThemeProvider);

  return PurchasesTheme(
    primaryColor: appTheme.primaryColor,
    backgroundColor: appTheme.scaffoldBackgroundColor,
    textColor: appTheme.textColor,
    cupertinoDisclaimerColor: Colors.grey,
    textButtonColor: appTheme.primaryColor,
    featureBackgroundColor: Colors.transparent,
    featureTitleColor: appTheme.textColor,
    featureCaptionColor: Colors.grey,
    featureIconColor: appTheme.primaryColor,
    purchaseButtonBorderRadius: appTheme.elevatedButtonRadius,
  );
}
