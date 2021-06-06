// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'weather.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_Weather _$_$_WeatherFromJson(Map<String, dynamic> json) {
  return _$_Weather(
    id: json['_id'] as String,
    altitude: (json['altitude'] as num?)?.toDouble(),
    createdAt: json['createdAt'] == null
        ? null
        : DateTime.parse(json['createdAt'] as String),
    humidity: (json['humidity'] as num?)?.toDouble(),
    pressure: (json['pressure'] as num?)?.toDouble(),
    rain: (json['rain'] as num?)?.toDouble(),
    soilMoisture: (json['soilMoisture'] as num?)?.toDouble(),
    soilTemperature: (json['soilTemperature'] as num?)?.toDouble(),
    temperature: (json['temperature'] as num?)?.toDouble(),
    updatedAt: json['updatedAt'] == null
        ? null
        : DateTime.parse(json['updatedAt'] as String),
    windDirection: json['windDirection'] as String?,
    windSpeed: (json['windSpeed'] as num?)?.toDouble(),
  );
}

Map<String, dynamic> _$_$_WeatherToJson(_$_Weather instance) =>
    <String, dynamic>{
      '_id': instance.id,
      'altitude': instance.altitude,
      'createdAt': instance.createdAt?.toIso8601String(),
      'humidity': instance.humidity,
      'pressure': instance.pressure,
      'rain': instance.rain,
      'soilMoisture': instance.soilMoisture,
      'soilTemperature': instance.soilTemperature,
      'temperature': instance.temperature,
      'updatedAt': instance.updatedAt?.toIso8601String(),
      'windDirection': instance.windDirection,
      'windSpeed': instance.windSpeed,
    };
