import 'package:bmi/bloc/bmi_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class BmiCalculator extends StatelessWidget {
  BmiCalculator({super.key});

  final TextEditingController heightCon = TextEditingController();
  final TextEditingController weightCon = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<BmiBloc, BmiState>(
      builder: (context, state) {
        if (state is BmiInitial) {
          return SingleChildScrollView(
            child: Column(
              children: [
                Row(
                  children: [
                    const Padding(
                      padding: EdgeInsets.all(8.0),
                      child: Text("height"),
                    ),
                    Expanded(
                      child: SizedBox(
                        width: double.infinity,
                        child: TextField(
                          controller: heightCon,
                        ),
                      ),
                    ),
                  ],
                ),
                Row(
                  children: [
                    const Padding(
                      padding: EdgeInsets.all(8.0),
                      child: Text("weight"),
                    ),
                    Expanded(
                      child: SizedBox(
                        width: double.infinity,
                        child: TextField(
                          controller: weightCon,
                        ),
                      ),
                    ),
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: ElevatedButton(
                    onPressed: () {
                      context.read<BmiBloc>().add(CalculateBmiEvent(
                          weight: double.parse(weightCon.text),
                          height: double.parse(heightCon.text)));
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.black,
                      foregroundColor: Colors.white,
                    ),
                    child: const Text("submit"),
                  ),
                ),
              ],
            ),
          );
        }
        return Center(
          child: Text(
            'Your BMI is: ${state.bmi!.toStringAsFixed(2)}',
            style: const TextStyle(fontSize: 24),
          ),
        );
      },
    );
  }
}
