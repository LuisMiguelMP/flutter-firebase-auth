import 'package:cheirobom/repositories/pages_repository.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_login/flutter_login.dart';
import 'package:cheirobom/controllers/auth_controller.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  @override
  Widget build(BuildContext context) {
    return FlutterLogin(
        title: 'Cheiro Bom ♥',
        logo: '',
        onLogin: (_) => Auth().signIn(_),
        onSignup: (_) => Auth().signUp(_),
        onRecoverPassword: (_) => Auth().signOut(),
        onSubmitAnimationCompleted: () {
          var auth = FirebaseAuth.instance;
          auth.authStateChanges().listen((User user) async {
            var user = auth.currentUser;
            if (user != null) {
              if (!user.emailVerified) {
                await user.sendEmailVerification();
                return Navigator.of(context)
                    .pushReplacementNamed(routesList[2]);
              } else {
                return Navigator.of(context)
                    .pushReplacementNamed(routesList[1]);
              }
            } else {
              return Navigator.of(context).pushReplacementNamed(routesList[0]);
            }
          });
        });
  }
}
