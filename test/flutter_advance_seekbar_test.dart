import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_advance_seekbar/flutter_advance_seekbar.dart';

void main() {
  test('instantiates AdvancedSeekBar', () {
    const seekBar = AdvancedSeekBar(value: 50);
    expect(seekBar.value, 50);
  });
}
