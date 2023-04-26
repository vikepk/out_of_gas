import 'package:url_launcher/url_launcher.dart';

class Maptutils {
  static Future<void> openmap(String longlang) async {
    Uri googleMapUrl =
        Uri.parse("https://www.google.com/maps/search/?api=1&query=$longlang");

    if (await canLaunchUrl(googleMapUrl as Uri)) {
      await launchUrl(googleMapUrl as Uri);
    } else {
      throw 'Couldnot open map';
    }
  }
}
