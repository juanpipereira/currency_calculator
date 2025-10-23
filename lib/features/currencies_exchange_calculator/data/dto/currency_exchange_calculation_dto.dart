class CurrencyExchangeCalculationDTO {
  final double fiatToCryptoExchangeRate;
  final double estimatedTime;

  const CurrencyExchangeCalculationDTO({
    required this.fiatToCryptoExchangeRate,
    required this.estimatedTime,
  });

  factory CurrencyExchangeCalculationDTO.fromJson(Map<String, dynamic> json) {
    print('from json 1 ${json['data']['byPrice']['fiatToCryptoExchangeRate']}');
    print(
        'from json 2 ${json['data']['byPrice']['offerMakerStats']['marketMakerOrderTime']}');
    final rawFiatToCryptoExchangeRate =
        json['data']['byPrice']['fiatToCryptoExchangeRate'];
    return CurrencyExchangeCalculationDTO(
      fiatToCryptoExchangeRate: double.parse(rawFiatToCryptoExchangeRate),
      estimatedTime: json['data']['byPrice']['offerMakerStats']
          ['marketMakerOrderTime'],
    );
  }
}
