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
String _$needUserInfoHash() => r'5071717346419634f801b6254f396490eebeeaa5';

/// See also [needUserInfo].
@ProviderFor(needUserInfo)
final needUserInfoProvider = Provider<bool?>.internal(
  needUserInfo,
  name: r'needUserInfoProvider',
  debugGetCreateSourceHash:
      const bool.fromEnvironment('dart.vm.product') ? null : _$needUserInfoHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef NeedUserInfoRef = ProviderRef<bool?>;
String _$userStreamHash() => r'7a2942a7174be930b9ab36509f37f5d384381d8f';

/// See also [userStream].
@ProviderFor(userStream)
final userStreamProvider = FutureProvider<dynamic>.internal(
  userStream,
  name: r'userStreamProvider',
  debugGetCreateSourceHash:
      const bool.fromEnvironment('dart.vm.product') ? null : _$userStreamHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef UserStreamRef = FutureProviderRef<dynamic>;
String _$authStateHash() => r'0d341ee63e6a43c64678f55b786b2ad05613047e';

/// See also [authState].
@ProviderFor(authState)
final authStateProvider = Provider<AuthState>.internal(
  authState,
  name: r'authStateProvider',
  debugGetCreateSourceHash:
      const bool.fromEnvironment('dart.vm.product') ? null : _$authStateHash,
  dependencies: <ProviderOrFamily>[needUserInfoProvider, userStreamProvider],
  allTransitiveDependencies: <ProviderOrFamily>[
    needUserInfoProvider,
    userStreamProvider
  ],
);

typedef AuthStateRef = ProviderRef<AuthState>;
String _$authSplashHash() => r'846fc0a868920ef80bd52d0cdb60bc5db90ac7a4';

/// See also [authSplash].
@ProviderFor(authSplash)
final authSplashProvider = Provider<AuthSplashState>.internal(
  authSplash,
  name: r'authSplashProvider',
  debugGetCreateSourceHash:
      const bool.fromEnvironment('dart.vm.product') ? null : _$authSplashHash,
  dependencies: <ProviderOrFamily>[authStateProvider],
  allTransitiveDependencies: <ProviderOrFamily>[
    authStateProvider,
    needUserInfoProvider,
    userStreamProvider
  ],
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
