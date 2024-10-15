class BmiData {
  final double bmi;
  final DateTime timestamp;

  const BmiData({required this.bmi, required this.timestamp});

  factory BmiData.fromJson(Map<String, dynamic> json) {
    return BmiData(
      bmi: json['bmi'],
      timestamp: DateTime.fromMicrosecondsSinceEpoch(json['timestamo']),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'bmi': bmi,
      'timestamp': timestamp,
    };
  }
}
