import 'package:flutter_test/flutter_test.dart';
import 'package:skywatch/domain/models/weather/weather.dart';

void main() {
  group('Email Item Test', () {
    test('WeatherData.fromMap should parse JSON correctly', () {
      final Map<String, dynamic> mockData = {
        "coord": {"lon": 10.99, "lat": 44.34},
        "weather": [
          {
            "id": 501,
            "main": "Rain",
            "description": "moderate rain",
            "icon": "10d"
          }
        ],
        "base": "stations",
        "main": {
          "temp": 298.48,
          "feels_like": 298.74,
          "temp_min": 297.56,
          "temp_max": 300.05,
          "pressure": 1015,
          "humidity": 64,
          "sea_level": 1015,
          "grnd_level": 933
        },
        "visibility": 10000,
        "wind": {"speed": 0.62, "deg": 349, "gust": 1.18},
        "rain": {"1h": 3.16},
        "clouds": {"all": 100},
        "dt": 1661870592,
        "sys": {
          "type": 2,
          "id": 2075663,
          "country": "IT",
          "sunrise": 1661834187,
          "sunset": 1661882248
        },
        "timezone": 7200,
        "id": 3163858,
        "name": "Zocca",
        "cod": 200
      };

      final Weather weather = Weather.fromMap(mockData);

      expect(weather.latlng.lng, 10.99);
      expect(weather.latlng.lat, 44.34);

      expect(weather.weather.length, 1);
      expect(weather.weather[0].id, 501);
      expect(weather.weather[0].main, "Rain");
      expect(weather.weather[0].description, "moderate rain");
      expect(weather.weather[0].icon, "10d");

      expect(weather.base, "stations");

      expect(weather.main.temp, 298.48);
      expect(weather.main.feelsLike, 298.74);
      expect(weather.main.tempMin, 297.56);
      expect(weather.main.tempMax, 300.05);
      expect(weather.main.pressure, 1015);
      expect(weather.main.humidity, 64);
      expect(weather.main.seaLevel, 1015);
      expect(weather.main.grndLevel, 933);

      expect(weather.visibility, 10000);

      expect(weather.wind.speed, 0.62);
      expect(weather.wind.deg, 349);
      expect(weather.wind.gust, 1.18);

      expect(weather.rain?.hour, 3.16);

      expect(weather.clouds?.all, 100);

      expect(weather.dt, 1661870592);

      expect(weather.sys?.type, 2);
      expect(weather.sys?.id, 2075663);
      expect(weather.sys?.country, "IT");
      expect(weather.sys?.sunrise, 1661834187);
      expect(weather.sys?.sunset, 1661882248);

      expect(weather.timezone, 7200);
      expect(weather.id, 3163858);
      expect(weather.name, "Zocca");
      expect(weather.cod, 200);
    });
  });
}
