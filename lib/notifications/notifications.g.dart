// GENERATED CODE - DO NOT MODIFY BY HAND

part of notifications;

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$fcmTokenHandlerHash() => r'c1eff5545fb97bb07904a081144a480e0d612717';

/// See also [fcmTokenHandler].
@ProviderFor(fcmTokenHandler)
final fcmTokenHandlerProvider =
    AutoDisposeProvider<dynamic Function(String)>.internal(
  fcmTokenHandler,
  name: r'fcmTokenHandlerProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$fcmTokenHandlerHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef FcmTokenHandlerRef = AutoDisposeProviderRef<dynamic Function(String)>;
String _$messageHandlerHash() => r'a6880318c85878f96bdc932265cc7b3f81a570e7';

/// See also [messageHandler].
@ProviderFor(messageHandler)
final messageHandlerProvider =
    AutoDisposeProvider<dynamic Function(RemoteMessage)>.internal(
  messageHandler,
  name: r'messageHandlerProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$messageHandlerHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef MessageHandlerRef
    = AutoDisposeProviderRef<dynamic Function(RemoteMessage)>;
// ignore_for_file: unnecessary_raw_strings, subtype_of_sealed_class, invalid_use_of_internal_member, do_not_use_environment, prefer_const_constructors, public_member_api_docs, avoid_private_typedef_functions
