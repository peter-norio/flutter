// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'fn_param_hello.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$helloParamHash() => r'2a8509328fa98d220046854cf4509d495cce3a42';

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

/// See also [helloParam].
@ProviderFor(helloParam)
const helloParamProvider = HelloParamFamily();

/// See also [helloParam].
class HelloParamFamily extends Family<String> {
  /// See also [helloParam].
  const HelloParamFamily();

  /// See also [helloParam].
  HelloParamProvider call(
    String user,
  ) {
    return HelloParamProvider(
      user,
    );
  }

  @override
  HelloParamProvider getProviderOverride(
    covariant HelloParamProvider provider,
  ) {
    return call(
      provider.user,
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
  String? get name => r'helloParamProvider';
}

/// See also [helloParam].
class HelloParamProvider extends AutoDisposeProvider<String> {
  /// See also [helloParam].
  HelloParamProvider(
    String user,
  ) : this._internal(
          (ref) => helloParam(
            ref as HelloParamRef,
            user,
          ),
          from: helloParamProvider,
          name: r'helloParamProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$helloParamHash,
          dependencies: HelloParamFamily._dependencies,
          allTransitiveDependencies:
              HelloParamFamily._allTransitiveDependencies,
          user: user,
        );

  HelloParamProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.user,
  }) : super.internal();

  final String user;

  @override
  Override overrideWith(
    String Function(HelloParamRef provider) create,
  ) {
    return ProviderOverride(
      origin: this,
      override: HelloParamProvider._internal(
        (ref) => create(ref as HelloParamRef),
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        user: user,
      ),
    );
  }

  @override
  AutoDisposeProviderElement<String> createElement() {
    return _HelloParamProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is HelloParamProvider && other.user == user;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, user.hashCode);

    return _SystemHash.finish(hash);
  }
}

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
mixin HelloParamRef on AutoDisposeProviderRef<String> {
  /// The parameter `user` of this provider.
  String get user;
}

class _HelloParamProviderElement extends AutoDisposeProviderElement<String>
    with HelloParamRef {
  _HelloParamProviderElement(super.provider);

  @override
  String get user => (origin as HelloParamProvider).user;
}
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member, deprecated_member_use_from_same_package
