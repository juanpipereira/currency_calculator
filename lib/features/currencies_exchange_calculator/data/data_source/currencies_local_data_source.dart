import 'package:currency_calculator/features/currencies_exchange_calculator/data/data_source/i_currencies_data_source.dart';
import 'package:currency_calculator/features/currencies_exchange_calculator/data/dto/currency_dto.dart';

class CurrenciesLocalDataSource implements ICurrenciesDataSource {
  const CurrenciesLocalDataSource();

  @override
  Future<List<CurrencyDto>> getCurrencies(String type) async {
    // Added for demo purposes
    await Future.delayed(const Duration(seconds: 2));
    const currencies = [
      CurrencyDto(
        id: 'BRL',
        name: 'Real Brasileño (R\$)',
        symbol: 'BRL',
        type: 'fiat',
        iconPath: 'assets/fiat_currencies/BRL.png',
      ),
      CurrencyDto(
        id: 'COP',
        name: 'Pesos Colombianos (COL\$)',
        symbol: 'COP',
        type: 'fiat',
        iconPath: 'assets/fiat_currencies/COP.png',
      ),
      CurrencyDto(
        id: 'PEN',
        name: 'Soles Peruanos (S/)',
        symbol: 'PEN',
        type: 'fiat',
        iconPath: 'assets/fiat_currencies/PEN.png',
      ),
      CurrencyDto(
        id: 'VES',
        name: 'Bolívares (Bs)',
        symbol: 'VES',
        type: 'fiat',
        iconPath: 'assets/fiat_currencies/VES.png',
      ),
      CurrencyDto(
        id: 'TATUM-TRON-USDT',
        name: 'Tether (USDT)',
        symbol: 'USDT',
        type: 'crypto',
        iconPath: 'assets/cripto_currencies/TATUM-TRON-USDT.png',
      ),
    ];
    return currencies.where((c) => c.type == type).toList();
  }
}
