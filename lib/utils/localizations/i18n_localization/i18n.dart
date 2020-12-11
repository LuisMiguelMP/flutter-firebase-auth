import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

class I18n {
  final Locale locale;

  static final List _supportedLanguages = [
    ['en', ''],
    ['pt', '']
  ];

  Map<String, String> _localizedStrings;

  I18n(this.locale);

  static I18n of(BuildContext context) => Localizations.of<I18n>(context, I18n);

  Future<bool> load() =>
      rootBundle.loadString('i18n/${locale.languageCode}.json').then(
        (jsonString) {
          Map<String, dynamic> jsonMap = json.decode(jsonString);
          return jsonMap;
        },
      ).then(
        (jsonMap) {
          _localizedStrings = jsonMap.map((k, v) => MapEntry(k, v.toString()));
          return true;
        },
      );

  String translate(String key) => _localizedStrings[key];

  static Iterable<LocalizationsDelegate<dynamic>> localizationsDelegates() => [
        const I18nDelegate(),
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
      ];

  static Iterable<Locale> supportedLocales() => _supportedLanguages
      .map((language) => Locale(language[0], language[1]))
      .toList();
}

class I18nDelegate extends LocalizationsDelegate<I18n> {
  const I18nDelegate();

  @override
  bool isSupported(Locale locale) => I18n._supportedLanguages
      .map((language) => language[0])
      .contains(locale.languageCode);

  @override
  Future<I18n> load(Locale locale) async {
    var localizations = I18n(locale);
    return localizations.load().then((status) => localizations);
  }

  @override
  bool shouldReload(I18nDelegate old) => false;
}
