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
  final String type;
  final String iconPath;

  factory CurrencyDto.fromJson(Map<String, dynamic> json) {
    return CurrencyDto(
      id: json['id'],
      name: json['name'],
      symbol: json['symbol'],
      type: json['type'],
      iconPath: json['iconPath'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'symbol': symbol,
      'type': type,
      'iconPath': iconPath,
    };
  }
}
