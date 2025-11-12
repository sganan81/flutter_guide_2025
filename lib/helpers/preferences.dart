import 'package:shared_preferences/shared_preferences.dart';

class Preferences {
  static late SharedPreferences _prefs;
  static String _name = '';
  static String _email = '';
  static String _telefono = '';
  static bool _darkmode = false;

  static Future<void> initShared() async {
    _prefs = await SharedPreferences.getInstance();
  }

  static String get name {
    return _prefs.getString('name') ?? _name;
  }

  static bool get darkmode {
    return _prefs.getBool('darkmode') ?? _darkmode;
  }

  static set name(String name) {
    _name = name;
    _prefs.setString('name', name);
  }

  static set darkmode(bool darkmode) {
    _darkmode = darkmode;
    _prefs.setBool('darkmode', darkmode);
  }
}
