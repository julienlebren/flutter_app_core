// GENERATED CODE - DO NOT MODIFY BY HAND

part of layout_builder;

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$appThemeHash() => r'374903c0d774ef7e42f32991f90c42d595b6cde1';

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
    r'07459e47b01f44aacbfd67b95e6d9baa971c6e16';

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
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef SystemOverlayStyleRef = ProviderRef<SystemUiOverlayStyle>;
String _$materialThemeHash() => r'5747aa0bcbab0eb9327481f1763ed267e0a48679';

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
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef MaterialThemeRef = ProviderRef<ThemeData>;
String _$cupertinoThemeHash() => r'c33236a1e693a148beb90e4e2e51612f54257ae8';

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
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef CupertinoThemeRef = ProviderRef<CupertinoThemeData>;
String _$listViewThemeHash() => r'b830bd11e0017d1f4167df2ebfae3db523a0789a';

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
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef ListViewThemeRef = ProviderRef<ListViewTheme>;
String _$formThemeHash() => r'60d98ae6519d0eb2a8b29d54931129808d6a0eae';

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
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef FormThemeRef = ProviderRef<FormTheme>;
// ignore_for_file: unnecessary_raw_strings, subtype_of_sealed_class, invalid_use_of_internal_member, do_not_use_environment, prefer_const_constructors, public_member_api_docs, avoid_private_typedef_functions
