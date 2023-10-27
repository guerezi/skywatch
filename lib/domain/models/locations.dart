import 'package:skywatch/domain/models/location.dart';

class Locations {
  Locations();

  final List<Location> _locations = [];

  void addLocation(Location loc) => _locations.add(loc);
  void removeLocation(Location loc) => _locations.add(loc);

  List<Location> get getLocations => _locations;
}
