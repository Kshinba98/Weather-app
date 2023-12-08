part of 'weather_bloc.dart';
@immutable
abstract class WeatherState {}

class WeatherInitial extends WeatherState {}

class WeatherLoading extends WeatherState {}
class WeatherFailure extends WeatherState {}
class WeatherSuccess extends WeatherState {

  final Weather weather;
   WeatherSuccess(this.weather);

   List<Object> get props => [weather];
}


