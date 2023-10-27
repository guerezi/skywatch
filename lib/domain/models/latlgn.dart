class LatLng {
  LatLng(this.latitude, this.longitude);

  double latitude;
  double longitude;

  double get lat => latitude;
  double get lng => longitude;

  factory LatLng.fromMap(Map<String, dynamic> data) {
    final latitude = data['lat'];
    final longitude = data['lon'];

    return LatLng(latitude, longitude);
  }

  @override
  String toString() => "latitude: $lat longitude: $lng";
}
