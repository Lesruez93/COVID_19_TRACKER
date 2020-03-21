import 'package:geolocator/geolocator.dart';

class LocationData {
  double latitude;
  double longitude;
  String country;

  Future<void> getLocationData() async {
    try {
      Position position = await Geolocator()
          .getCurrentPosition(desiredAccuracy: LocationAccuracy.high);
      latitude = position.latitude;
      longitude = position.longitude;
      List<Placemark> placemark =
          await Geolocator().placemarkFromCoordinates(latitude, longitude);

      country = placemark[0].country;
      
      country == 'United States' ? country = 'USA' : country = country;
      country == 'United Kingdom' ? country = 'UK' : country = country;
      print(country);
    } catch (e) {
      // return 'Error in getting info of your country';
      print(e.toString());
    }
  }
}
