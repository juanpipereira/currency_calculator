import 'package:currency_calculator/features/currencies_exchange_calculator/presentation/widget/amount_input_consumer.dart';
import 'package:currency_calculator/features/currencies_exchange_calculator/presentation/widget/app_background.dart';
import 'package:currency_calculator/features/currencies_exchange_calculator/presentation/widget/currency_selector_group.dart';
import 'package:currency_calculator/features/currencies_exchange_calculator/presentation/widget/exchange_button.dart';
import 'package:currency_calculator/features/currencies_exchange_calculator/presentation/widget/exchange_result_card.dart';
import 'package:flutter/material.dart';

class CalculatorPage extends StatelessWidget {
  const CalculatorPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GestureDetector(
        onTap: () {
          FocusScope.of(context).unfocus();
        },
        child: const AppBackground(
          child: Padding(
            padding: EdgeInsets.all(40.0),
            child: Center(
              child: Card(
                color: Colors.white,
                child: Padding(
                  padding: EdgeInsets.all(16.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      CurrencySelectorGroup(),
                      SizedBox(height: 12),
                      AmountInputConsumer(),
                      SizedBox(height: 18),
                      ExchangeResultCard(),
                      SizedBox(height: 18),
                      ExchangeButton(),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
