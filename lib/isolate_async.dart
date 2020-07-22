

import 'dart:async';
import 'dart:isolate';

import 'package:flutter/foundation.dart';

void main() async{

  print('start ${DateTime.now()}');

  var ss = await result;

  print('then $ss ${DateTime.now()}');

  await compute(test,10);

  print('result ${DateTime.now()}');

  var test1 = ValueTest<String>();
  test1.setValue('111');

  test1.value = "AAA";
  print(test1.initValue);

}

class ValueTest<T>{

  T initValue;

  void setValue(T value){
    print('$value');
  }

  set value(T value){
    initValue = value;
    //sp cache
  }

  get value=> initValue;

}

FutureOr test(int message) async{
  await Future.delayed(Duration(seconds: 5));
  return 'Result$message';
}

Future<String> get result async{
  await Future.delayed(Duration(seconds: 5));
  return 'Result';
}