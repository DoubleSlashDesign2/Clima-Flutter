import 'package:clima/screens/location_screen.dart';
import 'package:flutter/material.dart';
// import 'location.dart';
// import 'package:clima/services/networking.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:clima/services/weather.dart';

// import 'dart:io';
// import 'package:http/http.dart' as http;
// import 'dart:convert';
// my app key - e47e178e655e2c2b755129c8df0749e6
// -api.openweathermap.org
//-- https://www.latlong.net/
//-- 35.007599
//-- -80.944321

// var apiKey = 'e47e178e655e2c2b755129c8df0749e6';

class LoadingScreen extends StatefulWidget {
  @override
  _LoadingScreenState createState() => _LoadingScreenState();
}

class _LoadingScreenState extends State<LoadingScreen> {
  double lat;
  double longg;

  @override
  void initState() {
    super.initState();
    getLocationData();
  }

  void getLocationData() async {
    // Location location = new Location();
    // await location.getCurrentLocation();
    // lat = location.lat;
    // longg = location.longg;

    // NetworkHelper networkHelper = new NetworkHelper(
    //     'https://api.openweathermap.org/data/2.5/weather?lat=$lat&lon=$longg&appid=$apiKey&units=imperial');

    // var weatherData = await networkHelper.getData();

    //---
    // WeatherModel weatherModel = new WeatherModel();
    // var weatherData = weatherModel.getLocationWeather();
    // -- shorthand version of the 2 line above

    var weatherData = await WeatherModel().getLocationWeather();

    // print('navigating');
    Navigator.push(context, MaterialPageRoute(builder: (context) {
      return LocationScreen(locationWeather: weatherData);
    }));
  }

  @override
  Widget build(BuildContext context) {
    // getLocationData();
    return Scaffold(
      body: Center(
        child: SpinKitWave(
          color: Colors.white,
          size: 50.0,
        ),
        //   child: RaisedButton(
        //     onPressed: () {
        //       //Get the current location
        //       getLocation();
        //     },
        //     child: Text('Get Location'),
        //   ),
        // ),
      ),
    );
  }
}
