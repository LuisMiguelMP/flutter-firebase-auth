import 'package:cheirobom/utils/localizations/localizations.dart';
import 'package:flutter/material.dart';

import 'repositories/pages_repository.dart';
import 'routes/routes.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        initialRoute: routesList[0],
        onGenerateRoute: Routes.generateRoute,
        onGenerateTitle: (BuildContext context) =>
            I18n.of(context).translate('title'),
        localizationsDelegates: I18n.localizationsDelegates(),
        supportedLocales: I18n.supportedLocales());
  }
}
