import 'package:flutter/material.dart';

class TickMarkPainter extends SliderTickMarkShape {
  final double radius;
  final Color? activeColor;
  final Color? inactiveColor;

  const TickMarkPainter({
    this.radius = 3,
    this.activeColor,
    this.inactiveColor,
  });

  @override
  Size getPreferredSize({
    required SliderThemeData sliderTheme,
    bool isEnabled = false,
  }) {
    return Size.fromRadius(radius);
  }

  @override
  void paint(
    PaintingContext context,
    Offset center, {
    required RenderBox parentBox,
    required SliderThemeData sliderTheme,
    required Animation<double> enableAnimation,
    required Offset thumbCenter,
    bool? isEnabled,
    bool? isDiscrete,
    required TextDirection textDirection,
  }) {
    final bool isActive;

    if (textDirection == TextDirection.rtl) {
      isActive = center.dx >= thumbCenter.dx;
    } else {
      isActive = center.dx <= thumbCenter.dx;
    }

    final Paint paint = Paint()
      ..color = isActive
          ? (activeColor ?? sliderTheme.activeTrackColor ?? Colors.blue)
          : (inactiveColor ?? sliderTheme.inactiveTrackColor ?? Colors.grey);

    context.canvas.drawCircle(center, radius, paint);
  }
}
