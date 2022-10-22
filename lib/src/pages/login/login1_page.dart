import 'package:flutter/material.dart';
import 'package:portefolio/src/util/constantes.dart';
import 'package:portefolio/src/widgets/button_app_1.dart';
import 'package:portefolio/src/widgets/textfield_app_1.dart';

class LoginPage1 extends StatefulWidget {
  const LoginPage1({Key? key}) : super(key: key);

  @override
  _LoginPage1State createState() => _LoginPage1State();
}

class _LoginPage1State extends State<LoginPage1> {
  @override
  Widget build(BuildContext context) {
    double widthImg = MediaQuery.of(context).size.width*0.7;
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Center(
            child: Container(
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height,
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                  border: Border.all(
                      color: Colors.grey
                  ),
                  color: const Color(0xffDCDCDC)
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Image.asset(
                  'assets/images/procon_logo.png',
                    height: widthImg,
                    width: widthImg),
                  TextfieldApp1(tipo: C.login, size: C.large),
                  const SizedBox(height: 20,),
                  TextfieldApp1(tipo: C.senha, size: C.large,),
                  const SizedBox(height: 30,),
                  ButtonApp1(text: "Logar", status: C.info, size: C.large, width: 1,)
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
