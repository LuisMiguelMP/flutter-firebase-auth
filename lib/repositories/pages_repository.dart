import 'package:flutter/widgets.dart';
import 'package:cheirobom/pages/pages.dart';

const List<String> routesList = ['/login', '/', '/verify'];
const List<String> titlesList = ['./login_', './home_', './verify_'];
List<Widget> pagesList = [LoginPage(), HomePage(), VerifyEmailPage()];
