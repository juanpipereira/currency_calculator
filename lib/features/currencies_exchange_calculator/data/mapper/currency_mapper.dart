import 'package:currency_calculator/features/currencies_exchange_calculator/data/dto/currency_dto.dart';
import 'package:currency_calculator/features/currencies_exchange_calculator/domain/entity/currency.dart';
import 'package:currency_calculator/features/currencies_exchange_calculator/domain/entity/currency_type.dart';

extension CurrencyMapper on CurrencyDto {
  Currency toEntity() {
    return Currency(
      id: id,
      name: name,
      symbol: symbol,
      type: CurrencyType.values.byName(type),
      iconPath: iconPath,
    );
  }
}
