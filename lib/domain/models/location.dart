import 'package:skywatch/domain/models/latlgn.dart';
import 'package:skywatch/domain/models/weather/weather.dart';

class Location {
  Location._();

  late String name;
  late String country;
  late String state;
  late LatLng latLng;

  Weather? weather;

  factory Location.fromMap(Map<String, dynamic> data) {
    return Location._()
      ..name = data['name']
      ..country = data['country']
      ..state = data['state']
      ..latLng = LatLng.fromMap(data);
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'name': name,
      'country': country,
      'state': state,
      'lat': latLng.lat,
      'lon': latLng.lng,
    };
  }
}
