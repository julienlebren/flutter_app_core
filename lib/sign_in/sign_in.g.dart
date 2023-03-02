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
String _$userStreamHash() => r'e0edde7adc2f67cd7f4cb506f6f80c18b6e90ad5';

/// A provider for listening changed to the Firestore user object
/// Only intended to return a correct [AuthState], not to get custom properties
/// of the real [User] object used in the app.
///
/// Copied from [userStream].
@ProviderFor(userStream)
final userStreamProvider = StreamProvider<FirestoreUser?>.internal(
  userStream,
  name: r'userStreamProvider',
  debugGetCreateSourceHash:
      const bool.fromEnvironment('dart.vm.product') ? null : _$userStreamHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef UserStreamRef = StreamProviderRef<FirestoreUser?>;
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
String _$authSplashHash() => r'711491c36ddf11bf6b00d95f107daa7e1cddb611';

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
String _$signInThemeHash() => r'3d380ef5a1f0d9edce90bf2578bcfa95e90e5f35';

/// Theming the sign-in pages
///
/// Copied from [signInTheme].
@ProviderFor(signInTheme)
final signInThemeProvider = AutoDisposeProvider<SignInTheme>.internal(
  signInTheme,
  name: r'signInThemeProvider',
  debugGetCreateSourceHash:
      const bool.fromEnvironment('dart.vm.product') ? null : _$signInThemeHash,
  dependencies: <ProviderOrFamily>[formThemeProvider],
  allTransitiveDependencies: <ProviderOrFamily>[
    formThemeProvider,
    appThemeProvider
  ],
);

typedef SignInThemeRef = AutoDisposeProviderRef<SignInTheme>;
String _$signInAreaHash() => r'686d99fb11335a7a33c7b8e30f8659c48589d342';

/// See also [SignInArea].
@ProviderFor(SignInArea)
final signInAreaProvider = NotifierProvider<SignInArea, Area?>.internal(
  SignInArea.new,
  name: r'signInAreaProvider',
  debugGetCreateSourceHash:
      const bool.fromEnvironment('dart.vm.product') ? null : _$signInAreaHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef _$SignInArea = Notifier<Area?>;
// ignore_for_file: unnecessary_raw_strings, subtype_of_sealed_class, invalid_use_of_internal_member, do_not_use_environment, prefer_const_constructors, public_member_api_docs, avoid_private_typedef_functions
