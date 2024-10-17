import 'package:bmi/theme.dart';
import 'package:flutter/material.dart';

class MyListTile extends StatelessWidget {
  final String heading;
  final String subtitle;
  const MyListTile({super.key, required this.heading, required this.subtitle});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: containerColor,
      ),
      child: ListTile(
        title: Text(heading),
        subtitle: Text(subtitle),
      ),
    );
  }
}
