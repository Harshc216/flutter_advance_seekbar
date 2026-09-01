import 'package:flutter/material.dart';

class DemoCard extends StatelessWidget {
  final Widget child;

  const DemoCard({super.key, required this.child});

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 0,
      margin: const EdgeInsets.only(bottom: 16),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(18),
        side: BorderSide(color: Colors.grey.shade200),
      ),
      child: Padding(padding: const EdgeInsets.all(20), child: child),
    );
  }
}
