// GENERATED CODE - DO NOT MODIFY BY HAND

part of firebase_auth_service;

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$authStateChangesHash() => r'47cc97d852684b18ddcaf8ad25c449ca1af04638';

/// A provider which returns the auth changes in Firebase
/// We use a [StreamProvider] here to handle the status of the stream,
/// it allows us to know when the stream is loading or when it has data.
///
/// Copied from [authStateChanges].
@ProviderFor(authStateChanges)
final authStateChangesProvider = StreamProvider<User?>.internal(
  authStateChanges,
  name: r'authStateChangesProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$authStateChangesHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef AuthStateChangesRef = StreamProviderRef<User?>;
String _$userChangesHash() => r'8761fb000aa825938c91a08fe183e70cbf31b2ed';

/// See also [userChanges].
@ProviderFor(userChanges)
final userChangesProvider = StreamProvider<User?>.internal(
  userChanges,
  name: r'userChangesProvider',
  debugGetCreateSourceHash:
      const bool.fromEnvironment('dart.vm.product') ? null : _$userChangesHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef UserChangesRef = StreamProviderRef<User?>;
String _$authServiceHash() => r'8d1036029c890942be61636cbb32691091e2deb1';

/// A provider which returns an instance of [FirebaseAuthService]
///
/// Copied from [authService].
@ProviderFor(authService)
final authServiceProvider = Provider<FirebaseAuthService>.internal(
  authService,
  name: r'authServiceProvider',
  debugGetCreateSourceHash:
      const bool.fromEnvironment('dart.vm.product') ? null : _$authServiceHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef AuthServiceRef = ProviderRef<FirebaseAuthService>;
String _$firebaseUserHash() => r'e7371fce40c357b2afb8745fe2d1c2a3b5abcf26';

/// See also [FirebaseUser].
@ProviderFor(FirebaseUser)
final firebaseUserProvider =
    StreamNotifierProvider<FirebaseUser, User?>.internal(
  FirebaseUser.new,
  name: r'firebaseUserProvider',
  debugGetCreateSourceHash:
      const bool.fromEnvironment('dart.vm.product') ? null : _$firebaseUserHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef _$FirebaseUser = StreamNotifier<User?>;
// ignore_for_file: unnecessary_raw_strings, subtype_of_sealed_class, invalid_use_of_internal_member, do_not_use_environment, prefer_const_constructors, public_member_api_docs, avoid_private_typedef_functions
