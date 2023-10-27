class WeatherData {
  late int id;
  late String main;
  late String description;
  late String icon;

  WeatherData._();

  factory WeatherData.fromMap(Map<String, dynamic> data) {
    return WeatherData._()
      ..id = data['id']
      ..main = data['main']
      ..description = data['description']
      ..icon = data['icon'];
  }
}
