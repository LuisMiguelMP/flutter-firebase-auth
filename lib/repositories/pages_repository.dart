import 'package:flutter/widgets.dart';
import 'package:cheirobom/pages/pages.dart';

const List<String> routesList = ['/login', '/home', '/verification'];
const List<String> titlesList = ['./login_', './home_', './verification_'];
List<Widget> pagesList = [LoginPage(), HomePage(), VerifyEmailPage()];
