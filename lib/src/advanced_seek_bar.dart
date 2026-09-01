import 'package:flutter/material.dart';
import 'seek_bar_theme.dart';

class AdvancedSeekBar extends StatelessWidget {
  final double value;
  final double min;
  final double max;

  final int? divisions;

  final ValueChanged<double>? onChanged;
  final ValueChanged<double>? onChangeStart;
  final ValueChanged<double>? onChangeEnd;

  final bool enabled;
  final bool vertical;
  final bool rtl;

  final bool showValueBubble;
  final bool showTicks;

  final bool emojiThumb;
  final List<String> bubbleEmojis;

  final IconData? thumbIcon;

  final AdvancedSeekBarTheme theme;

  const AdvancedSeekBar({
    super.key,
    required this.value,
    this.min = 0,
    this.max = 100,
    this.divisions,
    this.onChanged,
    this.onChangeStart,
    this.onChangeEnd,
    this.enabled = true,
    this.vertical = false,
    this.rtl = false,
    this.showValueBubble = false,
    this.showTicks = false,
    this.emojiThumb = false,
    this.bubbleEmojis = const ['😠', '😐', '😊'],
    this.thumbIcon,
    this.theme = const AdvancedSeekBarTheme(),
  }) : assert(min <= max),
       assert(value >= min && value <= max);

  @override
  Widget build(BuildContext context) {
    Widget slider = SliderTheme(
      data: SliderTheme.of(context).copyWith(
        trackHeight: theme.trackHeight,
        activeTrackColor: theme.activeColor,
        inactiveTrackColor: theme.inactiveColor,
        thumbColor: theme.activeColor,
        overlayColor: theme.activeColor.withValues(alpha: 0.15),
        valueIndicatorColor: theme.activeColor,
        disabledActiveTrackColor: theme.disabledColor ?? Colors.grey.shade400,
        disabledInactiveTrackColor: theme.disabledColor ?? Colors.grey.shade300,
        disabledThumbColor: theme.disabledColor ?? Colors.grey.shade400,
      ),
      child: Slider(
        value: value,
        min: min,
        max: max,
        divisions: divisions,
        label: showValueBubble ? value.toStringAsFixed(0) : null,
        onChanged: enabled ? onChanged : null,
        onChangeStart: enabled ? onChangeStart : null,
        onChangeEnd: enabled ? onChangeEnd : null,
      ),
    );

    if (vertical) {
      slider = RotatedBox(quarterTurns: -1, child: slider);
    }

    if (rtl) {
      slider = Directionality(textDirection: TextDirection.rtl, child: slider);
    }

    return slider;
  }
}
