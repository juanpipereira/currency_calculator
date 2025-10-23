import 'package:currency_calculator/features/currencies_exchange_calculator/domain/entity/currency_exchange_calculation.dart';
import 'package:currency_calculator/features/currencies_exchange_calculator/domain/repository/i_currency_exchange_calculation_repository.dart';

class GetCurrencyExchangeCalculationUseCase {
  const GetCurrencyExchangeCalculationUseCase({required this.repository});

  final ICurrencyExchangeCalculationRepository repository;

  Future<CurrencyExchangeCalculation> execute({
    required String inputCurrencyId,
    required String outputCurrencyId,
    required bool isFiatToCrypto,
  }) async {
    return await repository.getExchangeRate(
      inputCurrencyId: inputCurrencyId,
      outputCurrencyId: outputCurrencyId,
      isFiatToCrypto: isFiatToCrypto,
    );
  }
}
