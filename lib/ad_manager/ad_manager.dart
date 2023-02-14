library ad_manager;

import 'dart:io' show Platform;

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

export 'package:google_mobile_ads/google_mobile_ads.dart' show MobileAds;

part 'widgets/inline_adaptive.dart';
part 'widgets/intersticial_container.dart';

part 'ad_manager.freezed.dart';
part 'ad_manager.g.dart';

@freezed
class AdSettings with _$AdSettings {
  factory AdSettings({
    @Default(3) maxFailedLoadAttempts,
    String? intersticialMaterial,
    String? intersticialCupertino,
    String? bannerMaterial,
    String? bannerCupertino,
    String? rewardMaterial,
    String? rewardCupertino,
    VoidCallback? updateLastAdsTime,
  }) = _AdSettings;
}

@riverpod
AdSettings adSettings(AdSettingsRef ref) => throw UnimplementedError();
