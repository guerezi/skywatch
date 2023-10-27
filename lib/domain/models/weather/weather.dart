import 'package:skywatch/domain/models/all_weather.dart';
import 'package:skywatch/domain/models/latlgn.dart';

class Weather {
  Weather._();

  late int visibility;
  late int dt;
  late int timezone;
  late int id;
  late int cod;
  late String base;
  late String name;

  late List<WeatherData> weather;

  late LatLng latlng;
  late Clouds clouds;
  late Rain rain;
  late Sys sys;
  late MainWeather main;
  late Wind wind;

  factory Weather.fromMap(Map<String, dynamic> data) {
    return Weather._()
      ..latlng = LatLng.fromMap(data['coord'])
      ..weather = (data['weather'] as List)
          .map((item) => WeatherData.fromMap(item))
          .toList()
      ..base = data['base']
      ..main = MainWeather.fromMap(data['main'])
      ..visibility = data['visibility']
      ..wind = Wind.fromMap(data['wind'])
      ..rain = Rain.fromMap(data['rain'])
      ..clouds = Clouds.fromMap(data['clouds'])
      ..dt = data['dt']
      ..sys = Sys.fromMap(data['sys'])
      ..timezone = data['timezone']
      ..id = data['id']
      ..name = data['name']
      ..cod = data['cod'];
  }
}
