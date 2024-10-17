// ignore_for_file: unused_local_variable

import 'package:bmi/models/snapshot.dart';
import 'package:bmi/pages/bmi_page.dart';
import 'package:bmi/pages/home_page.dart';
import 'package:flutter/material.dart';
import 'package:hive_flutter/adapters.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Hive.initFlutter();
  Hive.registerAdapter(BmiDataAdapter());
  Box<BmiData> mybox = await Hive.openBox('mybox');
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: '/',
      routes: {
        '/': (context) => const HomePage(),
        '/bmi_page': (context) => const BmiPage()
      },
    );
  }
}
