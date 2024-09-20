final class MetaModel {
  const MetaModel({required this.time, required this.dateTime});

  const MetaModel.empty() : this(dateTime: '', time: 0);

  final int time;
  final String dateTime;

  factory MetaModel.fromJson(Map<String, dynamic> json) {
    return MetaModel(
      time: json.containsKey('time') ? (int.tryParse(json['time'].toString()) ?? 0) : 0,
      dateTime: json.containsKey('tarih') ? (json['tarih'] as String? ?? '') : '',
    );
  }
}
