

import 'dart:async';
import 'dart:isolate';

import 'package:flutter/foundation.dart';

void main() async{

  print('start ${DateTime.now()}');


  var ss = await result;

  print('then $ss ${DateTime.now()}');

  await compute(test,10);

  print('result ${DateTime.now()}');


}
FutureOr test(int message) async{
  await Future.delayed(Duration(seconds: 5));
  return 'Result$message';
}

Future<String> get result async{
  await Future.delayed(Duration(seconds: 5));
  return 'Result';
}