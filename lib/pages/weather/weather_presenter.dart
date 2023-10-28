import 'package:flutter_clean_architecture/flutter_clean_architecture.dart';
import 'package:skywatch/domain/models/latlgn.dart';
import 'package:skywatch/domain/models/weather/weather.dart';
import 'package:skywatch/domain/repositories/weather_repository.dart';
import 'package:skywatch/domain/usecases/get_weather_usecase.dart';
import 'package:skywatch/pages/weather/observers/weather_observer.dart';

class WeatherPresenter extends Presenter {
  WeatherPresenter({
    required IWeatherRespository weatherRespository,
  }) : _weatherUsecase = GetWeatherUseCase(weatherRespository);

  final GetWeatherUseCase _weatherUsecase;

  Function()? getWeatherOnComplete;
  Function(dynamic)? getWeatherOnError;
  Function(Weather)? getWeatherOnNext;

  void getWeather(LatLng data) {
    _weatherUsecase.execute(
      WeatherUseCaseObserver(this),
      WeatherRequestData(data),
    );
  }

  @override
  void dispose() {
    _weatherUsecase.dispose();
  }
}
