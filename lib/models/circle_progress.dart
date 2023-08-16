import 'dart:math';

import 'package:flutter/material.dart';

class CircleProgressPainter extends CustomPainter {
  final double progress;
  final bool showCheckIcon;

  CircleProgressPainter({
    required this.progress,
    required this.showCheckIcon,
  });

  @override
  void paint(Canvas canvas, Size size) {
    final center = Offset(size.width / 2, size.height / 2);
    final radius = size.width / 2;

    // Draw the progress arc
    final progressPaint = Paint()
      ..color = const Color(0xFF1E5A83)
      ..style = PaintingStyle.stroke
      ..strokeWidth = 4;

    canvas.drawArc(
      Rect.fromCircle(center: center, radius: radius),
      -pi / 2,
      2 * pi * progress,
      false,
      progressPaint,
    );

    // Draw the check icon if needed
    if (showCheckIcon) {
      final iconPaint = Paint()..color = Colors.transparent;

      final iconPath = Path()
        ..moveTo(center.dx - 10, center.dy)
        ..lineTo(center.dx - 5, center.dy + 10)
        ..lineTo(center.dx + 10, center.dy - 10);

      canvas.drawPath(iconPath, iconPaint);
    }
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return true;
  }
}
