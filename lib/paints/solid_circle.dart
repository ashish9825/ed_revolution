import 'package:flutter/material.dart';

class SolidCircle extends StatefulWidget {
  final Map<String, double> center;
  final double radius;
  final double strokeWidth;
  final Color color;
  SolidCircle({this.center, this.radius, this.strokeWidth, this.color});
  @override
  _SolidCircleState createState() => _SolidCircleState();
}

class _SolidCircleState extends State<SolidCircle> with SingleTickerProviderStateMixin {
  AnimationController _controller;
  @override
  void initState() {
    super.initState();
    _controller = AnimationController(vsync: this);
  }

  @override
  void dispose() {
    super.dispose();
    _controller.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return CustomPaint(
      size: Size(MediaQuery.of(context).size.width,
          MediaQuery.of(context).size.height),
      painter: DrawCircle(
          center: widget.center,
          radius: widget.radius,
          strokeWidth: widget.strokeWidth,
          color: widget.color),
    );
  }
}

class DrawCircle extends CustomPainter {
  Map<String, double> center;
  double radius;
  double strokeWidth;
  Color color;
  DrawCircle({this.center, this.radius, this.strokeWidth, this.color});
  @override
  void paint(Canvas canvas, Size size) {
    Paint brush = new Paint()
      ..color = color
      ..strokeCap = StrokeCap.round
      ..style = PaintingStyle.fill
      ..strokeWidth = strokeWidth;
    canvas.drawCircle(Offset(center["x"], center["y"]), radius, brush);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return true;
  }
}
