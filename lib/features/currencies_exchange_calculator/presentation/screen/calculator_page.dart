import 'package:currency_calculator/features/currencies_exchange_calculator/domain/entity/currency.dart';
import 'package:currency_calculator/features/currencies_exchange_calculator/domain/entity/currency_exchange_calculation_logic.dart';
import 'package:currency_calculator/features/currencies_exchange_calculator/domain/entity/currency_type.dart';
import 'package:currency_calculator/features/currencies_exchange_calculator/presentation/provider/currencies_provider.dart';
import 'package:currency_calculator/features/currencies_exchange_calculator/presentation/provider/currency_exchange_calculation_provider.dart';
import 'package:currency_calculator/features/currencies_exchange_calculator/presentation/provider/input_currency_provider.dart';
import 'package:currency_calculator/features/currencies_exchange_calculator/presentation/provider/is_fiat_to_crypto_provider.dart';
import 'package:currency_calculator/features/currencies_exchange_calculator/presentation/provider/output_currency_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:currency_calculator/features/currencies_exchange_calculator/presentation/provider/amount_input_provider.dart';

class CalculatorPage extends ConsumerStatefulWidget {
  const CalculatorPage({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _CalculatorPageState();
}

class _CalculatorPageState extends ConsumerState<CalculatorPage> {
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
    // ref.listen(amountInputProvider, (_, next) {
    //   if (_amountController.text != next) {
    //     _amountController.text = next;
    //   }
    // });
    final inputCurrency = ref.watch(inputCurrencyProvider);
    final outputCurrency = ref.watch(outputCurrencyProvider);
    final currencyCalculationResult =
        ref.watch(currencyExchangeCalculationResultProvider);
    final isFiatToCrypto = ref.watch(isFiatToCryptoProvider);
    final firstSelectedCurrencyType =
        isFiatToCrypto ? CurrencyType.fiat : CurrencyType.crypto;
    final secondSelectedCurrencyType =
        isFiatToCrypto ? CurrencyType.crypto : CurrencyType.fiat;

    ref.watch(amountInputProvider.select((_) {}));
    // final a = ref.watch(currenciesProvider(CurrencyType.fiat.name));
    // print(a);

    // Temporary list of currencies for the bottom sheet
    // final currencies = [
    //   const Currency(id: 'USD', name: 'US Dollar', symbol: 'USD', type: CurrencyType.fiat, iconPath: ''),
    //   const Currency(id: 'EUR', name: 'Euro', symbol: 'EUR', type: CurrencyType.fiat, iconPath: ''),
    //   const Currency(id: 'BTC', name: 'Bitcoin', symbol: 'BTC', type: CurrencyType.crypto, iconPath: ''),
    // ];

    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Center(
          child: Card(
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                mainAxisSize: MainAxisSize.min,
                children: [
                  const Text(
                    'Tengo',
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 8),
                  Row(
                    children: [
                      ElevatedButton(
                        onPressed: () {
                          _showCurrencySelectionSheet(
                              context, firstSelectedCurrencyType, (currency) {
                            isFiatToCrypto
                                ? ref
                                    .read(inputCurrencyProvider.notifier)
                                    .setCurrency(currency)
                                : ref
                                    .read(outputCurrencyProvider.notifier)
                                    .setCurrency(currency);
                          });
                        },
                        child: const Text('Select Currency'),
                      ),
                      const SizedBox(width: 16),
                      Text(
                          isFiatToCrypto
                              ? inputCurrency?.symbol ?? 'N/A'
                              : outputCurrency?.symbol ?? 'N/A',
                          style: const TextStyle(fontSize: 16)),
                      const SizedBox(width: 16),
                      Expanded(
                        child: TextFormField(
                          controller: _amountController,
                          keyboardType: TextInputType.number,
                          decoration: const InputDecoration(
                            labelText: 'Amount',
                            border: OutlineInputBorder(),
                          ),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 24),
                  const Text(
                    'Quiero',
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 8),
                  Row(
                    children: [
                      ElevatedButton(
                        onPressed: () {
                          _showCurrencySelectionSheet(
                              context, secondSelectedCurrencyType, (currency) {
                            isFiatToCrypto
                                ? ref
                                    .read(outputCurrencyProvider.notifier)
                                    .setCurrency(currency)
                                : ref
                                    .read(inputCurrencyProvider.notifier)
                                    .setCurrency(currency);
                          });
                        },
                        child: const Text('Select Currency'),
                      ),
                      const SizedBox(width: 16),
                      Text(
                          isFiatToCrypto
                              ? outputCurrency?.symbol ?? 'N/A'
                              : inputCurrency?.symbol ?? 'N/A',
                          style: const TextStyle(fontSize: 16)),
                    ],
                  ),
                  ElevatedButton(
                    onPressed: () {
                      ref.read(isFiatToCryptoProvider.notifier).toggle();
                    },
                    child: const Text('Switch'),
                  ),
                  const SizedBox(height: 24),
                  currencyCalculationResult.when(
                    data: (result) {
                      final isFiatToCryptoValue =
                          ref.read(isFiatToCryptoProvider);
                      return Card(
                        child: Padding(
                          padding: EdgeInsets.all(16.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Recibirás',
                                style: TextStyle(fontSize: 16),
                              ),
                              SizedBox(height: 8),
                              Text(
                                result.calculateTransactionByAmountAndType(
                                  amount: double.tryParse(
                                          ref.read(amountInputProvider)) ??
                                      0.0,
                                  isFiatToCrypto: isFiatToCryptoValue,
                                ),
                                style: TextStyle(
                                    fontSize: 24, fontWeight: FontWeight.bold),
                              ),
                              SizedBox(height: 16),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text('Tasa estimada'),
                                  Text(
                                      '${result?.fiatToCryptoExchangeRate != null ? isFiatToCryptoValue ? result!.fiatToCryptoExchangeRate : (1 / result!.fiatToCryptoExchangeRate) : '--'}'),
                                ],
                              ),
                              SizedBox(height: 8),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text('Tiempo estimado'),
                                  Text('${result?.estimatedTime ?? '--'} mins'),
                                ],
                              ),
                            ],
                          ),
                        ),
                      );
                    },
                    //TODO: remove after test
                    error: (e, s) {
                      print("Stack: $s");
                      return Center(child: Text('Error: $e'));
                    },
                    loading: () => const CircularProgressIndicator(),
                  ),
                  ElevatedButton(
                    onPressed: () {
                      print('amount onp: ${ref.read(amountInputProvider)}');
                      ref
                          .read(currencyExchangeCalculationResultProvider
                              .notifier)
                          .performCalculation(
                            inputCurrencyId: inputCurrency!.id,
                            outputCurrencyId: outputCurrency!.id,
                            isFiatToCrypto: isFiatToCrypto,
                          );
                    },
                    child: const Text('Cambiar'),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  void _showCurrencySelectionSheet(
    BuildContext context,
    CurrencyType type,
    Function(Currency) onCurrencySelected,
  ) {
    showModalBottomSheet(
      context: context,
      builder: (context) {
        return Consumer(
          builder: (_, ref, __) {
            final fc = ref.watch(currenciesProvider(type.name));
            return fc.when(
              skipLoadingOnRefresh: false,
              data: (currencies) => ListView.builder(
                itemCount: currencies.length,
                itemBuilder: (context, index) {
                  final currency = currencies[index];
                  return ListTile(
                    title: Text(currency.name),
                    onTap: () {
                      onCurrencySelected(currency);
                      Navigator.pop(context);
                    },
                  );
                },
              ),
              error: (_, __) => Center(child: Text("error")),
              loading: () => Center(child: Text("loading")),
            );
          },
        );
      },
    );
  }
}
