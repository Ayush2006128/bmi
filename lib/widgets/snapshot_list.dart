import 'package:flutter/material.dart';

class SnapshotList extends StatelessWidget {
  final List<double> bmiValue;
  final List<DateTime> timestamp;
  const SnapshotList({
    super.key,
    required this.bmiValue,
    required this.timestamp,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          border: Border.all(color: Colors.black),
          borderRadius: BorderRadius.circular(10)),
      width: MediaQuery.of(context).size.width * 0.8,
      height: MediaQuery.of(context).size.height * 0.9,
      child: ListView.builder(
        itemCount: bmiValue.length,
        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text("BMI: ${bmiValue[index]} timestamp: ${timestamp[index]}"),
          );
        },
      ),
    );
  }
}
