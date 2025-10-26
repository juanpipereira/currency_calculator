import 'package:currency_calculator/features/currencies_exchange_calculator/domain/entity/currency_exchange_calculation_logic.dart';
import 'package:currency_calculator/features/currencies_exchange_calculator/presentation/provider/amount_input_provider.dart';
import 'package:currency_calculator/features/currencies_exchange_calculator/presentation/provider/currency_exchange_calculation_provider.dart';
import 'package:currency_calculator/features/currencies_exchange_calculator/presentation/provider/input_currency_provider.dart';
import 'package:currency_calculator/features/currencies_exchange_calculator/presentation/provider/is_fiat_to_crypto_provider.dart';
import 'package:currency_calculator/features/currencies_exchange_calculator/presentation/provider/output_currency_provider.dart';
import 'package:currency_calculator/features/currencies_exchange_calculator/presentation/widget/exchange_detail_row.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class ExchangeResultCard extends ConsumerWidget {
  const ExchangeResultCard({
    super.key,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final currencyCalculationResult =
        ref.watch(currencyExchangeCalculationResultProvider);
    ref.watch(amountInputProvider.select((_) {}));

    return currencyCalculationResult.when(
      data: (result) {
        final isFiatToCryptoValue = ref.read(isFiatToCryptoProvider);
        final amountValue = ref.read(amountInputProvider);
        final fiatCurrency = ref.read(inputCurrencyProvider);
        final cryptoCurrency = ref.read(outputCurrencyProvider);

        final receiveAmount = amountValue.isNotEmpty
            ? result.calculateTransactionByAmountAndType(
                amount: double.tryParse(amountValue) ?? 0.0,
                isFiatToCrypto: isFiatToCryptoValue,
              )
            : null;
        final exchangeRate =
            result.calculateExchangeRate(isFiatToCrypto: isFiatToCryptoValue);
        final estimatedTime = '${result?.estimatedTime ?? ''}';
        final exchangeRateSymbol =
            isFiatToCryptoValue ? cryptoCurrency?.symbol : fiatCurrency?.symbol;

        return Padding(
          padding: const EdgeInsets.symmetric(vertical: 16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ExchangeDetailRow(
                label: 'Tasa estimada',
                mainValue: exchangeRate.isEmpty ? '--' : exchangeRate,
                trailingText: exchangeRateSymbol,
                showApproximatelySign: exchangeRate.isNotEmpty,
              ),
              const SizedBox(height: 8),
              ExchangeDetailRow(
                label: 'Recibirás',
                mainValue: receiveAmount ?? '--',
                trailingText: exchangeRateSymbol,
                showApproximatelySign: receiveAmount != null,
              ),
              const SizedBox(height: 8),
              ExchangeDetailRow(
                label: 'Tiempo estimado',
                mainValue: estimatedTime.isEmpty ? '--' : estimatedTime,
                trailingText: 'Min',
                showApproximatelySign: estimatedTime.isNotEmpty,
              )
            ],
          ),
        );
      },
      error: (_, __) {
        return const Padding(
          padding: EdgeInsets.symmetric(vertical: 48.0),
          child: Center(child: Text('Ocurrió un error')),
        );
      },
      loading: () => const Padding(
        padding: EdgeInsets.symmetric(vertical: 48.0),
        child: Center(child: Text('Cargando...')),
      ),
    );
  }
}
