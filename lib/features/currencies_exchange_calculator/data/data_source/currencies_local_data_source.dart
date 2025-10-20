import 'package:currency_calculator/features/currencies_exchange_calculator/data/data_source/i_currencies_data_source.dart';
import 'package:currency_calculator/features/currencies_exchange_calculator/data/dto/currency_dto.dart';
import 'package:currency_calculator/features/currencies_exchange_calculator/domain/entity/currency_type.dart';

class CurrenciesLocalDataSource implements ICurrenciesDataSource {
  const CurrenciesLocalDataSource();

  @override
  Future<List<CurrencyDto>> getCurrencies() async {
    return const [
      CurrencyDto(
        id: 'BRL',
        name: 'Real Brasileño (R\$)',
        symbol: 'BRL',
        type: CurrencyType.fiat,
        iconPath: 'assets/fiat_currencies/BRL.png',
      ),
      CurrencyDto(
        id: 'COP',
        name: 'Pesos Colombianos (COL\$)',
        symbol: 'COP',
        type: CurrencyType.fiat,
        iconPath: 'assets/fiat_currencies/COP.png',
      ),
      CurrencyDto(
        id: 'PEN',
        name: 'Soles Peruanos (S/)',
        symbol: 'PEN',
        type: CurrencyType.fiat,
        iconPath: 'assets/fiat_currencies/PEN.png',
      ),
      CurrencyDto(
        id: 'VES',
        name: 'Bolívares (Bs)',
        symbol: 'VES',
        type: CurrencyType.fiat,
        iconPath: 'assets/fiat_currencies/VES.png',
      ),
      CurrencyDto(
        id: 'TATUM-TRON-USDT',
        name: 'Tether (USDT)',
        symbol: 'USDT',
        type: CurrencyType.crypto,
        iconPath: 'assets/cripto_currencies/TATUM-TRON-USDT.png',
      ),
    ];
  }
}
