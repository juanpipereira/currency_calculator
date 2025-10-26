import 'package:currency_calculator/features/currencies_exchange_calculator/domain/entity/currency_type.dart';
import 'package:currency_calculator/features/currencies_exchange_calculator/presentation/provider/input_currency_provider.dart';
import 'package:currency_calculator/features/currencies_exchange_calculator/presentation/provider/is_fiat_to_crypto_provider.dart';
import 'package:currency_calculator/features/currencies_exchange_calculator/presentation/widget/currency_image.dart';
import 'package:currency_calculator/features/currencies_exchange_calculator/presentation/widget/currency_selection_sheet.dart';
import 'package:currency_calculator/features/currencies_exchange_calculator/presentation/widget/currency_selector.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class InputCurrencySelector extends ConsumerWidget {
  const InputCurrencySelector({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final inputCurrency = ref.watch(inputCurrencyProvider);
    final isFiatToCrypto = ref.watch(isFiatToCryptoProvider);

    return CurrencySelector(
      isCurrencySymbolOnRight: !isFiatToCrypto,
      currencySymbol: inputCurrency?.symbol,
      currencyImage:
          inputCurrency != null ? CurrencyImage(currency: inputCurrency) : null,
      title: isFiatToCrypto ? 'TENGO' : 'QUIERO',
      onTap: () {
        CurrencySelectionSheet.show(
          context,
          type: CurrencyType.fiat,
          onCurrencySelected: (currency) =>
              ref.read(inputCurrencyProvider.notifier).setCurrency(currency),
        );
      },
    );
  }
}
