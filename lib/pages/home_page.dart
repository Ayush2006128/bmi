import 'package:bmi/bloc/bmi/bmi_bloc.dart';
import 'package:bmi/widgets/bmi_calculator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => BmiBloc(),
      child: Scaffold(
        appBar: AppBar(
          title: const Text("BMI Calc"),
        ),
        body: BmiCalculator(),
      ),
    );
  }
}