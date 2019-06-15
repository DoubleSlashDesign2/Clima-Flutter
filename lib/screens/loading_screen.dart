import 'package:clima/screens/location_screen.dart';
import 'package:flutter/material.dart';
import 'location.dart';
import 'package:clima/services/networking.dart';
import 'location_screen.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

// import 'dart:io';
// import 'package:http/http.dart' as http;
// import 'dart:convert';
// my app key - e47e178e655e2c2b755129c8df0749e6
// -api.openweathermap.org
//-- https://www.latlong.net/
//-- 35.007599
//-- -80.944321

var apiKey = 'e47e178e655e2c2b755129c8df0749e6';

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
    Location location = new Location();
    await location.getCurrentLocation();
    lat = location.lat;
    longg = location.longg;

    NetworkHelper networkHelper = new NetworkHelper(
        'https://api.openweathermap.org/data/2.5/weather?lat=$lat&lon=$longg&appid=$apiKey&units=imperial');

    var weatherData = await networkHelper.getData();

    Navigator.push(context, MaterialPageRoute(builder: (context) {
      return LocationScreen(locationWeather: weatherData);
    }));

    // var temp = jsonDecode(response.body)['main']['temp'];
    // var condition = jsonDecode(response.body)['weather'][0]['id'];
    // var city = jsonDecode(response.body)['name'];

    // print(lat);
    // print(longg);
    // // print(weatherDescription);
    // print(temp);
    // print(condition);
    // print(city);
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

//request.headers.set('content-type', 'application/json');

//  String url ='https://jsonplaceholder.typicode.com/posts';
//   HttpClientRequest request = await client.postUrl(Uri.parse(url));
//   request.headers.set('content-type', 'application/json');
//   HttpClientResponse response = await request.close();
//   //String reply = await response.transform(utf8.decoder).join();
//   print(response);

// aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa
// String url =
//     'https://samples.openweathermap.org/data/2.5/weather?lat=35&lon=139&appid=b6907d289e10d714a6e88b30761fae22';
//Map map = { "email" : "email" , "password" : "password};
//  HttpClientRequest request = await client.get(host, port, url) .get(url); //(Uri.parse(url));
//     //request.headers.set('content-type', 'application/json');
//     //request.add(utf8.encode(json.encode(map)));
//     HttpClientResponse response = await request.close();
//     String reply = await response.transform(utf8.decoder).join();
//     print(reply);
//Future<http.Response> fetchPost() {
//return http.get('https://api.openweathermap.org/data/2.5/weather?lat=123&lon=139');
//return await http.get(
//'https://samples.openweathermap.org/data/2.5/weather?lat=35&lon=139&appid=b6907d289e10d714a6e88b30761fae22');
//https://samples.openweathermap.org/data/2.5/weather?q=charlotte,us&appid=b6907d289e10d714a6e88b30761fae22

//Response response = await get('https://jsonplaceholder.typicode.com/posts' );
// Response response = await get(
//       Uri.encodeFull('https://samples.openweathermap.org/data/2.5/weather?lat=35&lon=139&appid=b6907d289e10d714a6e88b30761fae22'),
//       headers: {
//         "key": "b6907d289e10d714a6e88b30761fae22",
//         "Accept": "application/json"
//       }
//  );

// void getData() async {
//   //--https://stackoverflow.com/questions/54285172/how-to-solve-flutter-certificate-verify-failed-error-while-performing-a-post-req

//   HttpClient client = new HttpClient();
//   client.badCertificateCallback =
//       ((X509Certificate cert, String host, int port) => true);

//   print('Calling API');

//   http.Response response = await http.get(
//       'https://api.openweathermap.org/data/2.5/weather?lat=$lat&lon=$longg&appid=$apiKey');

//   if (response.statusCode == 200) {
//     // print(response.body);
//     // var lat = jsonDecode(response.body)['coord']['lat'];
//     // var longg = jsonDecode(response.body)['coord']['lon'];

//     var weatherDescription =
//         jsonDecode(response.body)['weather'][0]['description'];

//     // var decodedData = jsonDecode(response.body);

//     var temp = jsonDecode(response.body)['main']['temp'];
//     var condition = jsonDecode(response.body)['weather'][0]['id'];
//     var city = jsonDecode(response.body)['name'];

//     print(lat);
//     print(longg);
//     print(weatherDescription);
//     print(temp);
//     print(condition);
//     print(city);
//   } else
//     print(response.statusCode);
//   //}
// }
