import 'package:currency_calculator/features/currencies_exchange_calculator/data/dto/currency_dto.dart';

abstract class ICurrenciesDataSource {
  Future<List<CurrencyDto>> getCurrencies();
}
