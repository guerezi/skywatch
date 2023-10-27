class Sys {
  late int type;
  late int id;
  late String country;
  late int sunrise;
  late int sunset;

  Sys._();

  factory Sys.fromMap(Map<String, dynamic> data) {
    return Sys._()
      ..type = data['type']
      ..id = data['id']
      ..country = data['country']
      ..sunrise = data['sunrise']
      ..sunset = data['sunset'];
  }
}
