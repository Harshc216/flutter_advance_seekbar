import 'package:flutter/material.dart';

class RoundedTrackPainter extends SliderTrackShape {
  final Gradient? gradient;
  final BorderRadius borderRadius;

  const RoundedTrackPainter({
    this.gradient,
    this.borderRadius = const BorderRadius.all(Radius.circular(20)),
  });

  @override
  Rect getPreferredRect({
    required RenderBox parentBox,
    Offset offset = Offset.zero,
    required SliderThemeData sliderTheme,
    bool isEnabled = false,
    bool isDiscrete = false,
  }) {
    final double trackHeight = sliderTheme.trackHeight ?? 6;

    return Rect.fromLTWH(
      offset.dx,
      offset.dy + (parentBox.size.height - trackHeight) / 2,
      parentBox.size.width,
      trackHeight,
    );
  }

  @override
  void paint(
    PaintingContext context,
    Offset offset, {
    required RenderBox parentBox,
    required SliderThemeData sliderTheme,
    required Animation<double> enableAnimation,
    required Offset thumbCenter,
    Offset? secondaryOffset,
    bool isEnabled = false,
    bool isDiscrete = false,
    required TextDirection textDirection,
  }) {
    final Rect trackRect = getPreferredRect(
      parentBox: parentBox,
      offset: offset,
      sliderTheme: sliderTheme,
      isEnabled: isEnabled,
      isDiscrete: isDiscrete,
    );

    final double left = trackRect.left;
    final double right = trackRect.right;
    final double top = trackRect.top;
    final double bottom = trackRect.bottom;

    final double thumbX = thumbCenter.dx.clamp(left, right);

    final Paint inactivePaint = Paint()
      ..color = sliderTheme.inactiveTrackColor ?? Colors.grey;

    final Paint activePaint = Paint()
      ..color = sliderTheme.activeTrackColor ?? Colors.blue;

    final RRect fullTrack = borderRadius.toRRect(trackRect);

    context.canvas.drawRRect(fullTrack, inactivePaint);

    final Rect activeRect;

    if (textDirection == TextDirection.rtl) {
      activeRect = Rect.fromLTRB(thumbX, top, right, bottom);
    } else {
      activeRect = Rect.fromLTRB(left, top, thumbX, bottom);
    }

    if (activeRect.width > 0) {
      final RRect activeRRect = borderRadius.toRRect(activeRect);

      if (gradient != null) {
        final Paint gradientPaint = Paint()
          ..shader = gradient!.createShader(activeRect);

        context.canvas.drawRRect(activeRRect, gradientPaint);
      } else {
        context.canvas.drawRRect(activeRRect, activePaint);
      }
    }
  }
}
