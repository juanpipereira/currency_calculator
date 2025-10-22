import 'package:currency_calculator/features/currencies_exchange_calculator/data/data_source/currencies_local_data_source.dart';
import 'package:currency_calculator/features/currencies_exchange_calculator/data/data_source/i_currencies_data_source.dart';
import 'package:currency_calculator/features/currencies_exchange_calculator/data/repository/currencies_repository.dart';
import 'package:currency_calculator/features/currencies_exchange_calculator/domain/repository/i_currencies_repository.dart';
import 'package:currency_calculator/features/currencies_exchange_calculator/domain/use_case/get_currencies_use_case.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'currencies_core_provider.g.dart';

@Riverpod(keepAlive: true)
ICurrenciesDataSource currenciesDataSource(Ref ref) {
  return const CurrenciesLocalDataSource();
}

@Riverpod(keepAlive: true)
ICurrenciesRepository currenciesRepository(Ref ref) {
  return CurrenciesRepository(dataSource: ref.watch(currenciesDataSourceProvider));
}

@Riverpod(keepAlive: true)
GetCurrenciesUseCase getCurrenciesUseCase(Ref ref) {
  return GetCurrenciesUseCase(repository: ref.watch(currenciesRepositoryProvider));
}
