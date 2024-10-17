import 'package:bmi/services/database.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        title: const Text('BMI Calc'),
      ),
      body: FutureBuilder(
        future: getSnapshot(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return Center(
              child: Text("${snapshot.data!.length}"),
            );
          } else {
            return const Center(
              child: CircularProgressIndicator(
                color: Colors.black,
                strokeCap: StrokeCap.round,
              ),
            );
          }
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.pushNamed(context, '/bmi_page');
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}
