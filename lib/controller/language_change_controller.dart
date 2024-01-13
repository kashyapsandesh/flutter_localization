import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ChangeLanguage extends ChangeNotifier {
  Locale? _applocale;
  Locale? get applocale => _applocale;

  void changeLocale(Locale type) async {
    SharedPreferences sp = await SharedPreferences.getInstance();
    _applocale = type;
    if (type == Locale('en')) {
      await sp.setString('language_code', "en");
    } else {
      await sp.setString('language_code', "es");
    }
    notifyListeners();
  }
}
