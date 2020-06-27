import 'package:flutter/material.dart';

class CurrentIndexProvider with ChangeNotifier {

  static CurrentIndexProvider instance = new CurrentIndexProvider();

  int _currentIndex = 0;

  int get currentIndex => _currentIndex;

  changeIndex(int newIndex) {
    _currentIndex = newIndex;
    notifyListeners();
  }
}
