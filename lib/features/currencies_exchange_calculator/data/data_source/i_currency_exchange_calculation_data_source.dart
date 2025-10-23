import 'package:currency_calculator/features/currencies_exchange_calculator/data/dto/currency_exchange_calculation_dto.dart';

abstract class ICurrencyExchangeCalculationDataSource {
  Future<CurrencyExchangeCalculationDTO> getExchangeRate({
    required String inputCurrencyId,
    required String outputCurrencyId,
    required int type,
  });
}
