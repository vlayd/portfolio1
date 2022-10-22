import 'package:flutter/material.dart';
import 'package:portefolio/src/navigator/bottom_navigator.dart';
import 'package:portefolio/src/navigator/bottom_tabs.dart';
import 'package:portefolio/src/navigator/top_tabs.dart';
import 'package:portefolio/src/pages/buttons/buttons_page.dart';
import 'package:portefolio/src/pages/cadastro/cadastro1_page.dart';
import 'package:portefolio/src/pages/home/home_page.dart';
import 'package:portefolio/src/pages/login/login1_page.dart';
import 'package:portefolio/src/util/constantes.dart';

class Rotas {
  static Route<dynamic>? gerarRotas(RouteSettings settings){
    switch(settings.name){
      case C.rHome:
        return MaterialPageRoute(
            builder: (_) => const HomePage()
        );
      case C.rLogin1:
        return MaterialPageRoute(
            builder: (_) => const LoginPage1()
        );
      case C.rCadastro1:
        return MaterialPageRoute(
            builder: (_) => const CadastroPage1()
        );
      case C.rTabTop:
        return MaterialPageRoute(
            builder: (_) => const TopTabs()
        );
      case C.rTabBottom:
        return MaterialPageRoute(
            builder: (_) => const BottomTabs()
        );
      case C.rButtons:
        return MaterialPageRoute(
            builder: (_) => const Buttons()
        );
      case C.rNavBottom:
        return MaterialPageRoute(
            builder: (_) => const BottomNavigator()
        );
      default:
        _erroRota();
    }
  }

  static Route<dynamic> _erroRota(){
    return MaterialPageRoute(
        builder: (_){
          return Scaffold(
            appBar: AppBar(
              title: const Text("Tela não encontrada!"),
            ),
            body: const Center(
              child: Text("Tela não encontrada!"),
            ),
          );
        }
    );

  }
}