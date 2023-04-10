import 'package:url_launcher/url_launcher.dart';

class Maptutils {
  static Future<void> openmap(double latitude, double longitude) async {
    Uri googleMapUrl = Uri.parse(
        "https://www.google.com/maps/search/?api=1&query=$latitude,$longitude");

    if (await canLaunchUrl(googleMapUrl as Uri)) {
      await launchUrl(googleMapUrl as Uri);
    } else {
      throw 'Couldnot open map';
    }
  }
}
