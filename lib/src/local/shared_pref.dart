import 'package:portefolio/src/model/login.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SharedPred {

  static Future<void> saveLogin(Login login) async{
    final _prefs = await SharedPreferences.getInstance();
    await _prefs.setString("user", login.user);
    await _prefs.setString("senha", login.senha);
  }

  static Future<Login> getLogin() async{
    Login login = Login();
    final _prefs = await SharedPreferences.getInstance();
    login.user =  _prefs.getString("user")!;
    login.user = _prefs.getString("senha")!;
    return login;
  }

}