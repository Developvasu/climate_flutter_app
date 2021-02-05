import 'package:geolocator/geolocator.dart';

class FetchLocation {
  double Latitude;
  double Longitude;

  Future<Position> getLocationData() async {
    Position position;
    try {
      position = await Geolocator.getCurrentPosition(
          desiredAccuracy: LocationAccuracy.high);
      Latitude = position.latitude;
      Longitude = position.longitude;
    } catch (e) {
      print(e);
    }
    return position;
  }
}
