import 'package:currency_calculator/features/currencies_exchange_calculator/data/data_source/currencies_local_data_source.dart';
import 'package:currency_calculator/features/currencies_exchange_calculator/data/data_source/currency_exchange_calculation_remote_data_source.dart';
import 'package:currency_calculator/features/currencies_exchange_calculator/data/data_source/i_currencies_data_source.dart';
import 'package:currency_calculator/features/currencies_exchange_calculator/data/data_source/i_currency_exchange_calculation_data_source.dart';
import 'package:currency_calculator/features/currencies_exchange_calculator/data/repository/currencies_repository.dart';
import 'package:currency_calculator/features/currencies_exchange_calculator/data/repository/currency_exchange_calculation_repository.dart';
import 'package:currency_calculator/features/currencies_exchange_calculator/data/service/currency_exchange_calculation_service.dart';
import 'package:currency_calculator/features/currencies_exchange_calculator/data/service/i_currency_exchange_calculation_service.dart';
import 'package:currency_calculator/features/currencies_exchange_calculator/domain/repository/i_currencies_repository.dart';
import 'package:currency_calculator/features/currencies_exchange_calculator/domain/repository/i_currency_exchange_calculation_repository.dart';
import 'package:currency_calculator/features/currencies_exchange_calculator/domain/use_case/get_currencies_use_case.dart';
import 'package:currency_calculator/features/currencies_exchange_calculator/domain/use_case/get_currency_exchange_calculation_use_case.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'currencies_core_provider.g.dart';

@Riverpod(keepAlive: true)
ICurrenciesDataSource currenciesDataSource(Ref ref) {
  return const CurrenciesLocalDataSource();
}

@Riverpod(keepAlive: true)
ICurrenciesRepository currenciesRepository(Ref ref) {
  return CurrenciesRepository(ref.read(currenciesDataSourceProvider));
}

@Riverpod(keepAlive: true)
GetCurrenciesUseCase getCurrenciesUseCase(Ref ref) {
  return GetCurrenciesUseCase(ref.read(currenciesRepositoryProvider));
}

@Riverpod(keepAlive: true)
ICurrencyExchangeCalculationService currencyExchangeCalculationService(
    Ref ref) {
  return const CurrencyExchangeCalculationService();
}

@Riverpod(keepAlive: true)
ICurrencyExchangeCalculationDataSource currencyExchangeCalculationDataSource(
    Ref ref) {
  return CurrencyExchangeCalculationRemoteDataSource(
      ref.read(currencyExchangeCalculationServiceProvider));
}

@Riverpod(keepAlive: true)
ICurrencyExchangeCalculationRepository currencyExchangeCalculationRepository(
    Ref ref) {
  return CurrencyExchangeCalculationRepository(
      ref.read(currencyExchangeCalculationDataSourceProvider));
}

@Riverpod(keepAlive: true)
GetCurrencyExchangeCalculationUseCase getCurrencyExchangeCalculationUseCase(
    Ref ref) {
  return GetCurrencyExchangeCalculationUseCase(
      repository: ref.read(currencyExchangeCalculationRepositoryProvider));
}
