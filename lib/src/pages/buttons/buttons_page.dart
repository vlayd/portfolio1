import 'package:flutter/material.dart';
import 'package:portefolio/src/util/constantes.dart';
import 'package:portefolio/src/widgets/button_app_1.dart';

class Buttons extends StatelessWidget {
  const Buttons({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Botões"),
      ),
      body: SafeArea(
          child: Container(
            alignment: Alignment.center,
            padding: C.paddingContainer,
            child: Column(
              children: [
                ButtonApp1(text: "Button dark large", size: C.large,),
                const SizedBox(height: 12,),
                ButtonApp1(text: "Button danger normal", status: C.danger,),
                const SizedBox(height: 8,),
                ButtonApp1(text: "Button success small", size: C.small, status: C.success,),
                const SizedBox(height: 12,),
                ButtonApp1(text: "Button info outLine", status: C.info, outLine: true,),
                const SizedBox(height: 12,),
                ButtonApp1(text: "Button icon warning", status: C.warning, iconData: Icons.delete,),
                const SizedBox(height: 12,),
                ButtonApp1(text: "Button 50% secondary", status: C.primary, width: 0.5, iconData: Icons.check_circle,),
                const SizedBox(height: 12,),
                ButtonApp1(text: "Button 25%", status: C.primary, width: 0.25),
              ],
            ),
          )
      ),
    );
  }
}
