import 'package:currency_calculator/features/currencies_exchange_calculator/domain/entity/currency.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'input_currency_provider.g.dart';

@riverpod
class InputCurrency extends _$InputCurrency {
  @override
  Currency? build() {
    return null;
  }

  void setCurrency(Currency currency) {
    if (state == null || state != currency) {
      state = currency;
    }
  }
}
