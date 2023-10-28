import 'package:skywatch/domain/models/location.dart';
import 'package:skywatch/domain/models/locations.dart';

class User {
  User._();

  late String name;
  late int level;
  late String hometown;
  late Locations cities;

  factory User.fromMap(Map<String, dynamic> data) {
    final locations = Locations()
      ..addLocations(
        (data['cities'] as List)
            .map(
              (e) => Location.fromMap(e),
            )
            .toList(),
      );

    return User._()
      ..name = data['name']
      ..level = data['level']
      ..hometown = data['homeTown']
      ..cities = locations;
  }
}
