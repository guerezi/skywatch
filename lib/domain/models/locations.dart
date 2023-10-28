import 'package:skywatch/domain/models/location.dart';

class Locations {
  Locations();

  final Set<Location> _locations = {};

  void addLocation(Location loc) => _locations.add(loc);
  void addLocations(List<Location> loc) => _locations.addAll(loc);

  void removeLocation(Location loc) => _locations.add(loc);

  List<Location> get getLocations => _locations.toList();
}
