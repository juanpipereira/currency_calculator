class CurrencyExchangeCalculation {
  const CurrencyExchangeCalculation({
    required this.fiatToCryptoExchangeRate,
    required this.estimatedTime,
  });

  final double fiatToCryptoExchangeRate;
  final int estimatedTime;
}
