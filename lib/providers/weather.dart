import 'package:freezed_annotation/freezed_annotation.dart';

part 'weather.freezed.dart';

part 'weather.g.dart';

@freezed
class Weather with _$Weather {
  const factory Weather({
    @JsonKey(name: "_id") @Default("") String id,
    double? altitude,
    DateTime? createdAt,
    double? humidity,
    double? pressure,
    double? rain,
    double? soilMoisture,
    double? soilTemperature,
    double? temperature,
    DateTime? updatedAt,
    String? windDirection,
    double? windSpeed,

  }) = _Weather;

  const Weather._();

  double? getTemperature() {
    if (temperature == null) return null;

    return temperature! / 100;
  }

  int? getHumidity() {
    if (humidity == null) return null;

    // ~/は整数の結果
    return ((humidity! / 1024) * 100).round() ~/ 100;
  }

  int? getHectopascal() {
    if (pressure == null) return null;

    return (pressure! / 25600).round();
  }

  double? getWindSpeed() {
    if (windSpeed == null) return null;

    return (((windSpeed! / 2.237) * 10).floor()) / 10;
  }

  factory Weather.fromJson(Map<String, dynamic> json) =>
      _$WeatherFromJson(json);
}
