import 'package:currency_calculator/features/currencies_exchange_calculator/domain/entity/currency.dart';
import 'package:currency_calculator/features/currencies_exchange_calculator/domain/entity/currency_type.dart';
import 'package:flutter/material.dart';

class CurrencyImage extends StatelessWidget {
  const CurrencyImage({
    super.key,
    required this.currency,
    this.size = 25,
  });

  final Currency currency;
  final double size;

  @override
  Widget build(BuildContext context) {
    String assetPath = '';
    if (currency.type == CurrencyType.fiat) {
      assetPath = 'assets/fiat_currencies/${currency.id}.png';
    } else {
      assetPath = 'assets/cripto_currencies/${currency.id}.png';
    }

    return Image.asset(
      assetPath,
      width: size,
      height: size,
      errorBuilder: (context, error, stackTrace) {
        return SizedBox(
          width: size,
          height: size,
          child: const Icon(Icons.error),
        );
      },
    );
  }
}
