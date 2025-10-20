import 'package:currency_calculator/features/currencies_exchange_calculator/domain/entity/currency_type.dart';

class CurrencyDto {
  const CurrencyDto({
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

  factory CurrencyDto.fromJson(Map<String, dynamic> json) {
    return CurrencyDto(
      id: json['id'],
      name: json['name'],
      symbol: json['symbol'],
      type: CurrencyType.values.byName(json['type']),
      iconPath: json['iconPath'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'symbol': symbol,
      'type': type.name,
      'iconPath': iconPath,
    };
  }
}
