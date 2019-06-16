import 'package:clima/services/location.dart';
import 'package:clima/services/networking.dart';

const apiKey = 'e47e178e655e2c2b755129c8df0749e6';
const openWeatherMapURL = 'https://api.openweathermap.org/data/2.5/weather';

int loop = 1;

class WeatherModel {
  //
  Future<dynamic> getCityWeather(String cityName) async {
    var url = '$openWeatherMapURL?q=$cityName&apiKey=$apiKey&units=imperial';

    NetworkHelper networkHelper = new NetworkHelper(url);
    var weatherData = await networkHelper.getData();

    return weatherData;
  }

  Future<dynamic> getLocationWeather() async {
    Location location = new Location();
    await location.getCurrentLocation();

    double lat;
    double longg;
    lat = location.lat;
    longg = location.longg;

    loop++;
    if (loop > 3) {
      lat = 51.5;
      longg = -0.2;
    }
    NetworkHelper networkHelper = new NetworkHelper(
        '$openWeatherMapURL?lat=$lat&lon=$longg&appid=$apiKey&units=imperial');

    var weatherData = await networkHelper.getData();
    return weatherData;
  }

  String getWeatherIcon(int condition) {
    if (condition < 300) {
      return '🌩';
    } else if (condition < 400) {
      return '🌧';
    } else if (condition < 600) {
      return '☔️';
    } else if (condition < 700) {
      return '☃️';
    } else if (condition < 800) {
      return '🌫';
    } else if (condition == 800) {
      return '☀️';
    } else if (condition <= 804) {
      return '☁️';
    } else {
      return '🤷‍';
    }
  }

  String getMessage(int temp) {
    if (temp > 25) {
      return 'It\'s 🍦 time';
    } else if (temp > 20) {
      return 'Time for shorts and 👕';
    } else if (temp < 10) {
      return 'You\'ll need 🧣 and 🧤';
    } else {
      return 'Bring a 🧥 just in case';
    }
  }
}
