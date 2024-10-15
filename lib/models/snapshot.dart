class BmiSnapshot {
  final double bmi;
  final DateTime time;

  const BmiSnapshot({required this.bmi, required this.time});

  factory BmiSnapshot.fromJson(Map<String, dynamic> json) {
    return BmiSnapshot(
      bmi: json['bmi'],
      time: DateTime.fromMicrosecondsSinceEpoch(json['timestamo']),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'bmi': bmi,
      'timestamp': time,
    };
  }
}
