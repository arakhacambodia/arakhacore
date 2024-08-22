import 'package:flutter/material.dart';
import 'package:flutter_localization/flutter_localization.dart';

class ToggleWidget extends StatelessWidget {
  final bool? isOn;
  final String text;
  final VoidCallback? toggle;

  const ToggleWidget({super.key, required this.text, this.toggle, this.isOn});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 8),
      child: ElevatedButton(onPressed: toggle, child: Text(text.getString(context))),
    );
  }
}
