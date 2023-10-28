import 'package:flutter_clean_architecture/flutter_clean_architecture.dart';
import 'package:geolocator/geolocator.dart';
import 'package:skywatch/domain/models/location.dart';
import 'package:skywatch/domain/repositories/geolocation_repository.dart';
import 'package:skywatch/domain/repositories/gps_repository.dart';
import 'package:skywatch/domain/usecases/get_location_by_name_usecase.dart';
import 'package:skywatch/domain/usecases/get_gps_usecase.dart';
import 'package:skywatch/pages/welcome/observer/gps_observer.dart';
import 'package:skywatch/pages/welcome/observer/location_observer.dart';

class WelcomePresenter extends Presenter {
  WelcomePresenter({
    required IGeolocationRepository geolocationRespository,
    required IGPSRepository gpsRepository,
  })  : _gpsUsecase = GetGPSUseCase(gpsRepository),
        _geolocationUsecases = GetLocationByNameUseCase(geolocationRespository);

  final GetLocationByNameUseCase _geolocationUsecases;
  final GetGPSUseCase _gpsUsecase;

  Function()? getLocationOnComplete;
  Function(dynamic)? getLocationOnError;
  Function(List<Location>)? getLocationOnNext;

  Function()? getGPSOnComplete;
  Function(dynamic)? getGPSOnError;
  Function(Position)? getGPSOnNext;

  @override
  void dispose() {
    _geolocationUsecases.dispose();
    _gpsUsecase.dispose();
  }

  void getLocation(String data) {
    _geolocationUsecases.execute(
      LocationUseCaseObserver(this),
      LocationRequestData(data),
    );
  }

  void getPosition() {
    _gpsUsecase.execute(
      GPSUseCaseObserver(this),
      GPSRequestData(),
    );
  }
}
