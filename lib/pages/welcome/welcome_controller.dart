import 'package:flutter/material.dart';
import 'package:flutter_clean_architecture/flutter_clean_architecture.dart';
import 'package:skywatch/domain/models/location.dart';
import 'package:skywatch/domain/models/weather/weather.dart';
import 'package:skywatch/pages/welcome/welcome_presenter.dart';

class WelcomeController extends Controller {
  WelcomeController({required this.presenter});

  final WelcomePresenter presenter;
  Location? location;

  @override
  void initListeners() {
    initWeatherListeners();
    initLocationListeners();
  }

  void onComplete(String usecaseName) =>
      logger.info("$usecaseName Usecase Ended");

  void onError(dynamic error) {
    ScaffoldMessenger.of(getContext()).showSnackBar(SnackBar(
      content: Text("An error occoured: $error"),
    ));
  }

  void initWeatherListeners() {
    presenter.getWeatherOnComplete = () => onComplete('Weather');
    presenter.getWeatherOnError = onError;
    presenter.getWeatherOnNext = getWeatherOnNext;
  }

  void getWeatherOnNext(Weather weather) {
    location!.weather = weather;
    refreshUI();
  }

  void requestWeather() {
    presenter.getWeather(location!.latLng);
    //Loading
  }

  void initLocationListeners() {
    presenter.getLocationOnComplete = () => onComplete('Location');
    presenter.getLocationOnError = onError;
    presenter.getLocationOnNext = getLocationOnNext;
  }

  void getLocationOnComplete() => logger.info("Location Usecase Ended");

  void getLocationOnNext(Location location) {
    location = location;
    refreshUI();
  }

  @override
  void onDisposed() {
    presenter.dispose();
    super.onDisposed();
  }
}





  // bool serviceEnabled;
  // LocationPermission permission;

  // // Test if location services are enabled.
  // serviceEnabled = await Geolocator.isLocationServiceEnabled();
  // if (!serviceEnabled) {
  //   // Location services are not enabled don't continue
  //   // accessing the position and request users of the 
  //   // App to enable the location services.
  //   return Future.error('Location services are disabled.');
  // }

  // permission = await Geolocator.checkPermission();
  // if (permission == LocationPermission.denied) {
  //   permission = await Geolocator.requestPermission();
  //   if (permission == LocationPermission.denied) {
  //     // Permissions are denied, next time you could try
  //     // requesting permissions again (this is also where
  //     // Android's shouldShowRequestPermissionRationale 
  //     // returned true. According to Android guidelines
  //     // your App should show an explanatory UI now.
  //     return Future.error('Location permissions are denied');
  //   }
  // }
  
  // if (permission == LocationPermission.deniedForever) {
  //   // Permissions are denied forever, handle appropriately. 
  //   return Future.error(
  //     'Location permissions are permanently denied, we cannot request permissions.');
  // } 