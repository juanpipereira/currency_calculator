import 'package:currency_calculator/features/currencies_exchange_calculator/domain/entity/currency_exchange_calculation.dart';
import 'package:currency_calculator/features/currencies_exchange_calculator/presentation/provider/currencies_core_provider.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'currency_exchange_calculation_provider.g.dart';

@riverpod
class CurrencyExchangeCalculationResult
    extends _$CurrencyExchangeCalculationResult {
  @override
  Future<CurrencyExchangeCalculation?> build() async {
    return null;
  }

  Future<void> performCalculation({
    required String inputCurrencyId,
    required String outputCurrencyId,
    required bool isFiatToCrypto,
  }) async {
    state = const AsyncValue.loading();
    try {
      final useCase = ref.read(getCurrencyExchangeCalculationUseCaseProvider);
      final exchangeCalculation = await useCase.execute(
        inputCurrencyId: inputCurrencyId,
        outputCurrencyId: outputCurrencyId,
        isFiatToCrypto: isFiatToCrypto,
      );
      state = AsyncValue.data(exchangeCalculation);
    } catch (e, st) {
      state = AsyncValue.error(e, st);
    }
  }
}
