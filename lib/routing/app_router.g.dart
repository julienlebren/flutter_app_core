// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'app_router.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$mainRouteHash() => r'6b207e53d51e8998a9f43747e1ac94cc0a3335e2';

/// See also [mainRoute].
@ProviderFor(mainRoute)
final mainRouteProvider = Provider<GoRoute>.internal(
  mainRoute,
  name: r'mainRouteProvider',
  debugGetCreateSourceHash:
      const bool.fromEnvironment('dart.vm.product') ? null : _$mainRouteHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef MainRouteRef = ProviderRef<GoRoute>;
String _$modalTransitionHash() => r'ab125e02268f7ffbea254bf13378a55605e023e8';

/// Copied from Dart SDK
class _SystemHash {
  _SystemHash._();

  static int combine(int hash, int value) {
    // ignore: parameter_assignments
    hash = 0x1fffffff & (hash + value);
    // ignore: parameter_assignments
    hash = 0x1fffffff & (hash + ((0x0007ffff & hash) << 10));
    return hash ^ (hash >> 6);
  }

  static int finish(int hash) {
    // ignore: parameter_assignments
    hash = 0x1fffffff & (hash + ((0x03ffffff & hash) << 3));
    // ignore: parameter_assignments
    hash = hash ^ (hash >> 11);
    return 0x1fffffff & (hash + ((0x00003fff & hash) << 15));
  }
}

typedef ModalTransitionRef = AutoDisposeProviderRef<Page<dynamic>>;

/// See also [modalTransition].
@ProviderFor(modalTransition)
const modalTransitionProvider = ModalTransitionFamily();

/// See also [modalTransition].
class ModalTransitionFamily extends Family<Page<dynamic>> {
  /// See also [modalTransition].
  const ModalTransitionFamily();

  /// See also [modalTransition].
  ModalTransitionProvider call({
    LocalKey? key,
    required Widget child,
  }) {
    return ModalTransitionProvider(
      key: key,
      child: child,
    );
  }

  @override
  ModalTransitionProvider getProviderOverride(
    covariant ModalTransitionProvider provider,
  ) {
    return call(
      key: provider.key,
      child: provider.child,
    );
  }

  static const Iterable<ProviderOrFamily>? _dependencies = null;

  @override
  Iterable<ProviderOrFamily>? get dependencies => _dependencies;

  static const Iterable<ProviderOrFamily>? _allTransitiveDependencies = null;

  @override
  Iterable<ProviderOrFamily>? get allTransitiveDependencies =>
      _allTransitiveDependencies;

  @override
  String? get name => r'modalTransitionProvider';
}

/// See also [modalTransition].
class ModalTransitionProvider extends AutoDisposeProvider<Page<dynamic>> {
  /// See also [modalTransition].
  ModalTransitionProvider({
    this.key,
    required this.child,
  }) : super.internal(
          (ref) => modalTransition(
            ref,
            key: key,
            child: child,
          ),
          from: modalTransitionProvider,
          name: r'modalTransitionProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$modalTransitionHash,
          dependencies: ModalTransitionFamily._dependencies,
          allTransitiveDependencies:
              ModalTransitionFamily._allTransitiveDependencies,
        );

  final LocalKey? key;
  final Widget child;

  @override
  bool operator ==(Object other) {
    return other is ModalTransitionProvider &&
        other.key == key &&
        other.child == child;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, key.hashCode);
    hash = _SystemHash.combine(hash, child.hashCode);

    return _SystemHash.finish(hash);
  }
}

String _$goRouterHash() => r'5822f07593ef416e1fe299f40e1a217ad1e3e2c3';

/// See also [goRouter].
@ProviderFor(goRouter)
final goRouterProvider = Provider<GoRouter>.internal(
  goRouter,
  name: r'goRouterProvider',
  debugGetCreateSourceHash:
      const bool.fromEnvironment('dart.vm.product') ? null : _$goRouterHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef GoRouterRef = ProviderRef<GoRouter>;
// ignore_for_file: unnecessary_raw_strings, subtype_of_sealed_class, invalid_use_of_internal_member, do_not_use_environment, prefer_const_constructors, public_member_api_docs, avoid_private_typedef_functions
