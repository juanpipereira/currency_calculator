import 'dart:math';

import 'package:flutter/material.dart';

class AppBackground extends StatelessWidget {
  const AppBackground({super.key, required this.child});

  final Widget child;

  @override
  Widget build(BuildContext context) {
    return CustomPaint(
      painter: _AppBackgroundPainter(context),
      child: child,
    );
  }
}

class _AppBackgroundPainter extends CustomPainter {
  _AppBackgroundPainter(this.context);

  final BuildContext context;

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint();

    // Draw the light blue background
    paint.color = Theme.of(context).colorScheme.primaryContainer;
    canvas.drawRect(Rect.fromLTWH(0, 0, size.width, size.height), paint);

    // Draw the amber semicircle
    paint.color = Theme.of(context).colorScheme.secondary;
    final double radius = size.width * 1.4;
    canvas.drawArc(
      Rect.fromCircle(
          center: Offset(size.width * 1.9, size.height * 0.4), radius: radius),
      0.5 * pi,
      pi,
      true,
      paint,
    );
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return false;
  }
}
