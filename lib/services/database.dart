import 'package:bmi/models/snapshot.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:hive_flutter/hive_flutter.dart';

void saveSnapshot(double bmi, DateTime timestamp) async {
  final Box<BmiData> bmiBox = await Hive.openBox('mybox');
  final BmiData bmiData = BmiData(bmi: bmi, timestamp: timestamp);
  await bmiBox.add(bmiData);
}

Future<List<BmiData>> getSnapshot() async {
  final Box<BmiData> bmiBox = await Hive.openBox('mybox');
  final List<BmiData> bmiDataList = bmiBox.values.toList();
  return bmiDataList;
}
