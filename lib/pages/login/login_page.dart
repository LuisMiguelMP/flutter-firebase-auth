import 'package:cheirobom/repositories/pages_repository.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_login/flutter_login.dart';
import 'package:cheirobom/controllers/auth_controller.dart';
import 'package:universal_html/html.dart' as html;

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  @override
  Widget build(BuildContext context) {
    return FlutterLogin(
        title: 'Cheiro Bom ♥',
        logo: 'assets/logo.png',
        onLogin: (_) => Auth().signIn(_),
        onSignup: (_) => Auth().signUp(_),
        onRecoverPassword: (_) => Auth().resetPassword(_),
        onSubmitAnimationCompleted: () {
          var auth = FirebaseAuth.instance;
          auth.authStateChanges().listen((User user) async {
            var user = auth.currentUser;
            if (user != null) {
              if (!user.emailVerified) {
                await user.sendEmailVerification();
                html.window.history
                    .pushState(null, titlesList[2], routesList[2]);

                return Navigator.of(context)
                    .pushReplacementNamed(routesList[2]);
              } else {
                html.window.history
                    .pushState(null, titlesList[1], routesList[1]);

                return Navigator.of(context)
                    .pushReplacementNamed(routesList[1]);
              }
            } else {
              html.window.history.pushState(null, titlesList[0], routesList[0]);
              return Navigator.of(context).pushReplacementNamed(routesList[0]);
            }
          });
        });
  }
}
