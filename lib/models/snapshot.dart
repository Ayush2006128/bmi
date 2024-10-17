import 'package:hive_flutter/hive_flutter.dart';

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

// craete a adapter 
class BmiDataAdapter implements TypeAdapter<BmiData> {
  @override
  final int typeId = 0;

  @override
  BmiData read(BinaryReader reader) {
    final fields = reader.readMap();
    return BmiData(
      bmi: fields['bmi'] as double,
      timestamp: DateTime.fromMicrosecondsSinceEpoch(fields['timestamp'] as int),
    );
  }

  @override
  void write(BinaryWriter writer, BmiData obj) {
    writer.writeMap({
      'bmi': obj.bmi,
      'timestamp': obj.timestamp.microsecondsSinceEpoch,
    });
  }

}
