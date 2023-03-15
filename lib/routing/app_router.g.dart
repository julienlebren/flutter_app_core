// GENERATED CODE - DO NOT MODIFY BY HAND

part of app_router;

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$routeHash() => r'b8f2f8bcaa72dc07fcd7f6a1af435a0c608d1071';

/// See also [route].
@ProviderFor(route)
final routeProvider = Provider<GoRoute>.internal(
  route,
  name: r'routeProvider',
  debugGetCreateSourceHash:
      const bool.fromEnvironment('dart.vm.product') ? null : _$routeHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef RouteRef = ProviderRef<GoRoute>;
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

String _$goRouterHash() => r'54bf74343b75714a34fc0d66186cf50795fb11dd';

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
String _$signInRouterHash() => r'68be083049ad7fe3d1c47b84cb3376f0d88f70a1';

/// See also [signInRouter].
@ProviderFor(signInRouter)
final signInRouterProvider = Provider<List<RouteBase>>.internal(
  signInRouter,
  name: r'signInRouterProvider',
  debugGetCreateSourceHash:
      const bool.fromEnvironment('dart.vm.product') ? null : _$signInRouterHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef SignInRouterRef = ProviderRef<List<RouteBase>>;
String _$settingsRouterHash() => r'fac72f916e712fbe0449541ccc4b48ecf41c09bc';

/// See also [settingsRouter].
@ProviderFor(settingsRouter)
final settingsRouterProvider = Provider<List<RouteBase>>.internal(
  settingsRouter,
  name: r'settingsRouterProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$settingsRouterHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef SettingsRouterRef = ProviderRef<List<RouteBase>>;
// ignore_for_file: unnecessary_raw_strings, subtype_of_sealed_class, invalid_use_of_internal_member, do_not_use_environment, prefer_const_constructors, public_member_api_docs, avoid_private_typedef_functions
