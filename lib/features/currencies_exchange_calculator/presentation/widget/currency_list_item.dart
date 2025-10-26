import 'package:currency_calculator/features/currencies_exchange_calculator/domain/entity/currency.dart';
import 'package:currency_calculator/features/currencies_exchange_calculator/presentation/widget/currency_image.dart';
import 'package:flutter/material.dart';

class CurrencyListItem extends StatelessWidget {
  const CurrencyListItem({
    super.key,
    required this.currency,
    required this.onTap,
    this.isSelected = false,
  });

  final Currency currency;
  final VoidCallback onTap;
  final bool isSelected;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
        decoration: BoxDecoration(
          color: isSelected ? Colors.amber.shade100 : null,
          borderRadius: BorderRadius.circular(8),
        ),
        child: Row(
          children: [
            CurrencyImage(currency: currency),
            const SizedBox(width: 16),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    currency.symbol,
                    style: const TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(
                    currency.name,
                    style: TextStyle(
                      fontSize: 14,
                      color: Colors.grey[600],
                    ),
                  ),
                ],
              ),
            ),
            Radio<bool>(
              value: true,
              groupValue: isSelected,
              onChanged: (_) {
                onTap();
              },
              activeColor: Colors.amber,
            ),
          ],
        ),
      ),
    );
  }
}
