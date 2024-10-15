import 'package:bmi/models/snapshot.dart';
import 'package:bmi/pages/home_page.dart';
import 'package:flutter/material.dart';
import 'package:hive/hive.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  Hive.init('/');
  Hive.registerAdapter(BmiDataAdapter());
  await Hive.openBox<BmiData>('bmi_data');
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomePage(),
    );
  }
}
