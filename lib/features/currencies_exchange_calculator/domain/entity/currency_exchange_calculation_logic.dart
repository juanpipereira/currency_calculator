import 'package:currency_calculator/features/currencies_exchange_calculator/domain/entity/currency_exchange_calculation.dart';

extension CurrencyExchangeCalculationLogic on CurrencyExchangeCalculation? {
  String calculateTransactionByAmountAndType({
    required double amount,
    required bool isFiatToCrypto,
  }) {
    if (this != null) {
      if (isFiatToCrypto) {
        return '${amount * this!.fiatToCryptoExchangeRate}';
      } else {
        return '${amount * 1 / this!.fiatToCryptoExchangeRate}';
      }
    } else {
      return '--';
    }
  }
}
