// GENERATED CODE - DO NOT MODIFY BY HAND

part of layout_builder;

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$appThemeHash() => r'4189b0877db3050070563cf1c2300b23ce580092';

/// The provider of the [AppTheme]
/// Needs to be overridden in the [ProviderScope] of the app.
///
/// Copied from [appTheme].
@ProviderFor(appTheme)
final appThemeProvider = Provider<AppTheme>.internal(
  appTheme,
  name: r'appThemeProvider',
  debugGetCreateSourceHash:
      const bool.fromEnvironment('dart.vm.product') ? null : _$appThemeHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef AppThemeRef = ProviderRef<AppTheme>;
String _$systemOverlayStyleHash() =>
    r'db28f542137066ca77767481e11bdcf6377e3ff0';

/// This provider is used by [Scaffold] or other widgets that handle
/// an [AnnotatedRegion] to specify the layout of status bars
/// and navigation bar on Android devices.
///
/// Copied from [systemOverlayStyle].
@ProviderFor(systemOverlayStyle)
final systemOverlayStyleProvider = Provider<SystemUiOverlayStyle>.internal(
  systemOverlayStyle,
  name: r'systemOverlayStyleProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$systemOverlayStyleHash,
  dependencies: <ProviderOrFamily>[appThemeProvider],
  allTransitiveDependencies: <ProviderOrFamily>[appThemeProvider],
);

typedef SystemOverlayStyleRef = ProviderRef<SystemUiOverlayStyle>;
String _$materialThemeHash() => r'5f47695a6be42a684e7396e72070a2e4e8dbe817';

/// The [ThemeData] that will be used in the [MaterialApp]
/// Retrieves all the data from the [AppTheme].
///
/// Copied from [materialTheme].
@ProviderFor(materialTheme)
final materialThemeProvider = Provider<ThemeData>.internal(
  materialTheme,
  name: r'materialThemeProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$materialThemeHash,
  dependencies: <ProviderOrFamily>[appThemeProvider],
  allTransitiveDependencies: <ProviderOrFamily>[appThemeProvider],
);

typedef MaterialThemeRef = ProviderRef<ThemeData>;
String _$cupertinoThemeHash() => r'9a8840e2cc224ff225fa94cd65f811ee857da498';

/// The [CupertinoThemeData] that will be used in the [CupertinoApp]
/// Retrieves all the data from the [AppTheme].
///
/// Copied from [cupertinoTheme].
@ProviderFor(cupertinoTheme)
final cupertinoThemeProvider = Provider<CupertinoThemeData>.internal(
  cupertinoTheme,
  name: r'cupertinoThemeProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$cupertinoThemeHash,
  dependencies: <ProviderOrFamily>[appThemeProvider],
  allTransitiveDependencies: <ProviderOrFamily>[appThemeProvider],
);

typedef CupertinoThemeRef = ProviderRef<CupertinoThemeData>;
String _$listViewThemeHash() => r'1979a08ae9b47e437c44707bd7f074a74c06f211';

/// Theme with specific parameters for List that can be overridden
/// at any part of the app with inside a ProviderScope for specific needs
/// (such as have a greater padding in a view).
///
/// Copied from [listViewTheme].
@ProviderFor(listViewTheme)
final listViewThemeProvider = Provider<ListViewTheme>.internal(
  listViewTheme,
  name: r'listViewThemeProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$listViewThemeHash,
  dependencies: <ProviderOrFamily>[appThemeProvider],
  allTransitiveDependencies: <ProviderOrFamily>[appThemeProvider],
);

typedef ListViewThemeRef = ProviderRef<ListViewTheme>;
String _$formThemeHash() => r'a51a4599927b89f0367f62c073120bdef72e260a';

/// Theme with specific parameters for Form hat can be overridden
/// at any part of the app with inside a ProviderScope for specific needs
/// (such as a special backgroundColor in one form).
///
/// Copied from [formTheme].
@ProviderFor(formTheme)
final formThemeProvider = Provider<FormTheme>.internal(
  formTheme,
  name: r'formThemeProvider',
  debugGetCreateSourceHash:
      const bool.fromEnvironment('dart.vm.product') ? null : _$formThemeHash,
  dependencies: <ProviderOrFamily>[appThemeProvider],
  allTransitiveDependencies: <ProviderOrFamily>[appThemeProvider],
);

typedef FormThemeRef = ProviderRef<FormTheme>;
// ignore_for_file: unnecessary_raw_strings, subtype_of_sealed_class, invalid_use_of_internal_member, do_not_use_environment, prefer_const_constructors, public_member_api_docs, avoid_private_typedef_functions
