class WeatherInfo {
  WeatherInfo._();

  late double temperature;
  late int precipitation;

  factory WeatherInfo.empty() {
    return WeatherInfo._()
      ..precipitation = 0
      ..temperature = 0.0;
  }

  factory WeatherInfo.fromPair(double temperature, int precipitation) {
    return WeatherInfo._()
      ..precipitation = precipitation
      ..temperature = temperature;
  }
}
