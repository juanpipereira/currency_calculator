import 'package:currency_calculator/features/currencies_exchange_calculator/data/data_source/i_currency_exchange_calculation_data_source.dart';
import 'package:currency_calculator/features/currencies_exchange_calculator/data/dto/currency_exchange_calculation_dto.dart';
import 'package:currency_calculator/features/currencies_exchange_calculator/data/service/i_currency_exchange_calculation_service.dart';

class CurrencyExchangeCalculationRemoteDataSource
    implements ICurrencyExchangeCalculationDataSource {
  final ICurrencyExchangeCalculationService _service;

  CurrencyExchangeCalculationRemoteDataSource(this._service);

  @override
  Future<CurrencyExchangeCalculationDTO> getExchangeRate({
    required int type,
    // required String cryptoCurrencyId,
    // required String fiatCurrencyId,
    // required double amount,
    // required String amountCurrencyId,
    required String inputCurrencyId,
    required String outputCurrencyId,
  }) {
    // return _service.getExchangeRate(
    //   type: type,
    //   cryptoCurrencyId: cryptoCurrencyId,
    //   fiatCurrencyId: fiatCurrencyId,
    //   amount: amount,
    //   amountCurrencyId: amountCurrencyId,
    // );
    return _service.getExchangeRate(
      type: type, // Fiat to crypto, 1
      cryptoCurrencyId: outputCurrencyId,
      fiatCurrencyId: inputCurrencyId,
      amountCurrencyId: outputCurrencyId,
    );
  }
}
