// GENERATED CODE - DO NOT MODIFY BY HAND

part of sign_in;

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$signInSuppliersHash() => r'3cc5220dc8b17b42ddaabf37f85a17c64a7a5f3b';

/// See also [signInSuppliers].
@ProviderFor(signInSuppliers)
final signInSuppliersProvider = Provider<List<SignInSupplier>>.internal(
  signInSuppliers,
  name: r'signInSuppliersProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$signInSuppliersHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef SignInSuppliersRef = ProviderRef<List<SignInSupplier>>;
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
String _$authSplashHash() => r'3b0eb4cde3bfa39dc1fc351c1dd18f884eaad7b3';

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
// ignore_for_file: unnecessary_raw_strings, subtype_of_sealed_class, invalid_use_of_internal_member, do_not_use_environment, prefer_const_constructors, public_member_api_docs, avoid_private_typedef_functions
