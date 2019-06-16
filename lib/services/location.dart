import 'package:geolocator/geolocator.dart';

class Location {
  double lat;
  double longg;

  Future<void> getCurrentLocation() async {
    Position position;

    try {
      position = await Geolocator()
          .getCurrentPosition(desiredAccuracy: LocationAccuracy.low);
      lat = position.latitude;
      longg = position.longitude;
      //print(position);
      print(lat);
      print(longg);
    } catch (e) {
      //PlatformException PERMISSION_DENIED Access to location data denied
      //PlatformException PERMISSION_DISABLED Location data is not available on device
      print('There was an Error getting location');
      print(e);
    }
  }
}
