import 'dart:async';

import 'package:flutter_clean_architecture/flutter_clean_architecture.dart';
import 'package:skywatch/domain/models/latlgn.dart';
import 'package:skywatch/domain/models/weather/weather.dart';
import 'package:skywatch/domain/repositories/weather_repository.dart';

class GetWeatherUseCase
    extends UseCase<WeatherRequestResponse, WeatherRequestData> {
  GetWeatherUseCase(this.weatherRespository);

  final IWeatherRespository weatherRespository;

  @override
  Future<Stream<WeatherRequestResponse>> buildUseCaseStream(
      WeatherRequestData? params) async {
    final controller = StreamController<WeatherRequestResponse>();

    try {
      final response =
          await weatherRespository.getLocationWeather(params!.latlng);

      final weather = Weather.fromMap(response.data);
      controller.add(WeatherRequestResponse(weather));
    } catch (e) {
      logger.severe('$runtimeType unsuccessful.');
      controller.addError(e);
    } finally {
      controller.close();
    }
    return controller.stream;
  }
}

class WeatherRequestData {
  final LatLng latlng;
  WeatherRequestData(this.latlng);
}

class WeatherRequestResponse {
  final Weather weather;
  WeatherRequestResponse(this.weather);
}
