import 'package:geolocator/geolocator.dart';
import 'package:geocoding/geocoding.dart';
import 'package:intl/intl.dart';
import 'package:portefolio/src/util/constantes.dart';

class Utility {
  static String covertDoc (String doc){
    String docC = doc;
    if(doc.trim().length == 11){
      docC = '${doc.substring(0,3)}.${doc.substring(3,6)}.${doc.substring(6,9)}-${doc.substring(9)}';
    } else if (doc.trim().length == 14){
      docC = '${doc.substring(0,2)}.${doc.substring(2,5)}.${doc.substring(5,8)}/${doc.substring(8,12)}-${doc.substring(12)}';
    }
    return docC;
  }

  static String covertCEP(String cep){
    String cepC = cep;
    if(cep.trim().length == 8){
      cepC = '${cep.substring(0,2)}.${cep.substring(2,5)}-${cep.substring(5)}';
    }
    return cepC;
  }

  static String newDate(int dias){
    var newDate = DateTime.now().add(Duration(days: dias));
    DateFormat format = DateFormat("dd/MM/yyyy");
    DateFormat formatSemana = DateFormat("E");
    String? diaSemana = C.mapDiaSemana[formatSemana.format(newDate)];
    return "${format.format(newDate)} ($diaSemana)";
  }

  static String? nExtenso (String num){
    String? numEx = '';
    if(num.length == 1) {
      numEx = C.mapNum[num];
    } else if(num.length == 2){
      if(num.substring(1) == '0' || num.substring(0,1) == '1'){
        numEx = C.mapNum[num];
      } else {
        numEx = C.mapNum[num.substring(0,1)+'0']! + ' e ' + C.mapNum[num.substring(1)]!;
      }
    } else if (num.length == 3) {
      if(num.substring(1) == "00"){
        if(num == '100'){
          numEx = 'cem';
        } else {
          numEx = C.mapNum[num];
        }
      } else if(num.substring(1,2) == "0") {
        numEx = C.mapNum[num.substring(0,1)+'00']! + ' e ' + C.mapNum[num.substring(2)]!;
      } else if(num.substring(1,2) == "1"){
        numEx = C.mapNum[num.substring(0,1)+'00']! + ' e ' + C.mapNum[num.substring(1)]!;
      } else {
        if(num.substring(2) == "0"){
          numEx = C.mapNum[num.substring(0,1)+'00']! + ' e ' + C.mapNum[num.substring(1)]!;
        } else {
          numEx = C.mapNum[num.substring(0,1)+'00']! + ' e ' + C.mapNum[num.substring(1,2)+'0']! + ' e ' + C.mapNum[num.substring(2)]!;
        }
      }
    }
    return numEx;
  }

  static Future<bool> _handleLocationPermission() async{
    late bool serviceEnabled;
    late LocationPermission permission;

    serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if(!serviceEnabled){
      print("Resposta Os serviços de localização estão desativados");
      return false;
    }

    permission = await Geolocator.checkPermission();
    if(permission == LocationPermission.denied){
      permission = await Geolocator.requestPermission();
      if(permission == LocationPermission.denied){
        print("Permissão de localização estão negadas!");
        return false;
      }
    }
    if(permission == LocationPermission.deniedForever){
      print("Permissão de localização estão permanentes negadas!");
      return false;
    }
    return true;
  }

  /*
  Precisa de dois plugins
  geolocator: ^8.2.1
  geocoding: ^2.0.5
  No AndroidManifest.xml pôr abaixo da primeira tag:
    <uses-permission android:name="android.permission.ACCESS_FINE_LOCATION"/>
  */
  static Future<Map<String, String>> getAddress() async{
    final bool hasPermission = await _handleLocationPermission();
    if(!hasPermission) return {};

    Map<String, String> mapEndereco = {};
    Position position = await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.best
    ).timeout(const Duration(seconds: 20));
    print("Resposta ${position.latitude}");
    List<Placemark> listaEnderecos = await placemarkFromCoordinates(
        position.latitude,
        position.longitude
    );
    if(listaEnderecos != null && listaEnderecos.length >0){
      Placemark? endereco = listaEnderecos[0];
      mapEndereco = {
        "rua" : endereco.thoroughfare.toString(),
        "n" : endereco.subThoroughfare.toString(),
        "bairro" : endereco.subLocality.toString(),
        "cep" : endereco.postalCode.toString(),
        "cidade" : endereco.subAdministrativeArea.toString(),
      };
    }
    return mapEndereco;
  }
}