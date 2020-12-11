import 'package:url_launcher/url_launcher.dart';

// ignore: type_annotate_public_apis
redirect(String url) async {
  if (await canLaunch(url)) {
    await launch(url);
  } else {
    throw 'Could not launch $url';
  }
}
