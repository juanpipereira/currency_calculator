import 'package:currency_calculator/features/currencies_exchange_calculator/domain/entity/currency_type.dart';
import 'package:currency_calculator/features/currencies_exchange_calculator/presentation/provider/is_fiat_to_crypto_provider.dart';
import 'package:currency_calculator/features/currencies_exchange_calculator/presentation/provider/output_currency_provider.dart';
import 'package:currency_calculator/features/currencies_exchange_calculator/presentation/widget/currency_image.dart';
import 'package:currency_calculator/features/currencies_exchange_calculator/presentation/widget/currency_selection_sheet.dart';
import 'package:currency_calculator/features/currencies_exchange_calculator/presentation/widget/currency_selector.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class OutputCurrencySelector extends ConsumerWidget {
  const OutputCurrencySelector({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final outputCurrency = ref.watch(outputCurrencyProvider);
    final isFiatToCrypto = ref.watch(isFiatToCryptoProvider);

    return CurrencySelector(
      isCurrencySymbolOnRight: isFiatToCrypto,
      currencySymbol: outputCurrency?.symbol,
      currencyImage: outputCurrency != null
          ? CurrencyImage(currency: outputCurrency)
          : null,
      title: isFiatToCrypto ? 'QUIERO' : 'TENGO',
      onTap: () {
        CurrencySelectionSheet.show(
          context,
          type: CurrencyType.crypto,
          onCurrencySelected: (currency) =>
              ref.read(outputCurrencyProvider.notifier).setCurrency(currency),
        );
      },
    );
  }
}
