import 'package:flutter/cupertino.dart';

void main() {
  try {
    throw StackOverflowError();
  } catch (exception, stackTrace) {
    debugPrint("$exception $stackTrace");
  }
}
