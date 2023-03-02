// GENERATED CODE - DO NOT MODIFY BY HAND

part of purchases;

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$purchasesSettingsHash() => r'0b5c1ac7be08fb891926b663f592e44b83347c4e';

/// See also [purchasesSettings].
@ProviderFor(purchasesSettings)
final purchasesSettingsProvider = Provider<PurchasesSettings>.internal(
  purchasesSettings,
  name: r'purchasesSettingsProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$purchasesSettingsHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef PurchasesSettingsRef = ProviderRef<PurchasesSettings>;
String _$purchasesServiceHash() => r'8cffbead69b4a7ecf59fff778f7fc97bbefac2b0';

/// See also [purchasesService].
@ProviderFor(purchasesService)
final purchasesServiceProvider = Provider<PurchasesService>.internal(
  purchasesService,
  name: r'purchasesServiceProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$purchasesServiceHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef PurchasesServiceRef = ProviderRef<PurchasesService>;
String _$purchasesThemeHash() => r'2c1f31bf29d27ac8445a4558f6e75c85e70bf774';

/// See also [purchasesTheme].
@ProviderFor(purchasesTheme)
final purchasesThemeProvider = Provider<PurchasesTheme>.internal(
  purchasesTheme,
  name: r'purchasesThemeProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$purchasesThemeHash,
  dependencies: <ProviderOrFamily>[appThemeProvider, formThemeProvider],
  allTransitiveDependencies: <ProviderOrFamily>[
    appThemeProvider,
    formThemeProvider
  ],
);

typedef PurchasesThemeRef = ProviderRef<PurchasesTheme>;
// ignore_for_file: unnecessary_raw_strings, subtype_of_sealed_class, invalid_use_of_internal_member, do_not_use_environment, prefer_const_constructors, public_member_api_docs, avoid_private_typedef_functions
