

import 'package:flutter/material.dart';

class GoodsItemProvider extends ChangeNotifier{

  List<String> _itemList = [];

  void addValue(String item){
    _itemList.add(item);
  }

  void notifyValue(){
    notifyListeners();
  }


}