import 'package:geolocator/geolocator.dart';

class Location{

double lat;
double longg;

Future<void> getCurrentLocation() async {
    Position position;

  try{
    position = await Geolocator().getCurrentPosition(desiredAccuracy: LocationAccuracy.low);
    lat = position.latitude;
    longg = position.longitude;
    //print(position);
  }
  catch(e)
  {
    print('Error getting location');
    print(e);
  }
}



}