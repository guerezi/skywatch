import 'package:dio/dio.dart';

import 'package:skywatch/domain/models/latlgn.dart';

abstract class IWeatherRespository {
  Future<Response> getLocationWeather(LatLng data);
}
