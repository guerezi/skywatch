import 'package:flutter_clean_architecture/flutter_clean_architecture.dart';
import 'package:geolocator/geolocator.dart';
import 'package:skywatch/domain/models/latlgn.dart';
import 'package:skywatch/domain/models/location.dart';
import 'package:skywatch/domain/models/weather/weather.dart';
import 'package:skywatch/domain/repositories/geolocation_repository.dart';
import 'package:skywatch/domain/repositories/gps_repository.dart';
import 'package:skywatch/domain/repositories/weather_repository.dart';
import 'package:skywatch/domain/usecases/get_location_usecase.dart';
import 'package:skywatch/domain/usecases/get_weather_usecase.dart';
import 'package:skywatch/domain/usecases/gps_usecase.dart';
import 'package:skywatch/pages/welcome/observer/gps_observer.dart';
import 'package:skywatch/pages/welcome/observer/location_observer.dart';
import 'package:skywatch/pages/welcome/observer/weather_observer.dart';

class WelcomePresenter extends Presenter {
  WelcomePresenter({
    required IWeatherRespository weatherRespository,
    required IGeolocationRepository geolocationRespository,
    required IGPSRepository gpsRepository,
  })  : _weatherUsecase = GetWeatherUseCase(weatherRespository),
        _gpsUsecase = GetGPSUseCase(gpsRepository),
        _geolocationUsecases = GetLocationUseCase(geolocationRespository);

  final GetWeatherUseCase _weatherUsecase;
  final GetLocationUseCase _geolocationUsecases;
  final GetGPSUseCase _gpsUsecase;

  Function()? getWeatherOnComplete;
  Function(dynamic)? getWeatherOnError;
  Function(Weather)? getWeatherOnNext;

  Function()? getLocationOnComplete;
  Function(dynamic)? getLocationOnError;
  Function(Location)? getLocationOnNext;

  Function()? getGPSOnComplete;
  Function(dynamic)? getGPSOnError;
  Function(Position)? getGPSOnNext;

  @override
  void dispose() {
    _geolocationUsecases.dispose();
    _weatherUsecase.dispose();
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

  void getWeather(LatLng data) {
    _weatherUsecase.execute(
      WeatherUseCaseObserver(this),
      WeatherRequestData(data),
    );
  }
}
