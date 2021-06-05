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
      int? windspeed}) {
    return _Weather(
      id: id,
      altitude: altitude,
      createdat: createdat,
      humidity: humidity,
      pressure: pressure,
      rain: rain,
      soilmoisture: soilmoisture,
      soiltemperature: soiltemperature,
      temperature: temperature,
      updatedat: updatedat,
      winddirection: winddirection,
      windspeed: windspeed,
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
  int? get altitude => throw _privateConstructorUsedError;
  DateTime? get createdat => throw _privateConstructorUsedError;
  int? get humidity => throw _privateConstructorUsedError;
  int? get pressure => throw _privateConstructorUsedError;
  double? get rain => throw _privateConstructorUsedError;
  int? get soilmoisture => throw _privateConstructorUsedError;
  int? get soiltemperature => throw _privateConstructorUsedError;
  int? get temperature => throw _privateConstructorUsedError;
  DateTime? get updatedat => throw _privateConstructorUsedError;
  String? get winddirection => throw _privateConstructorUsedError;
  int? get windspeed => throw _privateConstructorUsedError;

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
      int? windspeed});
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
    Object? createdat = freezed,
    Object? humidity = freezed,
    Object? pressure = freezed,
    Object? rain = freezed,
    Object? soilmoisture = freezed,
    Object? soiltemperature = freezed,
    Object? temperature = freezed,
    Object? updatedat = freezed,
    Object? winddirection = freezed,
    Object? windspeed = freezed,
  }) {
    return _then(_value.copyWith(
      id: id == freezed
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      altitude: altitude == freezed
          ? _value.altitude
          : altitude // ignore: cast_nullable_to_non_nullable
              as int?,
      createdat: createdat == freezed
          ? _value.createdat
          : createdat // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      humidity: humidity == freezed
          ? _value.humidity
          : humidity // ignore: cast_nullable_to_non_nullable
              as int?,
      pressure: pressure == freezed
          ? _value.pressure
          : pressure // ignore: cast_nullable_to_non_nullable
              as int?,
      rain: rain == freezed
          ? _value.rain
          : rain // ignore: cast_nullable_to_non_nullable
              as double?,
      soilmoisture: soilmoisture == freezed
          ? _value.soilmoisture
          : soilmoisture // ignore: cast_nullable_to_non_nullable
              as int?,
      soiltemperature: soiltemperature == freezed
          ? _value.soiltemperature
          : soiltemperature // ignore: cast_nullable_to_non_nullable
              as int?,
      temperature: temperature == freezed
          ? _value.temperature
          : temperature // ignore: cast_nullable_to_non_nullable
              as int?,
      updatedat: updatedat == freezed
          ? _value.updatedat
          : updatedat // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      winddirection: winddirection == freezed
          ? _value.winddirection
          : winddirection // ignore: cast_nullable_to_non_nullable
              as String?,
      windspeed: windspeed == freezed
          ? _value.windspeed
          : windspeed // ignore: cast_nullable_to_non_nullable
              as int?,
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
      int? windspeed});
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
    Object? createdat = freezed,
    Object? humidity = freezed,
    Object? pressure = freezed,
    Object? rain = freezed,
    Object? soilmoisture = freezed,
    Object? soiltemperature = freezed,
    Object? temperature = freezed,
    Object? updatedat = freezed,
    Object? winddirection = freezed,
    Object? windspeed = freezed,
  }) {
    return _then(_Weather(
      id: id == freezed
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      altitude: altitude == freezed
          ? _value.altitude
          : altitude // ignore: cast_nullable_to_non_nullable
              as int?,
      createdat: createdat == freezed
          ? _value.createdat
          : createdat // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      humidity: humidity == freezed
          ? _value.humidity
          : humidity // ignore: cast_nullable_to_non_nullable
              as int?,
      pressure: pressure == freezed
          ? _value.pressure
          : pressure // ignore: cast_nullable_to_non_nullable
              as int?,
      rain: rain == freezed
          ? _value.rain
          : rain // ignore: cast_nullable_to_non_nullable
              as double?,
      soilmoisture: soilmoisture == freezed
          ? _value.soilmoisture
          : soilmoisture // ignore: cast_nullable_to_non_nullable
              as int?,
      soiltemperature: soiltemperature == freezed
          ? _value.soiltemperature
          : soiltemperature // ignore: cast_nullable_to_non_nullable
              as int?,
      temperature: temperature == freezed
          ? _value.temperature
          : temperature // ignore: cast_nullable_to_non_nullable
              as int?,
      updatedat: updatedat == freezed
          ? _value.updatedat
          : updatedat // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      winddirection: winddirection == freezed
          ? _value.winddirection
          : winddirection // ignore: cast_nullable_to_non_nullable
              as String?,
      windspeed: windspeed == freezed
          ? _value.windspeed
          : windspeed // ignore: cast_nullable_to_non_nullable
              as int?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_Weather implements _Weather {
  const _$_Weather(
      {@JsonKey(name: "_id") this.id = "",
      this.altitude,
      this.createdat,
      this.humidity,
      this.pressure,
      this.rain,
      this.soilmoisture,
      this.soiltemperature,
      this.temperature,
      this.updatedat,
      this.winddirection,
      this.windspeed});

  factory _$_Weather.fromJson(Map<String, dynamic> json) =>
      _$_$_WeatherFromJson(json);

  @override
  @JsonKey(name: "_id")
  final String id;
  @override
  final int? altitude;
  @override
  final DateTime? createdat;
  @override
  final int? humidity;
  @override
  final int? pressure;
  @override
  final double? rain;
  @override
  final int? soilmoisture;
  @override
  final int? soiltemperature;
  @override
  final int? temperature;
  @override
  final DateTime? updatedat;
  @override
  final String? winddirection;
  @override
  final int? windspeed;

  @override
  String toString() {
    return 'Weather(id: $id, altitude: $altitude, createdat: $createdat, humidity: $humidity, pressure: $pressure, rain: $rain, soilmoisture: $soilmoisture, soiltemperature: $soiltemperature, temperature: $temperature, updatedat: $updatedat, winddirection: $winddirection, windspeed: $windspeed)';
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
            (identical(other.createdat, createdat) ||
                const DeepCollectionEquality()
                    .equals(other.createdat, createdat)) &&
            (identical(other.humidity, humidity) ||
                const DeepCollectionEquality()
                    .equals(other.humidity, humidity)) &&
            (identical(other.pressure, pressure) ||
                const DeepCollectionEquality()
                    .equals(other.pressure, pressure)) &&
            (identical(other.rain, rain) ||
                const DeepCollectionEquality().equals(other.rain, rain)) &&
            (identical(other.soilmoisture, soilmoisture) ||
                const DeepCollectionEquality()
                    .equals(other.soilmoisture, soilmoisture)) &&
            (identical(other.soiltemperature, soiltemperature) ||
                const DeepCollectionEquality()
                    .equals(other.soiltemperature, soiltemperature)) &&
            (identical(other.temperature, temperature) ||
                const DeepCollectionEquality()
                    .equals(other.temperature, temperature)) &&
            (identical(other.updatedat, updatedat) ||
                const DeepCollectionEquality()
                    .equals(other.updatedat, updatedat)) &&
            (identical(other.winddirection, winddirection) ||
                const DeepCollectionEquality()
                    .equals(other.winddirection, winddirection)) &&
            (identical(other.windspeed, windspeed) ||
                const DeepCollectionEquality()
                    .equals(other.windspeed, windspeed)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(id) ^
      const DeepCollectionEquality().hash(altitude) ^
      const DeepCollectionEquality().hash(createdat) ^
      const DeepCollectionEquality().hash(humidity) ^
      const DeepCollectionEquality().hash(pressure) ^
      const DeepCollectionEquality().hash(rain) ^
      const DeepCollectionEquality().hash(soilmoisture) ^
      const DeepCollectionEquality().hash(soiltemperature) ^
      const DeepCollectionEquality().hash(temperature) ^
      const DeepCollectionEquality().hash(updatedat) ^
      const DeepCollectionEquality().hash(winddirection) ^
      const DeepCollectionEquality().hash(windspeed);

  @JsonKey(ignore: true)
  @override
  _$WeatherCopyWith<_Weather> get copyWith =>
      __$WeatherCopyWithImpl<_Weather>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$_$_WeatherToJson(this);
  }
}

abstract class _Weather implements Weather {
  const factory _Weather(
      {@JsonKey(name: "_id") String id,
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
      int? windspeed}) = _$_Weather;

  factory _Weather.fromJson(Map<String, dynamic> json) = _$_Weather.fromJson;

  @override
  @JsonKey(name: "_id")
  String get id => throw _privateConstructorUsedError;
  @override
  int? get altitude => throw _privateConstructorUsedError;
  @override
  DateTime? get createdat => throw _privateConstructorUsedError;
  @override
  int? get humidity => throw _privateConstructorUsedError;
  @override
  int? get pressure => throw _privateConstructorUsedError;
  @override
  double? get rain => throw _privateConstructorUsedError;
  @override
  int? get soilmoisture => throw _privateConstructorUsedError;
  @override
  int? get soiltemperature => throw _privateConstructorUsedError;
  @override
  int? get temperature => throw _privateConstructorUsedError;
  @override
  DateTime? get updatedat => throw _privateConstructorUsedError;
  @override
  String? get winddirection => throw _privateConstructorUsedError;
  @override
  int? get windspeed => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$WeatherCopyWith<_Weather> get copyWith =>
      throw _privateConstructorUsedError;
}
