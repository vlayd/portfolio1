import 'package:brasil_fields/brasil_fields.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_holo_date_picker/flutter_holo_date_picker.dart';
import 'package:intl/intl.dart';
import 'package:portefolio/src/util/constantes.dart';
import 'package:portefolio/src/util/validates.dart';

class TextfieldApp1 extends StatefulWidget {
  String tipo;
  String label;
  int line;
  String size;
  TextEditingController? controller;

  TextfieldApp1(
      {Key? key,
      this.tipo = C.normal,
      this.label = '',
      this.line = 3,
      this.size = C.normal,
      this.controller})
      : super(key: key);

  @override
  _TextfieldApp1State createState() => _TextfieldApp1State();
}

class _TextfieldApp1State extends State<TextfieldApp1> {

  TextEditingController? controller = TextEditingController();
  double _heightField = 16;
  double _sizeIcon = 30;
  double _fontSiz = 22;
  bool _showPassword = false;
  bool _validaData = true;
  bool _validaEmail = true;
  bool _validaCep = true;
  bool _validaCpfCnpj = true;

  @override
  Widget build(BuildContext context) {
    Widget widgetField = _field();
    if(widget.tipo == C.login){
      widgetField = _fieldLogin();
    } else if(widget.tipo == C.senha){
      widgetField = _fieldSenha();
    } else if(widget.tipo == C.data1){
      widgetField = _fieldData(C.data1);
    } else if(widget.tipo == C.data2){
      widgetField = _fieldData(C.data2);
    } else if(widget.tipo == C.data3){
      widgetField = _fieldData(C.data3);
    } else if(widget.tipo == C.cpf){
      widgetField = _fieldCpf();
    } else if(widget.tipo == C.cnpj){
      widgetField = _fieldCnpj();
    } else if(widget.tipo == C.email){
      widgetField = _fieldEmail();
    } else if(widget.tipo == C.cep){
      widgetField = _fieldCep();
    } else if(widget.tipo == C.campo){
      widgetField = _fieldCampo();
    } else {
      widgetField = _field();
    }

    return widgetField;
  }

  Widget _field() {
    _sizeField();
    return TextField(
      keyboardType: TextInputType.text,
      textInputAction: TextInputAction.next,
      style: TextStyle(fontSize: _fontSiz),
      decoration: InputDecoration(
        contentPadding:
        EdgeInsets.symmetric(vertical: _heightField, horizontal: 20),
        labelText: widget.label,
        labelStyle: TextStyle(fontSize: _fontSiz),
      ),
    );
  }

  Widget _fieldCpf() {
    _sizeField();
    return TextField(
      keyboardType: TextInputType.number,
      textInputAction: TextInputAction.next,
      style: TextStyle(fontSize: _fontSiz),
      decoration: InputDecoration(
        contentPadding:
        EdgeInsets.symmetric(vertical: _heightField, horizontal: 20),
        labelText: 'CPF',
        labelStyle: TextStyle(fontSize: _fontSiz),
        errorText: _validaCpfCnpj?null:"CPF inválido!"
      ),
      inputFormatters: [
        // obrigatório
        FilteringTextInputFormatter.digitsOnly,
        CpfInputFormatter(),
      ],
      onChanged: (value){
        if(value.length==14){
          setState(() {
            _validaCpfCnpj = CPFValidator.isValid(value);
          });
        }
      },
    );
  }

  Widget _fieldCnpj() {
    _sizeField();
    return TextField(
      keyboardType: TextInputType.number,
      textInputAction: TextInputAction.next,
      style: TextStyle(fontSize: _fontSiz),
      decoration: InputDecoration(
          contentPadding:
          EdgeInsets.symmetric(vertical: _heightField, horizontal: 20),
          labelText: 'CNPJ',
          labelStyle: TextStyle(fontSize: _fontSiz),
          errorText: _validaCpfCnpj?null:"CNPJ inválido!"
      ),
      inputFormatters: [
        // obrigatório
        FilteringTextInputFormatter.digitsOnly,
        CnpjInputFormatter(),
      ],
      onChanged: (value){
        if(value.length==18){
          setState(() {
            _validaCpfCnpj = CNPJValidator.isValid(value);
          });
        }
      },
    );
  }

  Widget _fieldCep() {
    _sizeField();
    return FocusScope(
      child: Focus(
        onFocusChange: (focus){
          if(!focus && !_validaCep){
            setState(() {
              _validaCep = false;
            });
          }
        },
        child: TextField(
          keyboardType: TextInputType.number,
          textInputAction: TextInputAction.next,
          style: TextStyle(fontSize: _fontSiz),
          decoration: InputDecoration(
              contentPadding:
              EdgeInsets.symmetric(vertical: _heightField, horizontal: 20),
              labelText: 'CEP',
              labelStyle: TextStyle(fontSize: _fontSiz),
              errorText: _validaCep?null:"CEP inválido!"
          ),
          inputFormatters: [
            FilteringTextInputFormatter.digitsOnly,
            CepInputFormatter(),
          ],
          onChanged: (value){
            if(value.length==10){
              _validaCep = true;
            } else {
              _validaCep = false;
            }
          },
        ),
      ),
    );
  }

