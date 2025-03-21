import 'package:flutter/material.dart';

class GWidgetLoadingCircle extends StatelessWidget {
  const GWidgetLoadingCircle(
      {super.key, this.color = Colors.white, this.strokeWidth = 5});
  final Color color;
  final double strokeWidth;

  @override
  Widget build(BuildContext context) {
    return CircularProgressIndicator(
        strokeWidth: strokeWidth,
        valueColor: AlwaysStoppedAnimation<Color>(color));
  }
}
