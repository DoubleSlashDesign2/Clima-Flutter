import 'package:flutter/services.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class NetworkHelper {
  final String url;
  NetworkHelper(this.url);

  Future getData() async {
    //--https://stackoverflow.com/questions/54285172/how-to-solve-flutter-certificate-verify-failed-error-while-performing-a-post-req

    var decodedData;
    http.Response response = await http.get(url);

    if (response.statusCode == 200) {
      decodedData = jsonDecode(response.body);
    } else {
      decodedData = '';
      print(response.statusCode);
    }

    return decodedData;

    // print(response.body);
    // var lat = jsonDecode(response.body)['coord']['lat'];
    // var longg = jsonDecode(response.body)['coord']['lon'];
    // var weatherDescription =
    //     jsonDecode(response.body)['weather'][0]['description'];

    // var temp = jsonDecode(response.body)['main']['temp'];
    // var condition = jsonDecode(response.body)['weather'][0]['id'];
    // var city = jsonDecode(response.body)['name'];

    // print(lat);
    // print(longg);
    // print(weatherDescription);
    // print(temp);
    // print(condition);
    // print(city);
  }
}
