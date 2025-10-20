import 'package:currency_calculator/features/currencies_exchange_calculator/domain/entity/currency_type.dart';

class Currency {
  const Currency({
    required this.id,
    required this.name,
    required this.symbol,
    required this.type,
    required this.iconPath,
  });

  final String id;
  final String name;
  final String symbol;
  final CurrencyType type;
  final String iconPath;
}
