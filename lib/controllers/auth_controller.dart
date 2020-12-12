import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_login/flutter_login.dart';

class Auth {
  String validateCredentials(FirebaseAuthException error) {
    var errorMessage;
    if (error.code == 'weak-password') {
      errorMessage = 'The password provided is too weak.';
    } else if (error.code == 'email-already-in-use') {
      errorMessage = 'The account already exists for that email.';
    } else if (error.code == 'wrong-password') {
      errorMessage = 'Wrong password provided for that user.';
    } else if (error.code == 'user-not-found') {
      errorMessage = 'No user found for that email.';
    } else {
      errorMessage = error.code.toString();
    }
    return errorMessage;
  }

  Future<String> signUp(LoginData loginData) async {
    try {
      await FirebaseAuth.instance.createUserWithEmailAndPassword(
          email: loginData.name, password: loginData.password);
      return null;
    } on FirebaseAuthException catch (error) {
      return validateCredentials(error);
    }
  }

  Future<String> resetPassword(LoginData loginData) async {
    try {
      await FirebaseAuth.instance.sendPasswordResetEmail(email: loginData.name);
      return null;
    } on FirebaseAuthException catch (error) {
      return validateCredentials(error);
    }
  }

  Future<String> signIn(LoginData loginData) async {
    try {
      await FirebaseAuth.instance.signInWithEmailAndPassword(
          email: loginData.name, password: loginData.password);
      return null;
    } on FirebaseAuthException catch (error) {
      return validateCredentials(error);
    }
  }

  Future<void> signOut() async {
    await FirebaseAuth.instance.signOut();
  }
}
