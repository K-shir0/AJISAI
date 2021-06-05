// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'weather.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_Weather _$_$_WeatherFromJson(Map<String, dynamic> json) {
  return _$_Weather(
    id: json['_id'] as String,
    altitude: json['altitude'] as int?,
    createdat: json['createdat'] == null
        ? null
        : DateTime.parse(json['createdat'] as String),
    humidity: json['humidity'] as int?,
    pressure: json['pressure'] as int?,
    rain: (json['rain'] as num?)?.toDouble(),
    soilmoisture: json['soilmoisture'] as int?,
    soiltemperature: json['soiltemperature'] as int?,
    temperature: json['temperature'] as int?,
    updatedat: json['updatedat'] == null
        ? null
        : DateTime.parse(json['updatedat'] as String),
    winddirection: json['winddirection'] as String?,
    windspeed: json['windspeed'] as int?,
  );
}

Map<String, dynamic> _$_$_WeatherToJson(_$_Weather instance) =>
    <String, dynamic>{
      '_id': instance.id,
      'altitude': instance.altitude,
      'createdat': instance.createdat?.toIso8601String(),
      'humidity': instance.humidity,
      'pressure': instance.pressure,
      'rain': instance.rain,
      'soilmoisture': instance.soilmoisture,
      'soiltemperature': instance.soiltemperature,
      'temperature': instance.temperature,
      'updatedat': instance.updatedat?.toIso8601String(),
      'winddirection': instance.winddirection,
      'windspeed': instance.windspeed,
    };
