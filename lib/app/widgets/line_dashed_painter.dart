import 'package:flutter/material.dart';

class LineDashedPainter extends CustomPainter {
  final Color color;

  LineDashedPainter({required this.color});

  @override
  void paint(Canvas canvas, Size size) {
    final paintLine = Paint()
      ..color = color
      ..strokeWidth = 1.0
      ..style = PaintingStyle.stroke;

    double lenght = 0;
    while (lenght < size.width) {
      canvas.drawLine(Offset(lenght, 0), Offset(lenght + 2, 0), paintLine);
      lenght += 2 * 2;
    }
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}
