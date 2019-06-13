import 'dart:io';
import 'package:flutter/material.dart';
import 'location.dart';
//import 'package:http/http.dart';

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
    Location location = new Location();
    await location.getCurrentLocation();
  }

void getData() async {
     //--https://stackoverflow.com/questions/54285172/how-to-solve-flutter-certificate-verify-failed-error-while-performing-a-post-req

   HttpClient client = new HttpClient();
   client.badCertificateCallback = ((X509Certificate cert, String host, int port) => true);
     //request.headers.set('content-type', 'application/json');

 String url ='https://jsonplaceholder.typicode.com/posts';
  HttpClientRequest request = await client.postUrl(Uri.parse(url));
  request.headers.set('content-type', 'application/json');
  HttpClientResponse response = await request.close();
  //String reply = await response.transform(utf8.decoder).join();
  print(response);


// aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa
   //String url ='https://samples.openweathermap.org/data/2.5/weather?lat=35&lon=139&appid=b6907d289e10d714a6e88b30761fae22';
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

    print('Calling API');

    // Response response = await get(
    //     'https://samples.openweathermap.org/data/2.5/weather?lat=35&lon=139&appid=b6907d289e10d714a6e88b30761fae22');

    //Response response = await get('https://jsonplaceholder.typicode.com/posts' );
    // Response response = await get(
    //       Uri.encodeFull('https://samples.openweathermap.org/data/2.5/weather?lat=35&lon=139&appid=b6907d289e10d714a6e88b30761fae22'),
    //       headers: {
    //         "key": "b6907d289e10d714a6e88b30761fae22",
    //         "Accept": "application/json"
    //       }
    //  );

    print('After Calling API');        

    //print(response.body);
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
