import 'package:currency_calculator/features/currencies_exchange_calculator/domain/entity/currency.dart';
import 'package:currency_calculator/features/currencies_exchange_calculator/domain/entity/currency_type.dart';
import 'package:currency_calculator/features/currencies_exchange_calculator/presentation/provider/currencies_provider.dart';
import 'package:currency_calculator/features/currencies_exchange_calculator/presentation/provider/input_currency_provider.dart';
import 'package:currency_calculator/features/currencies_exchange_calculator/presentation/provider/output_currency_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class CalculatorPage extends ConsumerWidget {
  const CalculatorPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final inputCurrency = ref.watch(inputCurrencyProvider);
    final outputCurrency = ref.watch(outputCurrencyProvider);
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
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
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
                    _showCurrencySelectionSheet(context, CurrencyType.fiat, (currency) {
                      ref.read(inputCurrencyProvider.notifier).setCurrency(currency);
                    });
                  },
                  child: const Text('Select Currency'),
                ),
                const SizedBox(width: 16),
                Text(inputCurrency?.symbol ?? 'N/A', style: const TextStyle(fontSize: 16)),
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
                    _showCurrencySelectionSheet(context, CurrencyType.crypto, (currency) {
                      ref.read(outputCurrencyProvider.notifier).setCurrency(currency);
                    });
                  },
                  child: const Text('Select Currency'),
                ),
                const SizedBox(width: 16),
                Text(outputCurrency?.symbol ?? 'N/A', style: const TextStyle(fontSize: 16)),
              ],
            ),
            const SizedBox(height: 24),
            const Card(
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
                      '0.00',
                      style:
                          TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                    ),
                    SizedBox(height: 16),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text('Tasa estimada'),
                        Text('0.00'),
                      ],
                    ),
                    SizedBox(height: 8),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text('Tiempo estimado'),
                        Text('0.00'),
                      ],
                    ),
                  ],
                ),
              ),
            ),
            const Spacer(),
            ElevatedButton(
              onPressed: () {},
              child: const Text('Cambiar'),
            ),
          ],
        ),
      ),
    );
  }

  void _showCurrencySelectionSheet(
      BuildContext context, 
      CurrencyType type,
      Function(Currency) onCurrencySelected,) {
    showModalBottomSheet(
      context: context,
      builder: (context) {
        // TODO: fix type input
        return Consumer(
          builder: (_, ref, __) {
            final fc = ref.watch(currenciesProvider(type.name));
            return fc.when(
            skipLoadingOnRefresh: false,
            data: 
          (currencies) => ListView.builder(
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
          ), error: (_, __) => Center(child: Text("error")), loading: () => Center(child: Text("loading")),);
          },
        );
      },
    );
  }
}
