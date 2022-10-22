import 'package:flutter/material.dart';
import 'package:portefolio/src/util/constantes.dart';
import 'package:portefolio/src/widgets/snackbar.dart';

class LoginProvider {
  late BuildContext context;
  late Function refresh;
  bool valida = false;
  final LoginProvider _provider = LoginProvider();
  TextEditingController loginController = TextEditingController();
  TextEditingController senhaController = TextEditingController();

  Future? init(BuildContext context, Function refresh) {
    this.context = context;
    this.refresh = refresh;
  }

  validarLogar(){
    if(loginController.text == '' || senhaController.text == ''){
      valida = false;
      return Snackbar.showSnackbar(context, "Erro: dados obrigatórios!", tipo: C.danger);
    }
    if(valida){
      // _provider.logar;
    }
  }

}