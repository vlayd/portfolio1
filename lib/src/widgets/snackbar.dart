import 'package:flutter/material.dart';
import 'package:portefolio/src/util/constantes.dart';

class Snackbar {

  static void showSnackbar(BuildContext context, String text, {int duration=3, int tipo = C.dark}) {
    ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
            content: Text(
              text,
              textAlign: TextAlign.center,
              style: const TextStyle(
                  color: Colors.white,
                  fontSize: 40
              ),
            ),
          backgroundColor: Color(tipo),
          duration: Duration(seconds: duration),
        )
    );

    //Fecha o snackbar
    if(duration == 0){
      ScaffoldMessenger.of(context).hideCurrentSnackBar();
    }
  }
}