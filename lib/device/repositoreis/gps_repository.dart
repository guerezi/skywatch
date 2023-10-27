import 'package:geolocator/geolocator.dart';
import 'package:skywatch/domain/repositories/gps_repository.dart';

class GPSRepository extends IGPSRepository {
  @override
  Future<Position> getCurrentLatLgn() {
    return Geolocator.getCurrentPosition();
  }
}
