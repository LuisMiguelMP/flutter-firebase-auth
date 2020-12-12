import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:cheirobom/repositories/pages_repository.dart';
import 'package:universal_html/html.dart' as html;

class Routes {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    var routeName = html.window.location.pathname;
    var index = routesList.indexWhere((route) => (route == routeName));
    html.window.history.pushState(null, titlesList[index], routesList[index]);
    html.window.onPopState.listen((html.PopStateEvent e) {
      html.window.history.go(1);
    });
    var auth = FirebaseAuth.instance;
    var user = auth.currentUser;

    if (routesList.contains(routeName)) {
      auth.authStateChanges().listen((User user) async {
        if (user != null) {
          if (!user.emailVerified) {
            html.window.history.pushState(null, titlesList[2], routesList[2]);

            return MaterialPageRoute(builder: (context) => pagesList[2]);
          } else {
            html.window.history
                .pushState(null, titlesList[index], routesList[index]);
            return MaterialPageRoute(builder: (context) => pagesList[index]);
          }
        } else {
          html.window.history.pushState(null, titlesList[0], routesList[0]);
          return MaterialPageRoute(builder: (context) => pagesList[0]);
        }
      });
    }
    if (user != null) {
      if (!user.emailVerified) {
        html.window.history.pushState(null, titlesList[2], routesList[2]);
        return MaterialPageRoute(builder: (context) => pagesList[2]);
      } else {
        html.window.history.pushState(null, titlesList[1], routesList[1]);
        return MaterialPageRoute(builder: (context) => pagesList[1]);
      }
    } else {
      html.window.history.pushState(null, titlesList[0], routesList[0]);
      return MaterialPageRoute(builder: (context) => pagesList[0]);
    }
  }
}
