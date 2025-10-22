import 'package:currency_calculator/features/currencies_exchange_calculator/domain/entity/currency.dart';
import 'package:currency_calculator/features/currencies_exchange_calculator/presentation/provider/currencies_core_provider.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'currencies_provider.g.dart';

@riverpod
class Currencies extends _$Currencies {
  @override
  Future<List<Currency>> build(String currencyType) async {
    return await ref.watch(getCurrenciesUseCaseProvider).execute(currencyType);
  }
}
