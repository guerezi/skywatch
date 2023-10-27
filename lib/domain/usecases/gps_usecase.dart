import 'dart:async';

import 'package:flutter_clean_architecture/flutter_clean_architecture.dart';
import 'package:geolocator/geolocator.dart';
import 'package:skywatch/domain/repositories/gps_repository.dart';

class GetGPSUseCase extends UseCase<GPSRequestResponse, GPSRequestData> {
  GetGPSUseCase(this.gpsRespository);

  final IGPSRepository gpsRespository;

  @override
  Future<Stream<GPSRequestResponse>> buildUseCaseStream(
    GPSRequestData? params,
  ) async {
    final controller = StreamController<GPSRequestResponse>();

    try {
      final response = await gpsRespository.getCurrentLatLgn();

      controller.add(
        GPSRequestResponse(response),
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

class GPSRequestData {
  GPSRequestData();
}

class GPSRequestResponse {
  final Position position;
  GPSRequestResponse(this.position);
}