  Widget _fieldEmail() {
    _sizeField();
    return FocusScope(
      child: Focus(
        onFocusChange: (focus){
          if(!focus && !_validaEmail){
            setState(() {
              _validaEmail = false;
            });
          }
        },
        child: TextField(
          keyboardType: TextInputType.emailAddress,
          textInputAction: TextInputAction.next,
          style: TextStyle(fontSize: _fontSiz),
          onChanged: (value){
            bool emailValid = RegExp(r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+").hasMatch(value);
            _validaEmail = emailValid;
          },
          decoration: InputDecoration(
            prefixIcon: const Padding(
              padding: EdgeInsets.only(left: 16, right: 8),
              child: Icon(
                Icons.email,
                color: Colors.grey,
                size: 30,
              ),
            ),
            contentPadding:
                const EdgeInsets.symmetric(vertical: 16, horizontal: 15),
            labelText: "E-mail",
            errorText: _validaEmail?null:"E-mail inválido!",
            filled: true,
            fillColor: Colors.white,
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(C.themeRadium),
            ),
          ),
        ),
      ),
    );
  }

  Widget _fieldData(String tipo) {
    _sizeField();
    return TextField(
      controller: controller,
      readOnly: tipo == C.data3 ? false : true,
      //Precisa de brasil_fields: ^1.6.0
      inputFormatters: tipo == C.data3? [
        FilteringTextInputFormatter.digitsOnly, DataInputFormatter()
      ] : null,
      onChanged: (value){
        if(value.length == 10 || tipo == C.data3){
          setState(() {
            _validaData = Validates.validDate(value);
          });
        }
      },
      keyboardType: TextInputType.datetime,
      textInputAction: TextInputAction.next,
      style: TextStyle(fontSize: _fontSiz),
      onTap: (){
        //Evitar que o candendário pisque 2x
        // FocusScope.of(context).requestFocus(FocusNode());
        if(tipo == C.data1) {
          _datePicker1();
        } else if(tipo == C.data2) {
          _datePicker2();
        } //Precisa de flutter_holo_date_picker: ^1.1.0
      },
      decoration: InputDecoration(
        prefixIcon: Padding(
          padding: const EdgeInsets.only(left: 16, right: 8),
          child: Icon(
            Icons.calendar_month,
            color: Colors.grey,
            size: _sizeIcon,
          ),
        ),
        contentPadding:
        EdgeInsets.symmetric(vertical: _heightField),
        labelText: "Data",
        errorText: _validaData?null:"Data inválida!",
        labelStyle: TextStyle(fontSize: _fontSiz),
      ),
    );
  }

  Widget _fieldCampo() {
    _sizeField();
    return TextField(
      keyboardType: TextInputType.multiline,
      textInputAction: TextInputAction.newline,
      maxLines: widget.line,
      style: TextStyle(fontSize: _fontSiz),
      decoration: InputDecoration(
          contentPadding:
          EdgeInsets.symmetric(vertical: _heightField, horizontal: 20),
          labelText: widget.label,
          labelStyle: TextStyle(fontSize: _fontSiz),
      ),
    );
  }

  Widget _fieldLogin() {
    _sizeField();
    return TextField(
      keyboardType: TextInputType.emailAddress,
      textInputAction: TextInputAction.next,
      style: TextStyle(fontSize: _fontSiz),
      decoration: InputDecoration(
        prefixIcon: Padding(
          padding: const EdgeInsets.only(left: 16, right: 8),
          child: Icon(
            Icons.account_circle,
            color: Colors.grey,
            size: _sizeIcon,
          ),
        ),
        contentPadding:
            EdgeInsets.symmetric(vertical: _heightField),
        labelText: "Login",
        labelStyle: TextStyle(fontSize: _fontSiz),
      ),
    );
  }

  Widget _fieldSenha() {
    _sizeField();
    return TextField(
      obscureText: !_showPassword,
      textInputAction: TextInputAction.next,
      style: TextStyle(fontSize: _fontSiz),
      decoration: InputDecoration(
        prefixIcon: Padding(
          padding: const EdgeInsets.only(left: 16, right: 8),
          child: Icon(
            Icons.lock,
            color: Colors.grey,
            size: _sizeIcon,
          ),
        ),
        suffixIcon: Padding(
          padding: const EdgeInsets.only(right: 22),
          child: GestureDetector(
            onTap: (){
              setState(() {
                _showPassword = !_showPassword;
              });
            },
            child: Icon(
              Icons.visibility,
              color: _showPassword ? Colors.green :  Colors.grey,
              size: _sizeIcon,
            ),
          ),
        ),
        contentPadding:
        EdgeInsets.symmetric(vertical: _heightField),
        labelText: "Senha",
        labelStyle: TextStyle(fontSize: _fontSiz),
      ),
    );
  }

  _sizeField(){
    if(widget.size == C.small){
      _heightField = 14;
      _sizeIcon = C.iSizeSmall;
      _fontSiz = C.fSizeSmall;
    } else if(widget.size == C.large){
      _heightField = 18;
      _sizeIcon = C.iSizeLarge;
      _fontSiz = C.fSizeLarge;
    } else {
      _heightField = 16;
      _sizeIcon = C.iSizeNormal;
      _fontSiz = C.fSizeNormal;
    }
  }

  _datePicker1(){
    return showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(1920),
      lastDate: DateTime(2030),
    ).then((DateTime? value){
      if(value != null){
        DateTime _fromTime = DateTime.now();
        _fromTime = value;
        String data = DateFormat('dd/MM/yyyy').format(_fromTime);
        controller?.text = data;
      }
    });
  }

  _datePicker2() async{
    return await DatePicker.showSimpleDatePicker(
      context,
      initialDate: DateTime.now(),
      firstDate: DateTime(1960),
      lastDate: DateTime(2100),
      dateFormat: "dd-MMM-yyyy",
      locale: DateTimePickerLocale.pt_br,
      looping: true,
    ).then((DateTime? value){
      DateTime? _fromTime = DateTime.now();
      _fromTime = value;
      String data = DateFormat('dd/MM/yyyy').format(_fromTime!);
      controller?.text = data;
    });
  }

}
