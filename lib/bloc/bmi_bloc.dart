import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';

part 'bmi_event.dart';
part 'bmi_state.dart';

class BmiBloc extends Bloc<BmiEvent, BmiState> {
  BmiBloc() : super(BmiInitial()) {
    on<BmiEvent>((event, emit) {
      if (event is CalculateBmiEvent) {
        final bmi = calculateBmi(event.weight, event.height, isMetric: event.isMetric);
        emit(BmiCalculatedState(bmi: bmi));
      }
    });
  }

  double calculateBmi(double weight, double height, {bool isMetric = true}) {
    if (isMetric) {
      return weight / (height * height);
    }
    return weight / ((height * height) * 703);
  }
}
