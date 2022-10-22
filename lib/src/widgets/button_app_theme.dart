import 'package:flutter/material.dart';
import 'package:portefolio/src/util/constantes.dart';

class ButtonAppTheme extends StatefulWidget {
  String text;
  int status;
  List? tema;
  int colorText;
  String size;
  double width;
  bool outLine;
  Function? onPressed;
  Function? onPressed2;

  ButtonAppTheme(
      {Key? key,
        required this.text,
        this.colorText = C.themeColorTextBtn,
        this.status = C.themeColorBtn,
        this.tema,
        this.size = C.normal,
        this.width = C.themeWidth,
        this.outLine = false,
        this.onPressed,
        this.onPressed2
      }
  ) : super(key: key);

  @override
  _ButtonAppThemeState createState() => _ButtonAppThemeState();
}

class _ButtonAppThemeState extends State<ButtonAppTheme> {

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
        onPressed: (){},
        child: Text(widget.text),
      style: style(),
    );
  }

  ButtonStyle? style(){
    widget.width = widget.width>1?1:widget.width; //Se for maior que 1, será 1
    double height = 40;
    double fontSize = C.fSizeNormal;
    if(widget.size == C.small){
      height = 30;
      fontSize = C.fSizeSmall;
    } else if(widget.size == C.large){
      height = 50;
      fontSize = C.fSizeLarge;
    }
    return ElevatedButton.styleFrom(
      primary: Color(widget.status),
      onPrimary: Color(widget.colorText),
      onSurface: Colors.green,
      shadowColor: Colors.red,
      side: const BorderSide(color: Colors.black),
      minimumSize: Size(MediaQuery.of(context).size.width*widget.width, height),
        textStyle: TextStyle(
            fontSize: fontSize
        )
    );
  }
}
