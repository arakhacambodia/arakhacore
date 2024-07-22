import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:start_car_rental/firebase_options.dart';
import 'package:start_car_rental/presentation/pages/car_detail_page.dart';
import 'presentation/pages/onboard_page.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  runApp(const MainApp());
}

class MainApp extends StatefulWidget {
  const MainApp({super.key});

  @override
  State<MainApp> createState() => _MainAppState();
}

class _MainAppState extends State<MainApp> {
  FirebaseFirestore db = FirebaseFirestore.instance;

  void actionUserFirebase() {
    final user = {"firstname": "arun", "lastname": "lam", "born": 0};

    db.collection("users").add(user).then(
        (DocumentReference doc) => print("User added with ID : ${doc.id}"));
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Start Car Rental',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.green),
        useMaterial3: true,
      ),
      home: const OnboardPage(),
    );
  }
}
