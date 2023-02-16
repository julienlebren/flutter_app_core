// GENERATED CODE - DO NOT MODIFY BY HAND

part of localization;

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$supportedLocalesHash() => r'a74acd4948a2bfdfc1b3f7126d3cacbf156a16e5';

/// The default locales available in the apps that are using this package
/// I always develop my apps in english as native language and provide
/// a french translation since I am french 🇫🇷🙈
/// But it can be overridden in the main [ProviderScope] of the app if needed.
///
/// Copied from [supportedLocales].
@ProviderFor(supportedLocales)
final supportedLocalesProvider = Provider<List<Locale>>.internal(
  supportedLocales,
  name: r'supportedLocalesProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$supportedLocalesHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef SupportedLocalesRef = ProviderRef<List<Locale>>;
String _$userLocaleHash() => r'd40a5373168f41e3ebde08af8e860fd90f2447e7';

/// The locale provided by the user settings (not the device locale, which
/// is provided by window.locale, but the locale defined in the user settings)
///
/// Copied from [userLocale].
@ProviderFor(userLocale)
final userLocaleProvider = Provider<Locale?>.internal(
  userLocale,
  name: r'userLocaleProvider',
  debugGetCreateSourceHash:
      const bool.fromEnvironment('dart.vm.product') ? null : _$userLocaleHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef UserLocaleRef = ProviderRef<Locale?>;
String _$localeHash() => r'6d724633e11e812fa0dc912c73985d01a5c92a33';

/// The provider of the [Locale] which will be watched by the `localizationProvider`
/// in the app and the packages which are using localization.
///
/// Copied from [locale].
@ProviderFor(locale)
final localeProvider = Provider<Locale>.internal(
  locale,
  name: r'localeProvider',
  debugGetCreateSourceHash:
      const bool.fromEnvironment('dart.vm.product') ? null : _$localeHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef LocaleRef = ProviderRef<Locale>;
String _$flutterAppCoreLocalizationsHash() =>
    r'670cc3b5904455ead19df6ef50ba83342bd32f6c';

/// See also [flutterAppCoreLocalizations].
@ProviderFor(flutterAppCoreLocalizations)
final flutterAppCoreLocalizationsProvider =
    Provider<FlutterAppCoreLocalizations>.internal(
  flutterAppCoreLocalizations,
  name: r'flutterAppCoreLocalizationsProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$flutterAppCoreLocalizationsHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef FlutterAppCoreLocalizationsRef
    = ProviderRef<FlutterAppCoreLocalizations>;
// ignore_for_file: unnecessary_raw_strings, subtype_of_sealed_class, invalid_use_of_internal_member, do_not_use_environment, prefer_const_constructors, public_member_api_docs, avoid_private_typedef_functions
