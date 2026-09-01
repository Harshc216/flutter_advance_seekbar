import 'package:flutter/material.dart';

class AdvancedRangeSeekBar extends StatelessWidget {
  final RangeValues values;
  final double min;
  final double max;
  final int? divisions;

  final ValueChanged<RangeValues>? onChanged;
  final ValueChanged<RangeValues>? onChangeStart;
  final ValueChanged<RangeValues>? onChangeEnd;

  final bool enabled;
  final bool rtl;
  final bool showValueBubble;

  final Color activeColor;
  final Color inactiveColor;

  final Color? disabledActiveColor;
  final Color? disabledInactiveColor;

  final double trackHeight;
  final double thumbRadius;

  const AdvancedRangeSeekBar({
    super.key,
    required this.values,
    this.min = 0,
    this.max = 100,
    this.divisions,
    this.onChanged,
    this.onChangeStart,
    this.onChangeEnd,
    this.enabled = true,
    this.rtl = false,
    this.showValueBubble = false,
    this.activeColor = Colors.blue,
    this.inactiveColor = Colors.grey,
    this.disabledActiveColor,
    this.disabledInactiveColor,
    this.trackHeight = 6,
    this.thumbRadius = 10,
  });

  @override
  Widget build(BuildContext context) {
    final Color currentActiveColor = enabled
        ? activeColor
        : (disabledActiveColor ?? Colors.grey);

    final Color currentInactiveColor = enabled
        ? inactiveColor
        : (disabledInactiveColor ?? Colors.grey.shade300);

    Widget slider = SliderTheme(
      data: SliderTheme.of(context).copyWith(
        trackHeight: trackHeight,
        activeTrackColor: currentActiveColor,
        inactiveTrackColor: currentInactiveColor,
        thumbColor: currentActiveColor,
        overlayColor: currentActiveColor.withAlpha(30),
        rangeThumbShape: RoundRangeSliderThumbShape(
          enabledThumbRadius: thumbRadius,
          disabledThumbRadius: thumbRadius,
        ),
        rangeValueIndicatorShape:
        PaddleRangeSliderValueIndicatorShape(),
        valueIndicatorColor: currentActiveColor,
      ),
      child: RangeSlider(
        values: values,
        min: min,
        max: max,
        divisions: divisions,
        labels: showValueBubble
            ? RangeLabels(
          values.start.toStringAsFixed(0),
          values.end.toStringAsFixed(0),
        )
            : null,
        onChanged: enabled ? onChanged : null,
        onChangeStart: enabled ? onChangeStart : null,
        onChangeEnd: enabled ? onChangeEnd : null,
      ),
    );

    if (rtl) {
      slider = Directionality(
        textDirection: TextDirection.rtl,
        child: slider,
      );
    }

    return slider;
  }
}