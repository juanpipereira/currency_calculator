import 'package:currency_calculator/features/currencies_exchange_calculator/presentation/provider/is_fiat_to_crypto_provider.dart';
import 'package:currency_calculator/features/currencies_exchange_calculator/presentation/widget/input_currency_selector.dart';
import 'package:currency_calculator/features/currencies_exchange_calculator/presentation/widget/output_currency_selector.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class CurrencySelectorGroup extends ConsumerWidget {
  const CurrencySelectorGroup({super.key});

  final double buttonRadius = 52.0;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final bool isFiatToCrypto = ref.watch(isFiatToCryptoProvider);

    return Stack(
      alignment: Alignment.center,
      children: [
        SizedBox(
          height: 60.0,
          child: Row(
            children: [
              Expanded(
                child: isFiatToCrypto
                    ? const InputCurrencySelector()
                    : const OutputCurrencySelector(),
              ),
              Expanded(
                child: isFiatToCrypto
                    ? const OutputCurrencySelector()
                    : const InputCurrencySelector(),
              ),
            ],
          ),
        ),
        Center(
          child: SizedBox(
            height: buttonRadius,
            width: buttonRadius,
            child: IconButton(
              padding: EdgeInsets.zero,
              style: IconButton.styleFrom(
                backgroundColor: Colors.amber,
              ),
              onPressed: () {
                ref.read(isFiatToCryptoProvider.notifier).toggle();
              },
              icon: const Icon(
                Icons.swap_horiz_rounded,
                color: Colors.white,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
