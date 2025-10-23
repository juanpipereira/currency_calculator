// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'currencies_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$currenciesHash() => r'ca037613fb0252813c56ffd4af5b8ece53f0dcf3';

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

abstract class _$Currencies
    extends BuildlessAutoDisposeAsyncNotifier<List<Currency>> {
  late final String currencyType;

  FutureOr<List<Currency>> build(
    String currencyType,
  );
}

/// See also [Currencies].
@ProviderFor(Currencies)
const currenciesProvider = CurrenciesFamily();

/// See also [Currencies].
class CurrenciesFamily extends Family<AsyncValue<List<Currency>>> {
  /// See also [Currencies].
  const CurrenciesFamily();

  /// See also [Currencies].
  CurrenciesProvider call(
    String currencyType,
  ) {
    return CurrenciesProvider(
      currencyType,
    );
  }

  @override
  CurrenciesProvider getProviderOverride(
    covariant CurrenciesProvider provider,
  ) {
    return call(
      provider.currencyType,
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
  String? get name => r'currenciesProvider';
}

/// See also [Currencies].
class CurrenciesProvider
    extends AutoDisposeAsyncNotifierProviderImpl<Currencies, List<Currency>> {
  /// See also [Currencies].
  CurrenciesProvider(
    String currencyType,
  ) : this._internal(
          () => Currencies()..currencyType = currencyType,
          from: currenciesProvider,
          name: r'currenciesProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$currenciesHash,
          dependencies: CurrenciesFamily._dependencies,
          allTransitiveDependencies:
              CurrenciesFamily._allTransitiveDependencies,
          currencyType: currencyType,
        );

  CurrenciesProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.currencyType,
  }) : super.internal();

  final String currencyType;

  @override
  FutureOr<List<Currency>> runNotifierBuild(
    covariant Currencies notifier,
  ) {
    return notifier.build(
      currencyType,
    );
  }

  @override
  Override overrideWith(Currencies Function() create) {
    return ProviderOverride(
      origin: this,
      override: CurrenciesProvider._internal(
        () => create()..currencyType = currencyType,
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        currencyType: currencyType,
      ),
    );
  }

  @override
  AutoDisposeAsyncNotifierProviderElement<Currencies, List<Currency>>
      createElement() {
    return _CurrenciesProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is CurrenciesProvider && other.currencyType == currencyType;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, currencyType.hashCode);

    return _SystemHash.finish(hash);
  }
}

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
mixin CurrenciesRef on AutoDisposeAsyncNotifierProviderRef<List<Currency>> {
  /// The parameter `currencyType` of this provider.
  String get currencyType;
}

class _CurrenciesProviderElement
    extends AutoDisposeAsyncNotifierProviderElement<Currencies, List<Currency>>
    with CurrenciesRef {
  _CurrenciesProviderElement(super.provider);

  @override
  String get currencyType => (origin as CurrenciesProvider).currencyType;
}
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member, deprecated_member_use_from_same_package
