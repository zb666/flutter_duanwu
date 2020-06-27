import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class UserProvider with ChangeNotifier, DiagnosticableTreeMixin {

  static UserProvider instance = UserProvider();

  String _name = "Name";

  String get name => _name;

  void changeName(String userName) {
    this._name = userName;
    notifyListeners();
  }
}
