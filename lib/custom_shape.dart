import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class RoundedShape extends CustomPainter {

  @override
  void paint(Canvas canvas, Size size) {
    Paint paint = Paint();
    Path path = Path();

    double width = size.width ;
    double height = size.height;

    // Path number 1


    paint.color = Colors.grey.shade100;
    path = Path();
    path.lineTo(width * 0.90, height * 1.08);
    path.cubicTo(width * 0.93, height * 1.08, width * 0.16, height * 1.08, width * 0.16, height * 1.08);
    path.cubicTo(width * 0.09, height * 1.08, width * 0.04, height * 0.98, width * 0.04, height * 0.85);
    path.cubicTo(width * 0.04, height * 0.85, width * 0.04, height * 0.31, width * 0.04, height * 0.31);
    path.cubicTo(width * 0.04, height * 0.19, width * 0.09, height * 0.08, width * 0.16, height * 0.08);
    path.cubicTo(width * 0.16, height * 0.08, width * 0.93, height * 0.08, width * 0.93, height * 0.08);
    path.cubicTo(width, height * 0.08, width * 1.04, height * 0.18, width * 1.04, height * 0.31);
    path.cubicTo(width * 1.04, height * 0.31, width * 1.04, height * 0.85, width * 1.04, height * 0.85);
    path.cubicTo(width * 1.04, height * 0.98, width, height * 1.08, width * 0.93, height * 1.08);
    path.cubicTo(width * 0.93, height * 1.08, width * 0.93, height * 1.08, width * 0.93, height * 1.08);
    canvas.drawPath(path, paint);
  }
  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return true;
  }
}
