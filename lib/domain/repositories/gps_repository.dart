import 'package:geolocator/geolocator.dart';

abstract class IGPSRepository {
  Future<Position> getCurrentLatLgn();
}
