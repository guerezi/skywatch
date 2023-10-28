import 'package:dio/dio.dart';
import 'package:skywatch/constants.dart';
import 'package:skywatch/domain/models/latlgn.dart';
import 'package:skywatch/domain/repositories/geolocation_repository.dart';

class GeolocationRepository extends IGeolocationRepository {
  @override
  Future<Response> getLocationByName(String data) {
    // I;m getting a lookup hist error on this URL, not sure why (it also returns wahts expected [??])

    final url =
        "https://api.openweathermap.org/geo/1.0/direct?q=$data&limit=10&appid=${Constants.apiKey}";

    return Dio().get(url);
  }

  @override
  Future<Response> getLocationByLatLgn(LatLng data) {
    final url =
        "https://api.openweathermap.org/geo/1.0/reverse?lat=${data.lat}&lon=${data.lng}&limit=10&appid=${Constants.apiKey}";

    return Dio().get(url);
  }
}
