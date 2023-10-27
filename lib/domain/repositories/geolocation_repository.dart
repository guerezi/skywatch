import 'package:dio/dio.dart';

abstract class IGeolocationRepository {
  Future<Response> getLocationByName(String data);
}
