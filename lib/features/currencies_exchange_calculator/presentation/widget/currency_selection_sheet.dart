import 'package:currency_calculator/features/currencies_exchange_calculator/domain/entity/currency.dart';
import 'package:currency_calculator/features/currencies_exchange_calculator/domain/entity/currency_type.dart';
import 'package:currency_calculator/features/currencies_exchange_calculator/presentation/provider/currencies_provider.dart';
import 'package:currency_calculator/features/currencies_exchange_calculator/presentation/widget/currency_list_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class CurrencySelectionSheet extends ConsumerWidget {
  const CurrencySelectionSheet({
    super.key,
    required this.onCurrencySelected,
    required this.currencyType,
  });

  final void Function(Currency) onCurrencySelected;
  final CurrencyType currencyType;

  static void show(
    BuildContext context, {
    required CurrencyType type,
    required void Function(Currency) onCurrencySelected,
  }) {
    showModalBottomSheet(
      showDragHandle: true,
      isScrollControlled: true,
      context: context,
      backgroundColor: Colors.white,
      builder: (_) {
        return FractionallySizedBox(
          heightFactor: 0.8,
          child: CurrencySelectionSheet(
            onCurrencySelected: onCurrencySelected,
            currencyType: type,
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final filteredCurrencies = ref.watch(currenciesProvider(currencyType.name));
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.all(16.0),
          child: Text(
            currencyType.heading,
            style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          ),
        ),
        Expanded(
          child: filteredCurrencies.when(
            skipLoadingOnRefresh: false,
            data: (currencies) => ListView.builder(
              itemCount: currencies.length,
              itemBuilder: (context, index) {
                final currency = currencies[index];
                return CurrencyListItem(
                  currency: currency,
                  onTap: () {
                    onCurrencySelected(currency);
                    Navigator.pop(context);
                  },
                );
              },
            ),
            error: (_, __) =>
                const Center(child: Text("Algo ocurrió. Intenta de nuevo.")),
            loading: () => const Center(child: Text("Cargando...")),
          ),
        ),
      ],
    );
  }
}
