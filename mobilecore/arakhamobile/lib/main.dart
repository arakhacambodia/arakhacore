import 'dart:async';

import 'package:arakhamobile/helpers/app_locale.dart';
import 'package:arakhamobile/widgets/toggle_dark_light_widget.dart';
import 'package:arakhamobile/widgets/toggle_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localization/flutter_localization.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'package:intl/intl.dart';

void main() {
  initializeDateFormatting('km', '');
  runApp(const HomePage());
}

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final FlutterLocalization _localization = FlutterLocalization.instance;

  bool isDarkTheme = false;
  bool isKhmer = true;

  late String dateString;
  late String timeString;

  @override
  void initState() {
    super.initState();
    _localization.init(mapLocales: [
      MapLocale('en', AppLocale.en, countryCode: 'US', fontFamily: GoogleFonts.lato().fontFamily),
      MapLocale('km', AppLocale.km, countryCode: 'KH', fontFamily: GoogleFonts.kantumruyPro().fontFamily),
    ], initLanguageCode: 'km');
    _localization.onTranslatedLanguage = _onTranslatedLanguage;
    dateString = _formatDate(DateTime.now());
    timeString = _formatTime(DateTime.now());
    Timer.periodic(const Duration(seconds: 1), (Timer t) => _getTime());
  }

  void _onTranslatedLanguage(Locale? locale) {
    setState(() {});
  }

  void _getTime() {
    final String formattedDate = _formatDate(DateTime.now());
    final String formattedTime = _formatTime(DateTime.now());
    setState(() {
      dateString = formattedDate;
      timeString = formattedTime;
    });
  }

  String _formatTime(DateTime dateTime) {
    return DateFormat('hh:mm:ss a').format(dateTime);
  }

  String _formatDate(DateTime dateTime) {
    return DateFormat('EEEE dd MMM yyyy', isKhmer ? 'km' : 'en').format(dateTime);
  }

  void toggle() {
    setState(() {
      isDarkTheme = !isDarkTheme;
    });
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.sizeOf(context);
    double width = size.width;
    return MaterialApp(
      supportedLocales: _localization.supportedLocales,
      localizationsDelegates: _localization.localizationsDelegates,
      debugShowCheckedModeBanner: false,
      theme: isDarkTheme ? ThemeData.dark() : ThemeData.light(),
      home: SafeArea(
        child: Scaffold(
          body: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Expanded(
                  flex: 1,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      ToggleWidget(
                        isOn: isKhmer,
                        text: AppLocale.language,
                        toggle: () {
                          setState(() {
                            isKhmer = !isKhmer;
                          });
                          _localization.translate(isKhmer ? 'km' : 'en');
                        },
                      ),
                      ToggleDarkLightWidget(isOn: isDarkTheme, toggle: toggle),
                    ],
                  ),
                ),
                Expanded(
                  flex: 11,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Container(
                          padding: const EdgeInsets.all(16.0),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                dateString,
                                style: GoogleFonts.kantumruyPro(fontSize: width * 0.08),
                              ),
                              Text(
                                timeString,
                                style: TextStyle(fontSize: width * 0.06),
                              ),
                            ],
                          )),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
