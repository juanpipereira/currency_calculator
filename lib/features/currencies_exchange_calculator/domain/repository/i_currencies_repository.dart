import 'package:currency_calculator/features/currencies_exchange_calculator/domain/entity/currency.dart';

abstract class ICurrenciesRepository {
  Future<List<Currency>> getCurrencies();
}
