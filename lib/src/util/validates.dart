import 'package:intl/intl.dart';

class Validates {

  static bool validDate(String value){
    DateFormat format = DateFormat("dd/MM/yyyy");
    try{
      format.parseStrict(value);
      return true;
    } catch(e){
      return false;
    }
  }

}