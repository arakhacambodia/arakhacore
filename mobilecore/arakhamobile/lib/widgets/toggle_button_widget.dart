import 'package:flutter/material.dart';

class ToggleButtonWidget extends StatelessWidget {
  final bool isOn;
  final VoidCallback toggle;

  const ToggleButtonWidget({super.key, required this.isOn, required this.toggle});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      child: ElevatedButton(
        onPressed: toggle,
        child: Text(isOn ? 'Dark' : 'Light'),
      ),
    );
  }
}
