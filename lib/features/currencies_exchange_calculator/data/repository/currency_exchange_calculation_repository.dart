import 'package:currency_calculator/features/currencies_exchange_calculator/data/data_source/i_currency_exchange_calculation_data_source.dart';
import 'package:currency_calculator/features/currencies_exchange_calculator/data/mapper/currency_exchange_calculation_mapper.dart';
import 'package:currency_calculator/features/currencies_exchange_calculator/domain/entity/currency_exchange_calculation.dart';
import 'package:currency_calculator/features/currencies_exchange_calculator/domain/repository/i_currency_exchange_calculation_repository.dart';

class CurrencyExchangeCalculationRepository
    implements ICurrencyExchangeCalculationRepository {
  const CurrencyExchangeCalculationRepository(this._dataSource);

  final ICurrencyExchangeCalculationDataSource _dataSource;

  @override
  Future<CurrencyExchangeCalculation> getExchangeRate({
    required String inputCurrencyId,
    required String outputCurrencyId,
    required bool isFiatToCrypto,
  }) async {
    final dto = await _dataSource.getExchangeRate(
      inputCurrencyId: inputCurrencyId,
      outputCurrencyId: outputCurrencyId,
      type: isFiatToCrypto ? 1 : 0,
    );
    return dto.toEntity();
  }
}
