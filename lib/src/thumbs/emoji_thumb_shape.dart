import 'package:flutter/material.dart';

class EmojiThumbShape extends SliderComponentShape {
  final List<String> emojis;
  final double size;

  const EmojiThumbShape({
    this.emojis = const ['😠', '😐', '😊'],
    this.size = 32,
  }) : assert(emojis.length >= 2);

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
    final double normalizedValue = value.clamp(0.0, 1.0);

    final int index = ((emojis.length - 1) * normalizedValue).round().clamp(
      0,
      emojis.length - 1,
    );

    final String emoji = emojis[index];

    final TextPainter painter = TextPainter(
      text: TextSpan(
        text: emoji,
        style: TextStyle(fontSize: size * 0.8),
      ),
      textDirection: textDirection,
      textAlign: TextAlign.center,
    );

    painter.layout();

    painter.paint(
      context.canvas,
      Offset(center.dx - painter.width / 2, center.dy - painter.height / 2),
    );
  }
}
