import 'package:flutter/material.dart';
import 'models/seek_bar_orientation.dart';
import 'painters/rounded_track_painter.dart';
import 'painters/tick_mark_painter.dart';
import 'seek_bar_theme.dart';
import 'thumbs/emoji_thumb_shape.dart';
import 'thumbs/icon_thumb_shape.dart';

class AdvancedSeekBar extends StatelessWidget {
  final double value;
  final double min;
  final double max;

  final int? divisions;

  final ValueChanged<double>? onChanged;
  final ValueChanged<double>? onChangeStart;
  final ValueChanged<double>? onChangeEnd;

  final bool enabled;
  final SeekBarOrientation orientation;
  final bool vertical;
  final bool rtl;

  final bool showValueBubble;
  final bool showTicks;

  final bool emojiThumb;
  final List<String> emojis;

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
    this.orientation = SeekBarOrientation.horizontal,
    this.vertical = false,
    this.rtl = false,
    this.showValueBubble = false,
    this.showTicks = false,
    this.emojiThumb = false,
    List<String>? emojis,
    List<String>? bubbleEmojis,
    this.thumbIcon,
    this.theme = const AdvancedSeekBarTheme(),
  })  : emojis = emojis ?? bubbleEmojis ?? const ['😠', '😐', '😊'],
        assert(min <= max),
        assert(value >= min && value <= max);

  @override
  Widget build(BuildContext context) {
    SliderComponentShape? thumbShape;
    if (emojiThumb) {
      thumbShape = EmojiThumbShape(
        emojis: emojis,
        size: theme.thumbSize,
      );
    } else if (thumbIcon != null) {
      thumbShape = IconThumbShape(
        icon: thumbIcon!,
        size: theme.thumbSize,
        iconSize: theme.iconSize,
        backgroundColor: theme.activeColor,
      );
    }

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
        trackShape: RoundedTrackPainter(
          gradient: theme.gradient,
          borderRadius: theme.trackRadius,
        ),
        tickMarkShape: showTicks ? const TickMarkPainter() : null,
        thumbShape: thumbShape,
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

    if (orientation == SeekBarOrientation.vertical || vertical) {
      slider = RotatedBox(quarterTurns: -1, child: slider);
    }

    if (rtl) {
      slider = Directionality(textDirection: TextDirection.rtl, child: slider);
    }

    return slider;
  }
}
