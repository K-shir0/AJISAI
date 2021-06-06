import 'package:freezed_annotation/freezed_annotation.dart';

part 'weather.freezed.dart';

part 'weather.g.dart';

@freezed
class Weather with _$Weather {
  const factory Weather({
    @JsonKey(name: "_id") @Default("") String id,
    int? altitude,
    DateTime? createdat,
    int? humidity,
    int? pressure,
    double? rain,
    int? soilmoisture,
    int? soiltemperature,
    int? temperature,
    DateTime? updatedat,
    String? winddirection,
    int? windspeed,

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
    if (windspeed == null) return null;

    return (((windspeed! / 2.237) * 10).floor()) / 10;
  }

  factory Weather.fromJson(Map<String, dynamic> json) =>
      _$WeatherFromJson(json);
}
