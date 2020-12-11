import 'package:flutter/material.dart';
import 'package:cheirobom/repositories/pages_repository.dart';
import 'package:universal_html/html.dart' as html;

class Routes {
  // ignore: missing_return
  static Route<dynamic> generateRoute(RouteSettings settings) {
    html.window.history.pushState(null, titlesList[0], routesList[0]);
    html.window.onPopState.listen((html.PopStateEvent e) {
      html.window.history.go(1);
    });
    return MaterialPageRoute(builder: (context) => pagesList[0]);
  }
}
