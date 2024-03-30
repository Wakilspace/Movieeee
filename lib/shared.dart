import 'package:shared_preferences/shared_preferences.dart';

class UserSimplePreferences{
   SharedPreferences? _preferences;
  static const _keyMoviename = 'Moviename';

   Future init() async =>
       _preferences = await SharedPreferences.getInstance();
  
   Future setMoviename (String moviename) async =>
      await _preferences?.setString(_keyMoviename, moviename);

}