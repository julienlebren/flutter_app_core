// GENERATED CODE - DO NOT MODIFY BY HAND

part of sign_in;

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_FirestoreUser _$$_FirestoreUserFromJson(Map<String, dynamic> json) =>
    _$_FirestoreUser(
      id: json['id'] as String?,
      displayName: json['displayName'] as String?,
      emailAddress: json['emailAddress'] as String?,
      emailVerified: json['emailVerified'] as bool? ?? false,
      hasPassword: json['hasPassword'] as bool? ?? false,
      needInfo: json['needInfo'] as bool? ?? false,
    );

Map<String, dynamic> _$$_FirestoreUserToJson(_$_FirestoreUser instance) =>
    <String, dynamic>{
      'id': instance.id,
      'displayName': instance.displayName,
      'emailAddress': instance.emailAddress,
      'emailVerified': instance.emailVerified,
      'hasPassword': instance.hasPassword,
      'needInfo': instance.needInfo,
    };

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$signInSuppliersHash() => r'3cc5220dc8b17b42ddaabf37f85a17c64a7a5f3b';

/// Provider which defines the list of sign-in suppliers
/// Default is empty, you need to override it on the main scope
///
/// Copied from [signInSuppliers].
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
String _$authStateHash() => r'5c23d931f0299e4cfa6031cf1e036fb40e36d91f';

/// The provider for the [AuthState] of the app
/// Watches the authStateChanges of the Firebase auth stream,
/// then if the user is authenticated, watches the Firestore
/// user document from the [firestoreUserPath] defined below.
/// If the document does not exist, we consider that the creation
/// is in progress in Cloud Functions (waitingUserCreation).
/// If the document exists and the user.needInfo is true, it seems
/// that the user needs to add more information to complete the
/// registration process.
/// Otherwise, the user is authenticated!
///
/// Copied from [authState].
@ProviderFor(authState)
final authStateProvider = Provider<AuthState>.internal(
  authState,
  name: r'authStateProvider',
  debugGetCreateSourceHash:
      const bool.fromEnvironment('dart.vm.product') ? null : _$authStateHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef AuthStateRef = ProviderRef<AuthState>;
String _$authSplashHash() => r'6905c9eac6b00bc4d414621f90dff630b793c0eb';

/// Simplified version of [AuthState], this provider is used
/// in the [SplashPageBuilder] and managed less cases than [AuthState].
///
/// Copied from [authSplash].
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

/// Theming the sign-in pages
///
/// Copied from [signInTheme].
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
