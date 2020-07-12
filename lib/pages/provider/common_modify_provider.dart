
import 'package:flutter/material.dart';

class CommonModifyProvider extends ChangeNotifier{

  static CommonModifyProvider instance = CommonModifyProvider();

  List<String> _commonList = List.generate(10, (index) => '$index');

  List<String> get commonList => _commonList;

  addString(String item){
    _commonList = ['A',"BB",'c','d'];
    notifyListeners();
  }

  changeValue(){
    _commonList.setRange(2, 5, ['A','B',"C"]);
    notifyListeners();
  }

}