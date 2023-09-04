
import 'package:flutter/cupertino.dart';

class SimpleCalcWidgetModel extends ChangeNotifier {
  int? firstNumbers;
  int? secondNumbers;
  int? result;

  set numberOne(String value) => firstNumbers = int.parse(value);
  set numberTwo(String value) => secondNumbers = int.parse(value);

  void sum (){
    if(firstNumbers != null && secondNumbers != null){
      result = firstNumbers! + secondNumbers!;
    }else{
      result = null;
    }if(this.result != result){
      this.result = result;
    }
    notifyListeners();
  }
}
