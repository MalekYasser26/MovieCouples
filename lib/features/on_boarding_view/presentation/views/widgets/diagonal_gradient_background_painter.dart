import 'package:flutter/material.dart';

class DiagonalGradientBackgroundPainter extends CustomPainter {
  final List<Color> gradientTheme ;
  DiagonalGradientBackgroundPainter({
    required this.gradientTheme
  });

  @override
  void paint(Canvas canvas, Size size) {
    final rect = Offset.zero & size;

    final gradient = LinearGradient(
      begin: Alignment.topLeft,
      end: Alignment.bottomRight,
      colors: gradientTheme,
    );

    final paint = Paint()..shader = gradient.createShader(rect);

    canvas.drawRect(rect, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}
