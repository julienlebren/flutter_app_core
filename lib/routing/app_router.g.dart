// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'app_router.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$routesHash() => r'bf0790dc2ca3525e75ebbad0ddd87bce9dc85ca0';

/// See also [routes].
@ProviderFor(routes)
final routesProvider = Provider<List<GoRoute>>.internal(
  routes,
  name: r'routesProvider',
  debugGetCreateSourceHash:
      const bool.fromEnvironment('dart.vm.product') ? null : _$routesHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef RoutesRef = ProviderRef<List<GoRoute>>;
String _$modalTransitionHash() => r'5433df2c291541a4a0c519342960871aba7d3774';

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

typedef ModalTransitionRef
    = AutoDisposeProviderRef<CustomTransitionPage<dynamic>>;

/// See also [modalTransition].
@ProviderFor(modalTransition)
const modalTransitionProvider = ModalTransitionFamily();

/// See also [modalTransition].
class ModalTransitionFamily extends Family<CustomTransitionPage<dynamic>> {
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
class ModalTransitionProvider
    extends AutoDisposeProvider<CustomTransitionPage<dynamic>> {
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

String _$goRouterHash() => r'de431d9e026315de66907f33dd2d3f0671b85df4';

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
