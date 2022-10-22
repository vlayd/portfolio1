import 'package:flutter/material.dart';
import 'package:portefolio/src/util/constantes.dart';
import 'package:portefolio/src/widgets/button_app_1.dart';
import 'package:portefolio/src/widgets/dropdown_app.dart';
import 'package:portefolio/src/widgets/textfield_app_1.dart';

class CadastroPage1 extends StatefulWidget {
  const CadastroPage1({Key? key}) : super(key: key);

  @override
  _CadastroPage1State createState() => _CadastroPage1State();
}

class _CadastroPage1State extends State<CadastroPage1> {
  @override
  Widget build(BuildContext context) {
    double widthImg = MediaQuery.of(context).size.width*0.7;
    return Scaffold(
      body: SafeArea(
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
            child: SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Image.asset(
                      'assets/images/procon_logo.png',
                      height: widthImg,
                      width: widthImg
                  ),
                  TextfieldApp1(label: 'Nome', size: C.large),
                  const SizedBox(height: 20,),
                  TextfieldApp1(tipo: C.login, size: C.large),
                  const SizedBox(height: 20,),
                  TextfieldApp1(tipo: C.senha, size: C.large),
                  const SizedBox(height: 20,),
                  TextfieldApp1(tipo: C.cpf, size: C.large),
                  const SizedBox(height: 20,),
                  TextfieldApp1(tipo: C.cnpj, size: C.large),
                  const SizedBox(height: 20,),
                  TextfieldApp1(tipo: C.cep, size: C.large),
                  const SizedBox(height: 20,),
                  TextfieldApp1(tipo: C.campo, label: 'Descrição', size: C.large),
                  const SizedBox(height: 20,),
                  TextfieldApp1(tipo: C.data3, size: C.large),
                  const SizedBox(height: 20,),
                  Row(
                    children: [
                      Expanded(
                          child: TextfieldApp1(tipo: C.data1, size: C.small)
                      ),
                      Expanded(
                          child: TextfieldApp1(tipo: C.data2, size: C.small)
                      ),
                    ],
                  ),
                  const SizedBox(height: 20,),
                  TextfieldApp1(tipo: C.senha, size: C.normal),
                  const SizedBox(height: 20,),
                  DropDownApp(itens: C.listUf, label: "Estados", hint: "UF", size: C.small,),
                  const SizedBox(height: 30,),
                  ButtonApp1(text: "Logarr", status: C.info, size: C.large, width: 1,)
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
