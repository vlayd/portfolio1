import 'package:flutter/material.dart';

class C {
  static const String enviar = "Enviar";

  //Dados do tema principal
  static const int themeColorTextBtn = 0xffffffff;
  static const int themeColorBtn = 0xff212529;
  static const int themeColorSecondary = 0xff0D6EFD;
  static const double themeWidth = 1;
  static const double themeRadium = 5;
  static const paddingContainer = EdgeInsets.all(16);

  //Fontes sizes
  static const double fSizeSmall = 15;
  static const double fSizeNormal = 18;
  static const double fSizeLarge = 22;

  //Icons sizes
  static const double iSizeSmall = 24;
  static const double iSizeNormal = 30;
  static const double iSizeLarge = 35;

  //Botões
  static const int primary = 0xff0275d8;
  static const int secondary = 0xff292b2c;
  static const int success = 0xff5cb85c;
  static const int warning = 0xfff0ad4e;
  static const int danger = 0xffdc3545;
  static const int info = 0xff5bc0de;
  static const int dark = 0xff212529;
  static const String large = "large";
  static const String normal = "normal";
  static const String small = "small";

            //Widgets
  //Textfield
  static const String cpf = "cpf";
  static const String cnpj = "cnpj";
  static const String cep = "cep";
  static const String email = "email";
  static const String data1 = "data1";
  static const String data2 = "data2";
  static const String data3 = "data3";
  static const String campo = "campo";
  static const String login = "login";
  static const String senha = "senha";

  //Temas botões
  static const List btFacebook = ["btFacebook", 0xff3b5998];
  static const List btTwitter = ["btTwitter", 0xff00ACED];
  static const List btWhats = ["btWhats", 0xff25D366];
  static const List btGooglePlus = ["btGooglePlus", 0xffDC4B38];
  static const List btDribble = ["btDribble", 0xffEA4C88];
  static const List btLinkedin = ["btLinkedin", 0xff0F76A8];
  static const List btYoutube = ["btYoutube", 0xffC5302C];
  static const List btStack = ["btStack", 0xff2EB77D];
  static const List btPinterest = ["btPinterest", 0xffC8222D];
  static const List btInstagram = ["btInstagram", 0xff9F30A8];

  //Formatos
  static const String square = "square";
  static const String circle = "circle";

  //Rotas
  static const String rHome = "/";
  static const String rLogin1 = "/login1";
  static const String rCadastro1 = "/cadastro1";
  static const String rTabBottom = "/tab-bottom";
  static const String rTabTop = "/tab-top";
  static const String rButtons = "/buttons";
  static const String rNavBottom = "/nav-bottom";

  //Arrays importantes
  static const List<String> listUf = [
    'AC','AL','AP','AM','BA','CE','ES','GO','MA','MT','MS','MG','PA','PB','PR',
    'PE','PI','RJ','RN','RS','RO','RR','SC','SP','SE','TO','DF',
  ];

  static const mapMeses = <String, String>{
    "01" : "janeiro",
    "02" : "fevereiro",
    "03" : "março",
    "04" : "abril",
    "05" : "maio",
    "06" : "junho",
    "07" : "julho",
    "08" : "agosto",
    "09" : "setembro",
    "10" : "outrubro",
    "11" : "novembro",
    "12" : "dezembro",
  };

  static const mapDiaSemana = <String, String>{
    "Sun" : "domingo",
    "Mon" : "segunda-feira",
    "Tue" : "terça-feira",
    "Wed" : "quarta-feira",
    "Thu" : "quinta-feira",
    "Fri" : "sexta-feira",
    "Sat" : "sábado",
  };

  //Números por extenso
  static const mapNum = <String, String>{
    "1":"um", "2":"dois", "3":"três", "4":"quatro", "5":"cinco", "6":"seis",
    "7":"sete", "8":"oito", "9":"nove", "11":"onze", "12":"doze", "13":"treze",
    "14":"catorze", "15":"quinze", "16":"dezesseis", "17":"dezessete",
    "18":"dezoito", "19":"dezenove", "10":"dez", "20":"vinte", "30":"trinta",
    "40":"quarenta", "50":"cinquenta", "60":"sessenta", "70":"setenta",
    "80":"oitenta", "90":"noventa", "100":"cento", "200":"duzentos",
    "300":"trezentos", "400":"quatrocentos", "500":"quinhentos", "600":"seiscentos",
    "700":"setecentos", "800":"oitocentos", "900":"novecentos"
  };

  //Url api
  static const String urlLogar = "https://google.com/user/logar";
}