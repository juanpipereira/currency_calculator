import 'package:currency_calculator/features/currencies_exchange_calculator/data/dto/currency_exchange_calculation_dto.dart';
import 'package:currency_calculator/features/currencies_exchange_calculator/domain/entity/currency_exchange_calculation.dart';

extension CurrencyExchangeCalculationMapper on CurrencyExchangeCalculationDTO {
  CurrencyExchangeCalculation toEntity() {
    return CurrencyExchangeCalculation(
      fiatToCryptoExchangeRate: fiatToCryptoExchangeRate,
      estimatedTime: estimatedTime.toInt(),
    );
  }
}
