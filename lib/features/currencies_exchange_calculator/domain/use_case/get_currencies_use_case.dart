import 'package:currency_calculator/features/currencies_exchange_calculator/domain/entity/currency.dart';
import 'package:currency_calculator/features/currencies_exchange_calculator/domain/repository/i_currencies_repository.dart';

class GetCurrenciesUseCase {
  final ICurrenciesRepository repository;

  const GetCurrenciesUseCase({required this.repository});

  Future<List<Currency>> execute(String type) async {
    return repository.getCurrencies(type);
  }
}
