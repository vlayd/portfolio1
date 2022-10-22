import 'package:flutter/material.dart';
import 'package:portefolio/src/util/constantes.dart';

class ButtonApp1 extends StatefulWidget {
  String text;
  int status;
  int colorText;
  String size;
  double width;
  bool outLine;
  IconData? iconData;
  Function? onPressed;
  Function? onPressed2;

  ButtonApp1(
      {Key? key,
        required this.text,
        this.colorText = C.themeColorTextBtn,
        this.status = C.themeColorBtn,
        this.size = C.normal,
        this.iconData,
        this.width = C.themeWidth,
        this.outLine = false,
        this.onPressed,
        this.onPressed2
      }
  ) : super(key: key);

  @override
  _ButtonApp1State createState() => _ButtonApp1State();
}

class _ButtonApp1State extends State<ButtonApp1> {

  @override
  Widget build(BuildContext context) {
    return widget.iconData!=null?buttonIcon():buttonNormal();
  }

  Widget buttonNormal(){
    return ElevatedButton(
      onPressed: (){widget.onPressed!();},
      child: Text(widget.text),
      style: style(),
    );
  }

  Widget buttonIcon(){
    return ElevatedButton.icon(
      onPressed: (){},
      label: Text("  ${widget.text}"),
      style: style(),
      icon: Icon(widget.iconData),
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
      primary: Color(widget.outLine?C.themeColorTextBtn:widget.status),
      onPrimary: Color(widget.outLine?widget.status:C.themeColorTextBtn),
      onSurface: Colors.green,
      shadowColor: Colors.red,
      side: BorderSide(color: widget.outLine?Color(widget.status):Colors.black12, width: 2),
      minimumSize: Size(MediaQuery.of(context).size.width*widget.width, height),
        textStyle: TextStyle(
            fontSize: fontSize,
        )
    );
  }
}
