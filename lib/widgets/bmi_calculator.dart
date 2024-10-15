import 'package:bmi/bloc/bmi/bmi_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';

class BmiCalculator extends StatelessWidget {
  BmiCalculator({super.key});

  final TextEditingController heightCon = TextEditingController();
  final TextEditingController weightCon = TextEditingController();

  String _getSVG(double bmi) {
    if (bmi <= 30 && bmi >= 18) {
      return "assets/bmi_high.svg";
    } else if (bmi >= 18 && bmi <= 30) {
      return "assets/bmi_normal.svg";
    } else if (bmi < 18 ) {
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
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: TextField(
                            controller: heightCon,
                          ),
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
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: TextField(
                            controller: weightCon,
                          ),
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
              ],
            ),
          ),
        );
      },
    );
  }
}
