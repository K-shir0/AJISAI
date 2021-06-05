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

  factory Weather.fromJson(Map<String, dynamic> json) =>
      _$WeatherFromJson(json);
}
