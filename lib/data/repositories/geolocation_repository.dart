import 'package:dio/dio.dart';
import 'package:skywatch/constants.dart';
import 'package:skywatch/domain/repositories/geolocation_repository.dart';

class GeolocationRepository extends IGeolocationRepository {
  @override
  Future<Response> getLocationByName(String data) {
    return Dio().get(
        "http://api.openweathermap.org/geo/1.0/direct?q=$data&limit=10&appid=${Constants.apiKey}");
  }
}
