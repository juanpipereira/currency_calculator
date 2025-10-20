import 'package:currency_calculator/features/currencies_exchange_calculator/data/dto/currency_dto.dart';
import 'package:currency_calculator/features/currencies_exchange_calculator/domain/entity/currency.dart';

extension CurrencyMapper on CurrencyDto {
  Currency toEntity() {
    return Currency(
      id: id,
      name: name,
      type: type,
      iconPath: iconPath,
    );
  }
}
