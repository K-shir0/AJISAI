import 'package:ajisai/providers/weather.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

part 'weather_state.freezed.dart';

part 'weather_state.g.dart';

@freezed
class WeatherState with _$WeatherState {
  const factory WeatherState({
    @Default([])
    List<Weather> weathers,
  }) = _WeatherState;

  factory WeatherState.fromJson(Map<String, dynamic> json) =>
      _$WeatherStateFromJson(json);
}

class WeatherStateNotifier extends StateNotifier<WeatherState> {
  WeatherStateNotifier() : super(const WeatherState());
}
