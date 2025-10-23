import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'amount_input_provider.g.dart';

@riverpod
class AmountInput extends _$AmountInput {
  @override
  String build() {
    return '';
  }

  void setAmount(String amount) {
    state = amount;
  }
}
