part of 'bmi_bloc.dart';

@immutable
sealed class BmiState {
  final double? bmi; // Make bmi nullable

  const BmiState({this.bmi});
}

final class BmiInitial extends BmiState {
  const BmiInitial();
}

final class BmiCalculatedState extends BmiState {
  final double bmi;

  const BmiCalculatedState({required this.bmi});
}