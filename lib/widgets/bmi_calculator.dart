import 'package:bmi/bloc/bmi/bmi_bloc.dart';
import 'package:bmi/services/database.dart';
import 'package:bmi/widgets/bmi_form.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';

class BmiCalculator extends StatelessWidget {
  BmiCalculator({super.key});

  final TextEditingController heightCon = TextEditingController();
  final TextEditingController weightCon = TextEditingController();
  final DateTime now = DateTime.now();

  String _getSVG(double bmi) {
    if (bmi <= 30 && bmi >= 18) {
      return "assets/bmi_high.svg";
    } else if (bmi >= 18 && bmi <= 30) {
      return "assets/bmi_normal.svg";
    } else if (bmi < 18) {
      return "assets/bmi_low.svg";
    } else {
      return "assets/bmi_high.svg";
    }
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<BmiBloc, BmiState>(
      builder: (context, state) {
        if (state is BmiInitial) {
          return Center(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: BmiForm(
                heightCon: heightCon,
                weightCon: weightCon,
                onSubmit: () {
                  context.read<BmiBloc>().add(CalculateBmiEvent(
                      weight: double.parse(weightCon.text),
                      height: double.parse(heightCon.text)));
                },
              ),
            ),
          );
        }
        return Center(
          child: SingleChildScrollView(
            child: Column(
              children: [
                SizedBox(
                  width: 500,
                  height: 500,
                  child: SvgPicture.asset(_getSVG(state.bmi ?? 0)),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    'Your BMI is: ${state.bmi!.toStringAsFixed(2)}',
                    style: const TextStyle(fontSize: 24),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: ElevatedButton(
                    onPressed: () {
                      saveSnapshot(state.bmi ?? 0, now);
                      Navigator.pop(context);
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.black,
                      foregroundColor: Colors.white,
                    ),
                    child: const Text('save'),
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
