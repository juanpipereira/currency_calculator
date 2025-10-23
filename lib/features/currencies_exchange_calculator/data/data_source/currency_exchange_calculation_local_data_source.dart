import 'package:currency_calculator/features/currencies_exchange_calculator/data/data_source/i_currency_exchange_calculation_data_source.dart';
import 'package:currency_calculator/features/currencies_exchange_calculator/data/dto/currency_exchange_calculation_dto.dart';

class CurrencyExchangeCalculationLocalDataSource
    implements ICurrencyExchangeCalculationDataSource {
  @override
  Future<CurrencyExchangeCalculationDTO> getExchangeRate({
    required String inputCurrencyId,
    required String outputCurrencyId,
    required int type,
  }) async {
    // Placeholder for actual exchange rate fetching logic
    // In a real application, this would involve API calls or a local database lookup.
    await Future.delayed(
        const Duration(milliseconds: 500)); // Simulate network delay
    print('inp: $inputCurrencyId, ou: $outputCurrencyId');

    // Dummy exchange rates and estimated times for demonstration
    if (inputCurrencyId == 'USD' && outputCurrencyId == 'EUR') {
      return const CurrencyExchangeCalculationDTO(
          fiatToCryptoExchangeRate: 0.92, estimatedTime: 5);
    } else if (inputCurrencyId == 'VES' &&
        outputCurrencyId == 'TATUM-TRON-USDT') {
      return const CurrencyExchangeCalculationDTO(
          fiatToCryptoExchangeRate: 1.09, estimatedTime: 5);
    } else if (inputCurrencyId == 'USD' && outputCurrencyId == 'BTC') {
      return const CurrencyExchangeCalculationDTO(
          fiatToCryptoExchangeRate: 0.000015,
          estimatedTime: 30); // Example rate
    } else if (inputCurrencyId == 'BTC' && outputCurrencyId == 'USD') {
      return const CurrencyExchangeCalculationDTO(
          fiatToCryptoExchangeRate: 65000.0, estimatedTime: 60); // Example rate
    } else if (inputCurrencyId == outputCurrencyId) {
      return const CurrencyExchangeCalculationDTO(
          fiatToCryptoExchangeRate: 1.0, estimatedTime: 1);
    }

    // Default or error case
    return const CurrencyExchangeCalculationDTO(
        fiatToCryptoExchangeRate: 0.0, estimatedTime: 0);
  }
}
