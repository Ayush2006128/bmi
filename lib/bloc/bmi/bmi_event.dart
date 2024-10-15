part of 'bmi_bloc.dart';

@immutable
sealed class BmiEvent {}

class CalculateBmiEvent extends BmiEvent {
  final double weight;
  final double height;
  final bool isMetric;

  CalculateBmiEvent({required this.weight, required this.height, this.isMetric = true});
}
