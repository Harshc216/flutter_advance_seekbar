import 'package:flutter/material.dart';

class IconThumbShape extends SliderComponentShape {
  final IconData icon;
  final double size;
  final Color? color;
  final Color? backgroundColor;
  final double iconSize;

  const IconThumbShape({
    required this.icon,
    this.size = 36,
    this.color,
    this.backgroundColor,
    this.iconSize = 20,
  });

  @override
  Size getPreferredSize(bool isEnabled, bool isDiscrete) {
    return Size.square(size);
  }

  @override
  void paint(
    PaintingContext context,
    Offset center, {
    required Animation<double> activationAnimation,
    required Animation<double> enableAnimation,
    required bool isDiscrete,
    required TextPainter labelPainter,
    required RenderBox parentBox,
    required SliderThemeData sliderTheme,
    required TextDirection textDirection,
    required double value,
    required double textScaleFactor,
    required Size sizeWithOverflow,
  }) {
    final Canvas canvas = context.canvas;

    final Color thumbColor =
        backgroundColor ?? sliderTheme.thumbColor ?? Colors.blue;

    final Color iconColor = color ?? Colors.white;

    // Draw thumb background.
    final Paint backgroundPaint = Paint()
      ..color = thumbColor
      ..style = PaintingStyle.fill;

    canvas.drawCircle(center, size / 2, backgroundPaint);

    // Draw icon.
    final TextPainter iconPainter = TextPainter(
      text: TextSpan(
        text: String.fromCharCode(icon.codePoint),
        style: TextStyle(
          fontSize: iconSize,
          color: iconColor,
          fontFamily: icon.fontFamily,
          package: icon.fontPackage,
        ),
      ),
      textDirection: textDirection,
    );

    iconPainter.layout();

    iconPainter.paint(
      canvas,
      Offset(
        center.dx - iconPainter.width / 2,
        center.dy - iconPainter.height / 2,
      ),
    );
  }
}
