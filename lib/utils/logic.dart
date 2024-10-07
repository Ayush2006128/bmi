double bmiLogic({bool isMeter = true, double height = 0, double weight = 0}) {
  double bmi;
  if (isMeter) {
    bmi = weight / height * height;
    return bmi;
  }
  bmi = weight / height * height * 703;
  return bmi;
}
