import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import '../local/shared_pref.dart';
import '../model/login.dart';
import '../util/constantes.dart';

class LoginProvider {

  //Checar se está logado
  void checkIfUserIsLogged(BuildContext context) async{
    Login login = await SharedPred.getLogin();
    if(login.user != '' && login.senha != ''){
      Navigator.pushNamedAndRemoveUntil(context, "/", (_)=>false);
    } else {
      Navigator.pushNamedAndRemoveUntil(context, C.rLogin1, (_)=>false);
    }
  }

  //Login
  Future<dynamic> signIn(Login login) async {
    http.Response response;
    try{
      response = await http.get(
          Uri.parse(C.urlLogar),
          headers: {
            'Content-type': 'application/json',
            "login": login.user,
            "senha": login.senha,
          }
      );
    } catch(e){
      throw Exception(e);
    }
    if(response.statusCode == 200) {
      var map = jsonDecode(response.body);
      var tipo = map['tipo'];
      if (tipo == 'sucesso') {
        login.user = map['resposta']['user'];
        login.senha = map['resposta']['senha'];
        await SharedPred.saveLogin(login);
        return true;
      } else {
        return map['resposta'];
      }
    }
  }

  //Logoff
  Future<void> signOut() async{
    Login login = Login();
    login.user = '';
    login.senha = '';
    await SharedPred.saveLogin(login);
  }
}