import 'package:flutter/material.dart';

class CounterModelProvider extends ChangeNotifier {
  static CounterModelProvider instance = new CounterModelProvider();

  int _count = 0;

  int get count=>_count;

//  void changeValue(int changeValue) {
//    value = changeValue;
//    notifyListeners();
//  }

  set count(int changeValue){
    assert(changeValue!=_count && changeValue>0);
    _count = changeValue;
    notifyListeners();
  }

}
