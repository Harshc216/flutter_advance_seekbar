import 'package:flutter/material.dart';

class AdvancedSeekBarTheme {
  final Color activeColor;
  final Color inactiveColor;
  final Color? disabledColor;

  final double trackHeight;
  final double thumbRadius;

  final BorderRadius trackRadius;

  final Gradient? gradient;

  const AdvancedSeekBarTheme({
    this.activeColor = Colors.blue,
    this.inactiveColor = Colors.grey,
    this.disabledColor,
    this.trackHeight = 6,
    this.thumbRadius = 10,
    this.trackRadius = const BorderRadius.all(
      Radius.circular(20),
    ),
    this.gradient,
  });
}