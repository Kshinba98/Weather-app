import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:weather_app/bloc/weather_bloc.dart';

class MyHomePage extends StatelessWidget {
  const MyHomePage({super.key});

  Widget getIconWeather(int code){
    switch(code){
      case >200 && <=300:
        return Image.asset('assets/1.png');
      case >300 && <=400:
        return Image.asset('assets/2.png');
      case >500 && <=600:
        return Image.asset('assets/3.png');
      case >600 && <=700:
        return Image.asset('assets/4.png');
      case >700 && <=800:
        return Image.asset('assets/5.png');
      case ==800:
        return Image.asset('assets/6.png');
      case > 800 && <=804:
        return Image.asset('assets/7.png');
      default:
        return Image.asset('assets/1.png');
    }

  }

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      backgroundColor: Colors.black,
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        systemOverlayStyle: const SystemUiOverlayStyle(
          statusBarBrightness: Brightness.dark,

        ),
      ),
      body: Padding(
          padding: EdgeInsets.fromLTRB(40, 1.2*kToolbarHeight, 40, 20),
              child: SizedBox(
          height: MediaQuery.sizeOf(context).height,
      child: Stack(
        children: [
          Align(
            alignment:const AlignmentDirectional(3,-0.3),
            child: Container(
              height: 300,
              width: 300,
              decoration: const BoxDecoration(
                shape: BoxShape.circle,
                color: Colors.deepPurple
              ),
            ),
          ),
          Align(
            alignment:const AlignmentDirectional(-3,-0.3),
            child: Container(
              height: 300,
              width: 300,
              decoration: const BoxDecoration(
                shape: BoxShape.circle,
                color: Colors.deepPurple
              ),
            ),
          ),
          Align(
            alignment:const AlignmentDirectional(0,-1.2),
            child: Container(
              height: 300,
              width: 600,
              decoration: const BoxDecoration(
                shape: BoxShape.rectangle,
                color: Colors.orange
              ),
            ),
          ),
          BackdropFilter(
              filter: ImageFilter.blur(sigmaX: 100,sigmaY: 100),
            child: Container(
            ),
          ),
          BlocBuilder<WeatherBloc, WeatherState>(
  builder: (context, state) {
    if(state is WeatherSuccess){
    return SizedBox(
            height: MediaQuery.of(context).size.height,
            width: MediaQuery.of(context).size.width,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(state.weather.areaName.toString(),
                style: const TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.w300,
                  fontSize: 20
                ),),
                const SizedBox(height: 8,),
                const Text('Good Morning',
                style: TextStyle(
                  fontSize: 25,
                  color: Colors.white,
                  fontWeight: FontWeight.bold
                ),
                ),
                getIconWeather(state.weather.weatherConditionCode!),
                Center(
                  child: Text('${state.weather.temperature}',
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 55,
                    fontWeight: FontWeight.w600
                  ),),
                ),
                Center(
                  child: Text('${state.weather.weatherMain}',
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 30,
                    fontWeight: FontWeight.w400
                  ),),
                ),
                Center(
                  child: Text(DateFormat('EEEE ').add_jms().format(state.weather.date!),
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 16,
                    fontWeight: FontWeight.w300
                  ),),
                ),
                const SizedBox(height: 30,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        Image.asset('assets/11.png',scale: 8,),
                        Column(children: [
                          const Text('Sunrise',
                          style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.w300,
                          ),),
                          Text(DateFormat().add_jms().format(state.weather.sunrise!),
                          style: const TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.w600,
                          ),),

                        ],)
                      ],
                    ),
                    Row(
                      children: [
                        Image.asset('assets/12.png',scale: 8,),
                        Column(children: [
                          const Text('Sunset',
                          style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.w300,
                          ),),
                          Text(DateFormat().add_jms().format(state.weather.sunset!),
                          style: const TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.w600,
                          ),),

                        ],)
                      ],
                    ),
                  ],
                ),
                const Padding(
                    padding:EdgeInsets.all(5),
                    child: Divider(color: Colors.grey,),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        Image.asset('assets/13.png',scale: 8,),
                        Column(children: [
                          const Text('Max Temp',
                          style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.w300,
                          ),),
                          Text('${state.weather.tempMax}',
                          style: const TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.w600,
                          ),),

                        ],)
                      ],
                    ),
                    Row(
                      children: [
                        Image.asset('assets/14.png',scale: 8,),
                        Column(children: [
                          const Text('Min Temp',
                          style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.w300,
                          ),),
                          Text('${state.weather.tempMin}',
                          style: const TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.w600,
                          ),),

                        ],)
                      ],
                    ),
                  ],
                ),

              ],
            ),
          );}else return Container();
  },
)
        ],
      ),
      ),
      ),
    );
  }
}
