class Wind {
  late double speed;
  late int? deg;
  late double? gust;

  Wind._();

  factory Wind.fromMap(Map<String, dynamic> data) {
    return Wind._()
      ..speed = data['speed'].toDouble()
      ..deg = data['deg']
      ..gust = data['gust']?.toDouble();
  }
}
