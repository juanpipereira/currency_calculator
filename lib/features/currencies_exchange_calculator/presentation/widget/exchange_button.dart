import 'package:currency_calculator/features/currencies_exchange_calculator/presentation/provider/currency_exchange_calculation_provider.dart';
import 'package:currency_calculator/features/currencies_exchange_calculator/presentation/provider/input_currency_provider.dart';
import 'package:currency_calculator/features/currencies_exchange_calculator/presentation/provider/is_fiat_to_crypto_provider.dart';
import 'package:currency_calculator/features/currencies_exchange_calculator/presentation/provider/output_currency_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class ExchangeButton extends ConsumerWidget {
  const ExchangeButton({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final inputCurrency = ref.watch(inputCurrencyProvider);
    final outputCurrency = ref.watch(outputCurrencyProvider);

    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        foregroundColor: Theme.of(context).colorScheme.onPrimary,
        backgroundColor: Colors.amber,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        ),
      ),
      onPressed: inputCurrency != null && outputCurrency != null
          ? () {
              final isFiatToCrypto = ref.read(isFiatToCryptoProvider);

              ref
                  .read(currencyExchangeCalculationResultProvider.notifier)
                  .performCalculation(
                    inputCurrencyId: inputCurrency.id,
                    outputCurrencyId: outputCurrency.id,
                    isFiatToCrypto: isFiatToCrypto,
                  );
            }
          : null,
      child: const Text('Cambiar'),
    );
  }
}
