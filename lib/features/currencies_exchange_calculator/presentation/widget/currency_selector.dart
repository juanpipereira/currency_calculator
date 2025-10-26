import 'package:flutter/material.dart';

class CurrencySelector extends StatelessWidget {
  const CurrencySelector({
    super.key,
    this.currencySymbol,
    this.isCurrencySymbolOnRight = false,
    required this.onTap,
    required this.title,
    this.currencyImage,
  });

  final String? currencySymbol;
  final bool isCurrencySymbolOnRight;
  final VoidCallback onTap;
  final String title;
  final Widget? currencyImage;
  final double labelMargin = 32;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Stack(
        children: [
          Container(
            padding: EdgeInsets.zero,
            margin: const EdgeInsets.symmetric(vertical: 9),
            height: 45,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.only(
                topLeft: isCurrencySymbolOnRight
                    ? Radius.zero
                    : const Radius.circular(100),
                topRight: isCurrencySymbolOnRight
                    ? const Radius.circular(100)
                    : Radius.zero,
                bottomLeft: isCurrencySymbolOnRight
                    ? Radius.zero
                    : const Radius.circular(100),
                bottomRight: isCurrencySymbolOnRight
                    ? const Radius.circular(100)
                    : Radius.zero,
              ),
              border: Border.all(
                color: Colors.amber,
                width: 2,
              ),
            ),
            child: Row(
              mainAxisAlignment: isCurrencySymbolOnRight
                  ? MainAxisAlignment.end
                  : MainAxisAlignment.start,
              children: [
                if (currencyImage != null) ...[
                  if (!isCurrencySymbolOnRight) const SizedBox(width: 24),
                  currencyImage!,
                  const SizedBox(width: 6),
                ] else ...[
                  const SizedBox(width: 32),
                ],
                Text(
                  currencySymbol ?? 'N/A',
                  style: const TextStyle(
                    fontSize: 12,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Icon(
                  Icons.keyboard_arrow_down_rounded,
                  color: Colors.grey.shade600,
                ),
                if (isCurrencySymbolOnRight) const SizedBox(width: 24),
              ],
            ),
          ),
          Positioned(
            left: isCurrencySymbolOnRight ? null : labelMargin,
            right: isCurrencySymbolOnRight ? labelMargin : null,
            child: ColoredBox(
              color: Colors.white,
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 4),
                child: Text(
                  title,
                  style: const TextStyle(
                    fontSize: 10,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
