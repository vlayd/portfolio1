import 'package:flutter/material.dart';
import 'package:portefolio/src/theme/theme_data.dart';
import 'package:portefolio/src/util/constantes.dart';
import 'package:portefolio/src/util/rotas.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  final Tema tema = Tema();

  @override
  Widget build(BuildContext context) {
    return  MaterialApp(
      title: "Home",
      initialRoute: C.rHome,
      onGenerateRoute: Rotas.gerarRotas,
      debugShowCheckedModeBanner: false,
      theme: Tema.themeData2(context),
    );
  }
}
