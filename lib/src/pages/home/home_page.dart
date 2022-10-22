import 'package:flutter/material.dart';
import 'package:portefolio/src/util/constantes.dart';
import 'package:portefolio/src/widgets/button_app_1.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          alignment: Alignment.center,
          padding: C.paddingContainer,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ButtonApp1(text: "Botões", onPressed:(){_goToPage(C.rButtons);}),
              ButtonApp1(text: "Cadastro 1", onPressed:(){_goToPage(C.rCadastro1);}),
              ButtonApp1(text: "Tabs top", onPressed:(){_goToPage(C.rTabTop);}),
              ButtonApp1(text: "Tabs bottom", onPressed:(){_goToPage(C.rTabBottom);}),
              ButtonApp1(text: "Navigator bottom", onPressed:(){_goToPage(C.rNavBottom);}),
            ],
          ),
        ),
      ),
    );
  }

  _goToPage(String rota){
    Navigator.pushNamed(context, rota);
  }
}
