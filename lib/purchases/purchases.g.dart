// GENERATED CODE - DO NOT MODIFY BY HAND

part of purchases;

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$purchasesSettingsHash() => r'664e42b014657601ad28152caec4174b82cc542a';

/// See also [purchasesSettings].
@ProviderFor(purchasesSettings)
final purchasesSettingsProvider = Provider<PurchasesSettings>.internal(
  (_) => throw UnsupportedError(
    'The provider "purchasesSettingsProvider" is expected to get overridden/scoped, '
    'but was accessed without an override.',
  ),
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
String _$purchasesThemeHash() => r'3ebbd1dfb8d2e8a1740999ab9a0ac0153661b3c4';

/// See also [purchasesTheme].
@ProviderFor(purchasesTheme)
final purchasesThemeProvider = Provider<PurchasesTheme>.internal(
  purchasesTheme,
  name: r'purchasesThemeProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$purchasesThemeHash,
  dependencies: <ProviderOrFamily>[appThemeProvider],
  allTransitiveDependencies: <ProviderOrFamily>[appThemeProvider],
);

typedef PurchasesThemeRef = ProviderRef<PurchasesTheme>;
// ignore_for_file: unnecessary_raw_strings, subtype_of_sealed_class, invalid_use_of_internal_member, do_not_use_environment, prefer_const_constructors, public_member_api_docs, avoid_private_typedef_functions
