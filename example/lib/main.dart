import 'package:flutter/material.dart';

import 'screens/seek_bar_demo_screen.dart';

void main() {
  runApp(const AdvancedSeekBarExampleApp());
}

class AdvancedSeekBarExampleApp extends StatelessWidget {
  const AdvancedSeekBarExampleApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        useMaterial3: true,
        colorSchemeSeed: Colors.blue,
        scaffoldBackgroundColor: const Color(0xFFF5F7FB),
      ),
      home: const SeekBarDemoScreen(),
    );
  }
}
