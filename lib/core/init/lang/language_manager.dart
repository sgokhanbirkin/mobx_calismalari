import 'package:flutter/material.dart';

class LanguageManager {
  static final LanguageManager _instance = LanguageManager._init();
  static LanguageManager get instance {
    return _instance;
  }

  LanguageManager._init();

  final enLocale = const Locale("en", "US");

  List<Locale> get supportedLocales => [enLocale];
}
