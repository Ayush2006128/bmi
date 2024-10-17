import 'package:bmi/services/database.dart';
import 'package:bmi/utils/parse_month.dart';
import 'package:bmi/widgets/list_tile.dart';
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
          if (snapshot.data!.isNotEmpty) {
            return Center(
              child: ListView.builder(
                itemCount: snapshot.data!.length,
                itemBuilder: (context, index) {
                  final month = getMonth(snapshot.data![index].timestamp.month);
                  return Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: MyListTile(
                        heading: 'BMI: ${snapshot.data![index].bmi}',
                        subtitle: month),
                  );
                },
              ),
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
