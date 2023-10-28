import 'package:dio/dio.dart';
import 'package:skywatch/domain/models/latlgn.dart';

abstract class IGeolocationRepository {
  Future<Response> getLocationByName(String data);
  Future<Response> getLocationByLatLgn(LatLng data);
}
