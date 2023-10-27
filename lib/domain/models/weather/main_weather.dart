class MainWeather {
  late double temp;
  late double feelsLike;
  late double tempMin;
  late double tempMax;
  late int pressure;
  late int humidity;
  late int seaLevel;
  late int grndLevel;

  MainWeather._();

  factory MainWeather.fromMap(Map<String, dynamic> data) {
    return MainWeather._()
      ..temp = data['temp'].toDouble()
      ..feelsLike = data['feels_like'].toDouble()
      ..tempMin = data['temp_min'].toDouble()
      ..tempMax = data['temp_max'].toDouble()
      ..pressure = data['pressure']
      ..humidity = data['humidity']
      ..seaLevel = data['sea_level']
      ..grndLevel = data['grnd_level'];
  }
}
