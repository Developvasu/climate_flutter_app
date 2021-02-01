import 'package:geolocator/geolocator.dart';

class FetchLocation {
  Future<Position> getLocationData() async {
    Position position;
    try {
      position = await Geolocator.getCurrentPosition(
          desiredAccuracy: LocationAccuracy.high);
      print(position);
    } catch (e) {
      print(e);
    }
    return position;
  }
}
