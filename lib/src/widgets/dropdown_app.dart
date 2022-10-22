import 'package:flutter/material.dart';
import 'package:flutter_holo_date_picker/flutter_holo_date_picker.dart';
import 'package:portefolio/src/util/constantes.dart';

class DropDownApp extends StatefulWidget {
  List<String> itens;
  String? label;
  String? hint;
  String size;

  DropDownApp({
      required this.itens,
      this.label='',
      this.hint='',
      this.size = C.normal,
      Key? key}) : super(key: key);

  @override
  _DropDownAppState createState() => _DropDownAppState();
}

class _DropDownAppState extends State<DropDownApp> {
  String? defValue;
  double _heightField = 9;
  double _fontSiz = 22;

  @override
  Widget build(BuildContext context) {
    return _dropDown();
  }

  Widget _dropDown(){
    _sizeField();
    List<DropdownMenuItem<String>> _dropdownMenuItem = widget.itens
        .map((String value) => DropdownMenuItem(
          value: value,
          child: Text(value),
    )).toList();
    return Container(
      padding: EdgeInsets.symmetric(vertical: _heightField, horizontal: 8),
      decoration: BoxDecoration(
        borderRadius: const BorderRadius.all(Radius.circular(C.themeRadium)),
        color: Colors.white,
        border: Border.all(color: Colors.black54)
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text("${widget.label}", style: TextStyle(
            fontSize: _fontSiz
          ),),
          Text(widget.label!=""? " | ":"",
            style: const TextStyle(
            fontSize: 35, fontWeight: FontWeight.w100
          ),),
          DropdownButton<String>(
            value: defValue,
            style: TextStyle(fontSize: _fontSiz, color: Colors.black87),
            hint: Text("${widget.hint}", style: TextStyle(
                fontSize: _fontSiz
            ),),
            onChanged: (novoValor){
              if(novoValor != null){
                setState(() {
                  defValue = novoValor;
                });
              }
            },
            items: _dropdownMenuItem,
          ),
        ],
      ),
    );
  }

  _sizeField(){
    if(widget.size == C.small){
      _heightField = 0;
      _fontSiz = C.fSizeSmall;
    } else if(widget.size == C.large){
      _heightField = 4;
      _fontSiz = C.fSizeLarge;
    } else {
      _heightField = 1;
      _fontSiz = C.fSizeNormal;
    }
  }

}
