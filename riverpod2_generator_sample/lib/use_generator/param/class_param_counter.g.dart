// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'class_param_counter.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$counterParamNotifierHash() =>
    r'bc5c12461ef50e457593eacdaaa5768efc95ec39';

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

abstract class _$CounterParamNotifier
    extends BuildlessAutoDisposeNotifier<int> {
  late final int count;

  int build(
    int count,
  );
}

/// See also [CounterParamNotifier].
@ProviderFor(CounterParamNotifier)
const counterParamNotifierProvider = CounterParamNotifierFamily();

/// See also [CounterParamNotifier].
class CounterParamNotifierFamily extends Family<int> {
  /// See also [CounterParamNotifier].
  const CounterParamNotifierFamily();

  /// See also [CounterParamNotifier].
  CounterParamNotifierProvider call(
    int count,
  ) {
    return CounterParamNotifierProvider(
      count,
    );
  }

  @override
  CounterParamNotifierProvider getProviderOverride(
    covariant CounterParamNotifierProvider provider,
  ) {
    return call(
      provider.count,
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
  String? get name => r'counterParamNotifierProvider';
}

/// See also [CounterParamNotifier].
class CounterParamNotifierProvider
    extends AutoDisposeNotifierProviderImpl<CounterParamNotifier, int> {
  /// See also [CounterParamNotifier].
  CounterParamNotifierProvider(
    int count,
  ) : this._internal(
          () => CounterParamNotifier()..count = count,
          from: counterParamNotifierProvider,
          name: r'counterParamNotifierProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$counterParamNotifierHash,
          dependencies: CounterParamNotifierFamily._dependencies,
          allTransitiveDependencies:
              CounterParamNotifierFamily._allTransitiveDependencies,
          count: count,
        );

  CounterParamNotifierProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.count,
  }) : super.internal();

  final int count;

  @override
  int runNotifierBuild(
    covariant CounterParamNotifier notifier,
  ) {
    return notifier.build(
      count,
    );
  }

  @override
  Override overrideWith(CounterParamNotifier Function() create) {
    return ProviderOverride(
      origin: this,
      override: CounterParamNotifierProvider._internal(
        () => create()..count = count,
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        count: count,
      ),
    );
  }

  @override
  AutoDisposeNotifierProviderElement<CounterParamNotifier, int>
      createElement() {
    return _CounterParamNotifierProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is CounterParamNotifierProvider && other.count == count;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, count.hashCode);

    return _SystemHash.finish(hash);
  }
}

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
mixin CounterParamNotifierRef on AutoDisposeNotifierProviderRef<int> {
  /// The parameter `count` of this provider.
  int get count;
}

class _CounterParamNotifierProviderElement
    extends AutoDisposeNotifierProviderElement<CounterParamNotifier, int>
    with CounterParamNotifierRef {
  _CounterParamNotifierProviderElement(super.provider);

  @override
  int get count => (origin as CounterParamNotifierProvider).count;
}
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member, deprecated_member_use_from_same_package
