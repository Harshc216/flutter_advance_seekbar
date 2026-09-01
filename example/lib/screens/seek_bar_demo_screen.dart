import 'package:flutter/material.dart';
import 'package:flutter_advance_seekbar/flutter_advance_seekbar.dart';

import '../widgets/demo_card.dart';
import '../widgets/demo_section.dart';

class SeekBarDemoScreen extends StatefulWidget {
  const SeekBarDemoScreen({super.key});

  @override
  State<SeekBarDemoScreen> createState() => _SeekBarDemoScreenState();
}

class _SeekBarDemoScreenState extends State<SeekBarDemoScreen> {
  double roundedValue = 65;
  double gradientValue = 70;
  double verticalValue = 55;
  double tickValue = 40;
  double bubbleValue = 72;
  double emojiValue = 75;
  double iconValue = 60;
  double rtlValue = 35;

  RangeValues rangeValues = const RangeValues(20, 80);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Advanced SeekBar',
          style: TextStyle(fontWeight: FontWeight.w700),
        ),
        centerTitle: false,
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(16),
          child: Column(
            children: [
              _buildRoundedSection(),

              _buildGradientSection(),

              _buildVerticalSection(),

              _buildTickSection(),

              _buildBubbleSection(),

              _buildRangeSection(),

              _buildDisabledSection(),

              _buildEmojiSection(),

              _buildIconSection(),

              _buildRtlSection(),

              const SizedBox(height: 20),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildRoundedSection() {
    return DemoCard(
      child: DemoSection(
        title: 'Custom Rounded SeekBar',
        description: 'Smooth rounded edges with custom colors.',
        child: Column(
          children: [
            AdvancedSeekBar(
              value: roundedValue,
              theme: AdvancedSeekBarTheme(
                activeColor: Colors.blue,
                inactiveColor: Colors.grey.shade300,
                trackHeight: 10,
                trackRadius: BorderRadius.circular(20),
              ),
              onChanged: (value) {
                setState(() {
                  roundedValue = value;
                });
              },
            ),
            _valueText(roundedValue),
          ],
        ),
      ),
    );
  }

  Widget _buildGradientSection() {
    return DemoCard(
      child: DemoSection(
        title: 'Gradient SeekBar',
        description: 'Multi-color gradient track.',
        child: Column(
          children: [
            AdvancedSeekBar(
              value: gradientValue,
              theme: const AdvancedSeekBarTheme(
                trackHeight: 10,
                gradient: LinearGradient(
                  colors: [Colors.blue, Colors.purple, Colors.pink],
                ),
              ),
              onChanged: (value) {
                setState(() {
                  gradientValue = value;
                });
              },
            ),
            _valueText(gradientValue),
          ],
        ),
      ),
    );
  }

  Widget _buildVerticalSection() {
    return DemoCard(
      child: DemoSection(
        title: 'Vertical SeekBar',
        description: 'Vertical orientation with smooth interaction.',
        child: SizedBox(
          height: 220,
          child: Center(
            child: AdvancedSeekBar(
              value: verticalValue,
              orientation: SeekBarOrientation.vertical,
              theme: const AdvancedSeekBarTheme(trackHeight: 10),
              onChanged: (value) {
                setState(() {
                  verticalValue = value;
                });
              },
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildTickSection() {
    return DemoCard(
      child: DemoSection(
        title: 'Tick Mark SeekBar',
        description: 'Discrete steps with visual tick marks.',
        child: Column(
          children: [
            AdvancedSeekBar(
              value: tickValue,
              divisions: 10,
              showTicks: true,
              theme: const AdvancedSeekBarTheme(trackHeight: 7),
              onChanged: (value) {
                setState(() {
                  tickValue = value;
                });
              },
            ),
            _valueText(tickValue),
          ],
        ),
      ),
    );
  }

  Widget _buildBubbleSection() {
    return DemoCard(
      child: DemoSection(
        title: 'Value Bubble SeekBar',
        description: 'Displays the current value while dragging.',
        child: Column(
          children: [
            AdvancedSeekBar(
              value: bubbleValue,
              showValueBubble: true,
              theme: const AdvancedSeekBarTheme(trackHeight: 8),
              onChanged: (value) {
                setState(() {
                  bubbleValue = value;
                });
              },
            ),
            _valueText(bubbleValue),
          ],
        ),
      ),
    );
  }

  Widget _buildRangeSection() {
    return DemoCard(
      child: DemoSection(
        title: 'Range SeekBar',
        description: 'Dual-thumb slider for minimum and maximum.',
        child: Column(
          children: [
            AdvancedRangeSeekBar(
              values: rangeValues,
              min: 0,
              max: 100,
              showValueBubble: true,
              activeColor: Colors.blue,
              inactiveColor: Colors.grey.shade300,
              trackHeight: 8,
              onChanged: (values) {
                setState(() {
                  rangeValues = values;
                });
              },
            ),
            const SizedBox(height: 8),
            Text(
              '${rangeValues.start.toInt()} - '
              '${rangeValues.end.toInt()}',
              style: const TextStyle(fontWeight: FontWeight.w700),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildDisabledSection() {
    return DemoCard(
      child: DemoSection(
        title: 'Disabled / Read-Only',
        description: 'Preview-only progress without interaction.',
        child: const AdvancedSeekBar(value: 70, enabled: false),
      ),
    );
  }

  Widget _buildEmojiSection() {
    return DemoCard(
      child: DemoSection(
        title: 'Emoji SeekBar',
        description: 'Thumb changes according to the current value.',
        child: Column(
          children: [
            AdvancedSeekBar(
              value: emojiValue,
              emojiThumb: true,
              emojis: const ['😠', '😐', '😊'],
              theme: const AdvancedSeekBarTheme(trackHeight: 8),
              onChanged: (value) {
                setState(() {
                  emojiValue = value;
                });
              },
            ),
            _valueText(emojiValue),
          ],
        ),
      ),
    );
  }

  Widget _buildIconSection() {
    return DemoCard(
      child: DemoSection(
        title: 'Icon SeekBar',
        description: 'Use any Material icon as the thumb.',
        child: Column(
          children: [
            AdvancedSeekBar(
              value: iconValue,
              thumbIcon: Icons.volume_up,
              theme: const AdvancedSeekBarTheme(
                trackHeight: 8,
                thumbSize: 38,
                iconSize: 21,
              ),
              onChanged: (value) {
                setState(() {
                  iconValue = value;
                });
              },
            ),
            _valueText(iconValue),
          ],
        ),
      ),
    );
  }

  Widget _buildRtlSection() {
    return DemoCard(
      child: DemoSection(
        title: 'RTL SeekBar',
        description: 'Right-to-left slider direction.',
        child: Column(
          children: [
            AdvancedSeekBar(
              value: rtlValue,
              rtl: true,
              theme: const AdvancedSeekBarTheme(trackHeight: 8),
              onChanged: (value) {
                setState(() {
                  rtlValue = value;
                });
              },
            ),
            _valueText(rtlValue),
          ],
        ),
      ),
    );
  }

  Widget _valueText(double value) {
    return Text(
      'Value: ${value.toInt()}',
      style: const TextStyle(fontWeight: FontWeight.w700),
    );
  }
}
