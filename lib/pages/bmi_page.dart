import 'package:bmi/bloc/bmi/bmi_bloc.dart';
import 'package:bmi/theme.dart';
import 'package:bmi/widgets/bmi_calculator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class BmiPage extends StatelessWidget {
  const BmiPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => BmiBloc(),
      child: Scaffold(
        backgroundColor: backgroundColor,
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          title: const Text("BMI Calc"),
        ),
        body: BmiCalculator(),
      ),
    );
  }
}
