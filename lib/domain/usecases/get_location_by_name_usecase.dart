import 'dart:async';

import 'package:flutter_clean_architecture/flutter_clean_architecture.dart';
import 'package:skywatch/domain/models/location.dart';
import 'package:skywatch/domain/repositories/geolocation_repository.dart';

class GetLocationByNameUseCase
    extends UseCase<LocationRequestResponse, LocationRequestData> {
  GetLocationByNameUseCase(this.locationRespository);

  final IGeolocationRepository locationRespository;

  @override
  Future<Stream<LocationRequestResponse>> buildUseCaseStream(
    LocationRequestData? params,
  ) async {
    final controller = StreamController<LocationRequestResponse>();

    try {
      final response =
          await locationRespository.getLocationByName(params!.placeName);

      controller.add(
        LocationRequestResponse(
          (response.data as List)
              .map<Location>(
                (e) => Location.fromMap(
                  e as Map<String, dynamic>,
                ),
              )
              .toList(),
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

class LocationRequestData {
  final String placeName;
  LocationRequestData(this.placeName);
}

class LocationRequestResponse {
  final List<Location> location;
  LocationRequestResponse(this.location);
}
