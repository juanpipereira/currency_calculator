import 'package:currency_calculator/features/currencies_exchange_calculator/data/dto/currency_exchange_calculation_dto.dart';

abstract class ICurrencyExchangeCalculationService {
  Future<CurrencyExchangeCalculationDTO> getExchangeRate({
    required int type,
    required String cryptoCurrencyId,
    required String fiatCurrencyId,
    required String amountCurrencyId,
  });
}
