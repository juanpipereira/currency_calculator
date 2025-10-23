import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'is_fiat_to_crypto_provider.g.dart';

@riverpod
class IsFiatToCrypto extends _$IsFiatToCrypto {
  @override
  bool build() => true;

  void toggle() {
    state = !state;
  }
}
