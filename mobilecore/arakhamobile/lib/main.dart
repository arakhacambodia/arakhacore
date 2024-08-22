import 'package:flutter/material.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'package:arakhamobile/presentation/pages/clock_page.dart';

void main() {
  initializeDateFormatting('km', '');
  runApp(const ClockPage());
}
