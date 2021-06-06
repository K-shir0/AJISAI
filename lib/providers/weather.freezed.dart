// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides

part of 'weather.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

Weather _$WeatherFromJson(Map<String, dynamic> json) {
  return _Weather.fromJson(json);
}

/// @nodoc
class _$WeatherTearOff {
  const _$WeatherTearOff();

  _Weather call(
      {@JsonKey(name: "_id") String id = "",
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
      double? windSpeed}) {
    return _Weather(
      id: id,
      altitude: altitude,
      createdAt: createdAt,
      humidity: humidity,
      pressure: pressure,
      rain: rain,
      soilMoisture: soilMoisture,
      soilTemperature: soilTemperature,
      temperature: temperature,
      updatedAt: updatedAt,
      windDirection: windDirection,
      windSpeed: windSpeed,
    );
  }

  Weather fromJson(Map<String, Object> json) {
    return Weather.fromJson(json);
  }
}

/// @nodoc
const $Weather = _$WeatherTearOff();

/// @nodoc
mixin _$Weather {
  @JsonKey(name: "_id")
  String get id => throw _privateConstructorUsedError;
  double? get altitude => throw _privateConstructorUsedError;
  DateTime? get createdAt => throw _privateConstructorUsedError;
  double? get humidity => throw _privateConstructorUsedError;
  double? get pressure => throw _privateConstructorUsedError;
  double? get rain => throw _privateConstructorUsedError;
  double? get soilMoisture => throw _privateConstructorUsedError;
  double? get soilTemperature => throw _privateConstructorUsedError;
  double? get temperature => throw _privateConstructorUsedError;
  DateTime? get updatedAt => throw _privateConstructorUsedError;
  String? get windDirection => throw _privateConstructorUsedError;
  double? get windSpeed => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $WeatherCopyWith<Weather> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $WeatherCopyWith<$Res> {
  factory $WeatherCopyWith(Weather value, $Res Function(Weather) then) =
      _$WeatherCopyWithImpl<$Res>;
  $Res call(
      {@JsonKey(name: "_id") String id,
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
      double? windSpeed});
}

/// @nodoc
class _$WeatherCopyWithImpl<$Res> implements $WeatherCopyWith<$Res> {
  _$WeatherCopyWithImpl(this._value, this._then);

  final Weather _value;
  // ignore: unused_field
  final $Res Function(Weather) _then;

  @override
  $Res call({
    Object? id = freezed,
    Object? altitude = freezed,
    Object? createdAt = freezed,
    Object? humidity = freezed,
    Object? pressure = freezed,
    Object? rain = freezed,
    Object? soilMoisture = freezed,
    Object? soilTemperature = freezed,
    Object? temperature = freezed,
    Object? updatedAt = freezed,
    Object? windDirection = freezed,
    Object? windSpeed = freezed,
  }) {
    return _then(_value.copyWith(
      id: id == freezed
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      altitude: altitude == freezed
          ? _value.altitude
          : altitude // ignore: cast_nullable_to_non_nullable
              as double?,
      createdAt: createdAt == freezed
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      humidity: humidity == freezed
          ? _value.humidity
          : humidity // ignore: cast_nullable_to_non_nullable
              as double?,
      pressure: pressure == freezed
          ? _value.pressure
          : pressure // ignore: cast_nullable_to_non_nullable
              as double?,
      rain: rain == freezed
          ? _value.rain
          : rain // ignore: cast_nullable_to_non_nullable
              as double?,
      soilMoisture: soilMoisture == freezed
          ? _value.soilMoisture
          : soilMoisture // ignore: cast_nullable_to_non_nullable
              as double?,
      soilTemperature: soilTemperature == freezed
          ? _value.soilTemperature
          : soilTemperature // ignore: cast_nullable_to_non_nullable
              as double?,
      temperature: temperature == freezed
          ? _value.temperature
          : temperature // ignore: cast_nullable_to_non_nullable
              as double?,
      updatedAt: updatedAt == freezed
          ? _value.updatedAt
          : updatedAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      windDirection: windDirection == freezed
          ? _value.windDirection
          : windDirection // ignore: cast_nullable_to_non_nullable
              as String?,
      windSpeed: windSpeed == freezed
          ? _value.windSpeed
          : windSpeed // ignore: cast_nullable_to_non_nullable
              as double?,
    ));
  }
}

/// @nodoc
abstract class _$WeatherCopyWith<$Res> implements $WeatherCopyWith<$Res> {
  factory _$WeatherCopyWith(_Weather value, $Res Function(_Weather) then) =
      __$WeatherCopyWithImpl<$Res>;
  @override
  $Res call(
      {@JsonKey(name: "_id") String id,
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
      double? windSpeed});
}

/// @nodoc
class __$WeatherCopyWithImpl<$Res> extends _$WeatherCopyWithImpl<$Res>
    implements _$WeatherCopyWith<$Res> {
  __$WeatherCopyWithImpl(_Weather _value, $Res Function(_Weather) _then)
      : super(_value, (v) => _then(v as _Weather));

  @override
  _Weather get _value => super._value as _Weather;

  @override
  $Res call({
    Object? id = freezed,
    Object? altitude = freezed,
    Object? createdAt = freezed,
    Object? humidity = freezed,
    Object? pressure = freezed,
    Object? rain = freezed,
    Object? soilMoisture = freezed,
    Object? soilTemperature = freezed,
    Object? temperature = freezed,
    Object? updatedAt = freezed,
    Object? windDirection = freezed,
    Object? windSpeed = freezed,
  }) {
    return _then(_Weather(
      id: id == freezed
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      altitude: altitude == freezed
          ? _value.altitude
          : altitude // ignore: cast_nullable_to_non_nullable
              as double?,
      createdAt: createdAt == freezed
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      humidity: humidity == freezed
          ? _value.humidity
          : humidity // ignore: cast_nullable_to_non_nullable
              as double?,
      pressure: pressure == freezed
          ? _value.pressure
          : pressure // ignore: cast_nullable_to_non_nullable
              as double?,
      rain: rain == freezed
          ? _value.rain
          : rain // ignore: cast_nullable_to_non_nullable
              as double?,
      soilMoisture: soilMoisture == freezed
          ? _value.soilMoisture
          : soilMoisture // ignore: cast_nullable_to_non_nullable
              as double?,
      soilTemperature: soilTemperature == freezed
          ? _value.soilTemperature
          : soilTemperature // ignore: cast_nullable_to_non_nullable
              as double?,
      temperature: temperature == freezed
          ? _value.temperature
          : temperature // ignore: cast_nullable_to_non_nullable
              as double?,
      updatedAt: updatedAt == freezed
          ? _value.updatedAt
          : updatedAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      windDirection: windDirection == freezed
          ? _value.windDirection
          : windDirection // ignore: cast_nullable_to_non_nullable
              as String?,
      windSpeed: windSpeed == freezed
          ? _value.windSpeed
          : windSpeed // ignore: cast_nullable_to_non_nullable
              as double?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_Weather extends _Weather {
  const _$_Weather(
      {@JsonKey(name: "_id") this.id = "",
      this.altitude,
      this.createdAt,
      this.humidity,
      this.pressure,
      this.rain,
      this.soilMoisture,
      this.soilTemperature,
      this.temperature,
      this.updatedAt,
      this.windDirection,
      this.windSpeed})
      : super._();

  factory _$_Weather.fromJson(Map<String, dynamic> json) =>
      _$_$_WeatherFromJson(json);

  @override
  @JsonKey(name: "_id")
  final String id;
  @override
  final double? altitude;
  @override
  final DateTime? createdAt;
  @override
  final double? humidity;
  @override
  final double? pressure;
  @override
  final double? rain;
  @override
  final double? soilMoisture;
  @override
  final double? soilTemperature;
  @override
  final double? temperature;
  @override
  final DateTime? updatedAt;
  @override
  final String? windDirection;
  @override
  final double? windSpeed;

  @override
  String toString() {
    return 'Weather(id: $id, altitude: $altitude, createdAt: $createdAt, humidity: $humidity, pressure: $pressure, rain: $rain, soilMoisture: $soilMoisture, soilTemperature: $soilTemperature, temperature: $temperature, updatedAt: $updatedAt, windDirection: $windDirection, windSpeed: $windSpeed)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _Weather &&
            (identical(other.id, id) ||
                const DeepCollectionEquality().equals(other.id, id)) &&
            (identical(other.altitude, altitude) ||
                const DeepCollectionEquality()
                    .equals(other.altitude, altitude)) &&
            (identical(other.createdAt, createdAt) ||
                const DeepCollectionEquality()
                    .equals(other.createdAt, createdAt)) &&
            (identical(other.humidity, humidity) ||
                const DeepCollectionEquality()
                    .equals(other.humidity, humidity)) &&
            (identical(other.pressure, pressure) ||
                const DeepCollectionEquality()
                    .equals(other.pressure, pressure)) &&
            (identical(other.rain, rain) ||
                const DeepCollectionEquality().equals(other.rain, rain)) &&
            (identical(other.soilMoisture, soilMoisture) ||
                const DeepCollectionEquality()
                    .equals(other.soilMoisture, soilMoisture)) &&
            (identical(other.soilTemperature, soilTemperature) ||
                const DeepCollectionEquality()
                    .equals(other.soilTemperature, soilTemperature)) &&
            (identical(other.temperature, temperature) ||
                const DeepCollectionEquality()
                    .equals(other.temperature, temperature)) &&
            (identical(other.updatedAt, updatedAt) ||
                const DeepCollectionEquality()
                    .equals(other.updatedAt, updatedAt)) &&
            (identical(other.windDirection, windDirection) ||
                const DeepCollectionEquality()
                    .equals(other.windDirection, windDirection)) &&
            (identical(other.windSpeed, windSpeed) ||
                const DeepCollectionEquality()
                    .equals(other.windSpeed, windSpeed)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(id) ^
      const DeepCollectionEquality().hash(altitude) ^
      const DeepCollectionEquality().hash(createdAt) ^
      const DeepCollectionEquality().hash(humidity) ^
      const DeepCollectionEquality().hash(pressure) ^
      const DeepCollectionEquality().hash(rain) ^
      const DeepCollectionEquality().hash(soilMoisture) ^
      const DeepCollectionEquality().hash(soilTemperature) ^
      const DeepCollectionEquality().hash(temperature) ^
      const DeepCollectionEquality().hash(updatedAt) ^
      const DeepCollectionEquality().hash(windDirection) ^
      const DeepCollectionEquality().hash(windSpeed);

  @JsonKey(ignore: true)
  @override
  _$WeatherCopyWith<_Weather> get copyWith =>
      __$WeatherCopyWithImpl<_Weather>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$_$_WeatherToJson(this);
  }
}

abstract class _Weather extends Weather {
  const factory _Weather(
      {@JsonKey(name: "_id") String id,
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
      double? windSpeed}) = _$_Weather;
  const _Weather._() : super._();

  factory _Weather.fromJson(Map<String, dynamic> json) = _$_Weather.fromJson;

  @override
  @JsonKey(name: "_id")
  String get id => throw _privateConstructorUsedError;
  @override
  double? get altitude => throw _privateConstructorUsedError;
  @override
  DateTime? get createdAt => throw _privateConstructorUsedError;
  @override
  double? get humidity => throw _privateConstructorUsedError;
  @override
  double? get pressure => throw _privateConstructorUsedError;
  @override
  double? get rain => throw _privateConstructorUsedError;
  @override
  double? get soilMoisture => throw _privateConstructorUsedError;
  @override
  double? get soilTemperature => throw _privateConstructorUsedError;
  @override
  double? get temperature => throw _privateConstructorUsedError;
  @override
  DateTime? get updatedAt => throw _privateConstructorUsedError;
  @override
  String? get windDirection => throw _privateConstructorUsedError;
  @override
  double? get windSpeed => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$WeatherCopyWith<_Weather> get copyWith =>
      throw _privateConstructorUsedError;
}
