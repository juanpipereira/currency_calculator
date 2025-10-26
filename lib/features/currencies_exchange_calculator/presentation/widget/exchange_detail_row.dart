import 'package:flutter/material.dart';

class ExchangeDetailRow extends StatelessWidget {
  const ExchangeDetailRow({
    super.key,
    required this.label,
    required this.mainValue,
    this.trailingText,
    this.showApproximatelySign = false,
  });

  final String label;
  final String mainValue;
  final String? trailingText;
  final bool showApproximatelySign;

  String _formatMainValue() {
    final characters = mainValue.split('.');
    if (characters.length >= 2 && characters[1].length >= 2) {
      return '${characters[0]}.${characters[1].substring(0, 2)}';
    } else {
      return mainValue;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          label,
          style: TextStyle(fontSize: 16, color: Colors.grey.shade700),
        ),
        Row(
          children: [
            if (showApproximatelySign) ...[
              const Text(
                '≈ ',
                style: TextStyle(fontSize: 16),
              ),
            ],
            Text(
              _formatMainValue(),
              style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
            if (trailingText != null) ...[
              Text(
                ' $trailingText',
                style: const TextStyle(fontSize: 14),
              ),
            ],
          ],
        ),
      ],
    );
  }
}
