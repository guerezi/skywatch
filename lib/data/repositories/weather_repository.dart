import 'package:dio/dio.dart';
import 'package:skywatch/constants.dart';
import 'package:skywatch/domain/models/latlgn.dart';
import 'package:skywatch/domain/repositories/weather_repository.dart';

class WeatherRespository extends IWeatherRespository {
  @override
  Future<Response> getLocationWeather(LatLng data) {
    return Dio().get(
        "https://api.openweathermap.org/data/2.5/weather?lat=${data.lat}&lon=${data.lng}&appid=${Constants.apiKey}");
  }
}
