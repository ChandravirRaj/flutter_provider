import 'package:flutter/material.dart';

class MyPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    // Create a Paint object to define the appearance of the shape
    final Paint paint = Paint()
      ..color = Colors.green // Set the color to green
      ..strokeWidth = 4 // Set the stroke width
      ..style = PaintingStyle.fill; // Set the style to fill

    // Calculate the center and radius of the circle
    final center = Offset(size.width / 2, size.height / 2);
    final radius = size.width / 2;
    canvas.drawCircle(center, radius, paint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return false;
  }
}
