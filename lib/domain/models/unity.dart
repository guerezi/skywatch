import 'package:skywatch/domain/enums/precipitation_type_enum.dart';
import 'package:skywatch/domain/enums/temperature_type_enum.dart';

class Unity {
  Unity._();

  late TemperatureTypeEnum temperatureUnity;
  late PrecipitationTypeEnum precipitationUnity;

  factory Unity.empty() {
    return Unity._()
      ..temperatureUnity = TemperatureTypeEnum.c
      ..precipitationUnity = PrecipitationTypeEnum.percent;
  }

  factory Unity.fromMap(Map<String, dynamic> data) {
    return Unity._()
      ..temperatureUnity = TemperatureTypeEnum.values
          .firstWhere((t) => t.value == data['temperature_2m'])
      ..precipitationUnity = PrecipitationTypeEnum.values
          .firstWhere((p) => p.value == data['precipitation_probability']);
  }
}
