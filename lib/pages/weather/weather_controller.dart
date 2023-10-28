import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:skywatch/domain/models/location.dart';
import 'package:skywatch/domain/models/weather/weather.dart';
import 'package:skywatch/pages/common/skywatch_controller.dart';
import 'package:skywatch/pages/weather/weather_presenter.dart';
import 'package:skywatch/route/routes.dart';

class WeatherController extends SkywatchController {
  WeatherController({required this.presenter});

  final WeatherPresenter presenter;
  Location? city;

  @override
  void onInitState() {
    super.onInitState();

    WidgetsBinding.instance.addPostFrameCallback((_) {
      city = userLocations.getLocations.first;

      requestWeather();
    });
  }

  @override
  void initListeners() {
    initWeatherListeners();
  }

  void initWeatherListeners() {
    presenter.getWeatherOnComplete = () => onComplete('Weather');
    presenter.getWeatherOnError = onError;
    presenter.getWeatherOnNext = getWeatherOnNext;
  }

  void getWeatherOnNext(Weather weather) {
    city!.weather = weather;
    refreshUI();
  }

  void requestWeather() {
    presenter.getWeather(city!.latLng);
  }

  Future<void> changeCity() async {
    city = null;
    refreshUI();

    city = await getContext().pushNamed(Routes.cities.name);
    requestWeather();
  }

  @override
  void onDisposed() {
    presenter.dispose();
    super.onDisposed();
  }
}
