// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'weather_state.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_WeatherState _$_$_WeatherStateFromJson(Map<String, dynamic> json) {
  return _$_WeatherState(
    weathers: (json['weathers'] as List<dynamic>?)
            ?.map((e) => Weather.fromJson(e as Map<String, dynamic>))
            .toList() ??
        [],
  );
}

Map<String, dynamic> _$_$_WeatherStateToJson(_$_WeatherState instance) =>
    <String, dynamic>{
      'weathers': instance.weathers.map((e) => e.toJson()).toList(),
    };
