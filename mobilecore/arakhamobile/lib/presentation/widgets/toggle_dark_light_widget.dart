import 'package:arakhamobile/helpers/app_locale.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localization/flutter_localization.dart';

class ToggleDarkLightWidget extends StatelessWidget {
  final bool isOn;
  final VoidCallback toggle;

  const ToggleDarkLightWidget({super.key, required this.isOn, required this.toggle});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 8),
      child: ElevatedButton(
        onPressed: toggle,
        child: Text(isOn ? AppLocale.dark.getString(context) : AppLocale.light.getString(context)),
      ),
    );
  }
}
