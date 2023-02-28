// GENERATED CODE - DO NOT MODIFY BY HAND

part of sign_in;

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$authSettingsHash() => r'ecc77c22c09d6c926d31d24ae6d306a93459dfba';

/// See also [authSettings].
@ProviderFor(authSettings)
final authSettingsProvider = Provider<AuthSettings>.internal(
  authSettings,
  name: r'authSettingsProvider',
  debugGetCreateSourceHash:
      const bool.fromEnvironment('dart.vm.product') ? null : _$authSettingsHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef AuthSettingsRef = ProviderRef<AuthSettings>;
String _$authStateHash() => r'4fc09ef0444d9d702bc728d7bcd46a5b4d637982';

/// See also [authState].
@ProviderFor(authState)
final authStateProvider = Provider<AuthState>.internal(
  authState,
  name: r'authStateProvider',
  debugGetCreateSourceHash:
      const bool.fromEnvironment('dart.vm.product') ? null : _$authStateHash,
  dependencies: <ProviderOrFamily>[authSettingsProvider],
  allTransitiveDependencies: <ProviderOrFamily>[authSettingsProvider],
);

typedef AuthStateRef = ProviderRef<AuthState>;
String _$authSplashHash() => r'6905c9eac6b00bc4d414621f90dff630b793c0eb';

/// See also [authSplash].
@ProviderFor(authSplash)
final authSplashProvider = Provider<AuthSplashState>.internal(
  authSplash,
  name: r'authSplashProvider',
  debugGetCreateSourceHash:
      const bool.fromEnvironment('dart.vm.product') ? null : _$authSplashHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef AuthSplashRef = ProviderRef<AuthSplashState>;
String _$signInThemeHash() => r'1ee8be66795bf5ae1b98d380383650f7360b06d9';

/// See also [signInTheme].
@ProviderFor(signInTheme)
final signInThemeProvider = Provider<SignInTheme>.internal(
  signInTheme,
  name: r'signInThemeProvider',
  debugGetCreateSourceHash:
      const bool.fromEnvironment('dart.vm.product') ? null : _$signInThemeHash,
  dependencies: <ProviderOrFamily>[appThemeProvider, formThemeProvider],
  allTransitiveDependencies: <ProviderOrFamily>[
    appThemeProvider,
    formThemeProvider
  ],
);

typedef SignInThemeRef = ProviderRef<SignInTheme>;
// ignore_for_file: unnecessary_raw_strings, subtype_of_sealed_class, invalid_use_of_internal_member, do_not_use_environment, prefer_const_constructors, public_member_api_docs, avoid_private_typedef_functions
