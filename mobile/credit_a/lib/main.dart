import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: Center(
          child: Padding(
            padding: const EdgeInsets.all(24.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text('សួស្ដី កម្ពុជា', style: GoogleFonts.kantumruyPro(fontSize: 102, fontWeight: FontWeight.normal)),
                Spacer(),
                Text('សួស្ដី កម្ពុជា', style: GoogleFonts.notoSansKhmer(fontSize: 72, fontWeight: FontWeight.normal)),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
