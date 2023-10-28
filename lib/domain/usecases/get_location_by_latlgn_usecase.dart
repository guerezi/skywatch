import 'dart:async';

import 'package:flutter_clean_architecture/flutter_clean_architecture.dart';
import 'package:skywatch/domain/models/latlgn.dart';
import 'package:skywatch/domain/models/location.dart';
import 'package:skywatch/domain/repositories/geolocation_repository.dart';

class GetLocationByLatLngUseCase
    extends UseCase<LocationRequestResponse, LocationByLatLngRequestData> {
  GetLocationByLatLngUseCase(this.locationRespository);

  final IGeolocationRepository locationRespository;

  @override
  Future<Stream<LocationRequestResponse>> buildUseCaseStream(
    LocationByLatLngRequestData? params,
  ) async {
    final controller = StreamController<LocationRequestResponse>();

    try {
      final response =
          await locationRespository.getLocationByLatLgn(params!.latlng);

      controller.add(
        LocationRequestResponse(
          Location.fromMap((response.data as List).first),
        ),
      );
    } catch (e) {
      logger.severe('$runtimeType unsuccessful.');
      controller.addError(e);
    } finally {
      controller.close();
    }
    return controller.stream;
  }
}

class LocationByLatLngRequestData {
  final LatLng latlng;
  LocationByLatLngRequestData(this.latlng);
}

class LocationRequestResponse {
  final Location location;
  LocationRequestResponse(this.location);
}
