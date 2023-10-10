import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';
import 'package:healthier_carbon_pregnancy_app/helper/log.dart';
import 'package:permission_handler/permission_handler.dart';

class Place {
  Future<String> getAddress() async {
    final PermissionStatus status = await Permission.location.request();
    if (status.isGranted) {
      try {
        final Position position = await Geolocator.getCurrentPosition(
          desiredAccuracy: LocationAccuracy.high,
        );

        final List<Placemark> placemarks = await placemarkFromCoordinates(
            position.latitude, position.longitude);

        if (placemarks.isNotEmpty) {
          final Placemark placemark = placemarks[0];
          final String? city = placemark.locality;
          final String? state = placemark.administrativeArea;
          final String? country = placemark.country;

          return "$city, $state, $country";
        }
      } catch (e) {
        logger.e(e);
      }
    }
    return '';
  }
}
