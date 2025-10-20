import 'package:currency_calculator/features/currencies_exchange_calculator/data/data_source/i_currencies_data_source.dart';
import 'package:currency_calculator/features/currencies_exchange_calculator/data/mapper/currency_mapper.dart';
import 'package:currency_calculator/features/currencies_exchange_calculator/domain/entity/currency.dart';
import 'package:currency_calculator/features/currencies_exchange_calculator/domain/repository/i_currencies_repository.dart';

class CurrenciesRepository implements ICurrenciesRepository {
  const CurrenciesRepository({required this.dataSource});

  final ICurrenciesDataSource dataSource;

  @override
  Future<List<Currency>> getCurrencies() async {
    final currencyDtos = await dataSource.getCurrencies();
    final currencies = currencyDtos.map((dto) => dto.toEntity()).toList();
    return currencies;
  }
}
