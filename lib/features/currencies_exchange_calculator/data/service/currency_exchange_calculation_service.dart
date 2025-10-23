import 'dart:convert';

import 'package:currency_calculator/features/currencies_exchange_calculator/data/dto/currency_exchange_calculation_dto.dart';
import 'package:currency_calculator/features/currencies_exchange_calculator/data/service/i_currency_exchange_calculation_service.dart';
import 'package:http/http.dart' as http;

class CurrencyExchangeCalculationService
    implements ICurrencyExchangeCalculationService {
  const CurrencyExchangeCalculationService();

  @override
  Future<CurrencyExchangeCalculationDTO> getExchangeRate({
    required int type,
    required String cryptoCurrencyId,
    required String fiatCurrencyId,
    required String amountCurrencyId,
  }) async {
    final uri = Uri.parse(
            'https://74j6q7lg6a.execute-api.eu-west-1.amazonaws.com/stage/orderbook/public/recommendations')
        .replace(
      queryParameters: {
        'type': type.toString(),
        'cryptoCurrencyId': cryptoCurrencyId,
        'fiatCurrencyId': fiatCurrencyId,
        'amountCurrencyId': amountCurrencyId,
      },
    );
    final response = await http.get(uri);
    print('response: ${json.decode(response.body)}');

    if (response.statusCode == 200) {
      return CurrencyExchangeCalculationDTO.fromJson(
          json.decode(response.body));
    } else {
      throw Exception('Failed to load exchange rate');
    }
  }
}
