import 'package:currency_calculator/features/currencies_exchange_calculator/presentation/provider/amount_input_provider.dart';
import 'package:currency_calculator/features/currencies_exchange_calculator/presentation/provider/input_currency_provider.dart';
import 'package:currency_calculator/features/currencies_exchange_calculator/presentation/provider/is_fiat_to_crypto_provider.dart';
import 'package:currency_calculator/features/currencies_exchange_calculator/presentation/provider/output_currency_provider.dart';
import 'package:currency_calculator/features/currencies_exchange_calculator/presentation/widget/amount_input_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class AmountInputConsumer extends ConsumerStatefulWidget {
  const AmountInputConsumer({super.key});

  @override
  ConsumerState<AmountInputConsumer> createState() =>
      _AmountInputConsumerState();
}

class _AmountInputConsumerState extends ConsumerState<AmountInputConsumer> {
  late final TextEditingController _amountController;

  @override
  void initState() {
    super.initState();
    _amountController =
        TextEditingController(text: ref.read(amountInputProvider));
    _amountController.addListener(() {
      ref.read(amountInputProvider.notifier).setAmount(_amountController.text);
    });
  }

  @override
  void dispose() {
    _amountController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final inputCurrency = ref.watch(inputCurrencyProvider);
    final outputCurrency = ref.watch(outputCurrencyProvider);
    final isFiatToCrypto = ref.watch(isFiatToCryptoProvider);

    final prefixText =
        isFiatToCrypto ? inputCurrency?.symbol : outputCurrency?.symbol;

    return AmountInputField(
      controller: _amountController,
      prefixText: prefixText != null ? '$prefixText ' : null,
    );
  }
}
