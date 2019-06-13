import 'dart:io';

import 'package:flutter/material.dart';
import 'location.dart';
import 'package:http/http.dart';

class LoadingScreen extends StatefulWidget {
  @override
  _LoadingScreenState createState() => _LoadingScreenState();
}

class _LoadingScreenState extends State<LoadingScreen> {
  @override
  void initState() {
    super.initState();
    getLocation();
  }

// void getCurrentPosition() async {
// }
  void getLocation() async {
    Location location = Location();
    await location.getCurrentLocation();
    print('location');
    print(location.lat);
    print(location.longg);
    print('location');
  }

  void getData() async {
HttpClient client = new HttpClient();
client.badCertificateCallback = ((X509Certificate cert, String host, int port) => true);

//--https://stackoverflow.com/questions/54285172/how-to-solve-flutter-certificate-verify-failed-error-while-performing-a-post-req

//Future<http.Response> fetchPost() {
    //return http.get('https://api.openweathermap.org/data/2.5/weather?lat=123&lon=139');
    //return await http.get(
    //'https://samples.openweathermap.org/data/2.5/weather?lat=35&lon=139&appid=b6907d289e10d714a6e88b30761fae22');
print('Calling API');
    Response response = await get(
        'https://samples.openweathermap.org/data/2.5/weather?lat=35&lon=139&appid=b6907d289e10d714a6e88b30761fae22');

print('After Calling API');        
    print(response.body);
//}
  }

  @override
  Widget build(BuildContext context) {
    getData();
    return Scaffold(
        // body: Center(
        //   child: RaisedButton(
        //     onPressed: () {
        //       //Get the current location
        //       getLocation();
        //     },
        //     child: Text('Get Location'),
        //   ),
        // ),
        );
  }
}
