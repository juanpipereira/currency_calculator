import 'package:currency_calculator/features/currencies_exchange_calculator/domain/entity/currency_exchange_calculation.dart';

abstract class ICurrencyExchangeCalculationRepository {
  Future<CurrencyExchangeCalculation> getExchangeRate({
    required String inputCurrencyId,
    required String outputCurrencyId,
    required bool isFiatToCrypto,
  });
}
