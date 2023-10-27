class Clouds {
  late int all;

  Clouds._();

  factory Clouds.fromMap(Map<String, dynamic> data) {
    return Clouds._()..all = data['all'];
  }
}
