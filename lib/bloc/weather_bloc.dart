import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:geolocator/geolocator.dart';
import 'package:meta/meta.dart';
import 'package:weather/weather.dart';

import '../data/my_data.dart';

part 'weather_event.dart';
part 'weather_state.dart';

class WeatherBloc extends Bloc<WeatherEvent, WeatherState> {


  WeatherBloc() : super(WeatherInitial()) {
    on<FetchWeather>((event, emit) async{
      // TODO: implement event handler
      emit(WeatherLoading());
      try{
        WeatherFactory wf = WeatherFactory(my_API,language: Language.ENGLISH);

        Weather weather = await wf.currentWeatherByLocation(
            event.position.latitude,
            event.position.longitude
        );
      print(weather);
      emit(WeatherSuccess(weather));
      }catch(e){
      emit(WeatherFailure());

      }


    });


  }
}