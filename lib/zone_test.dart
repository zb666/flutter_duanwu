import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutterduanwu/demo/demo_widget.dart';
import 'package:flutterduanwu/main.dart';

void main() {
//  FlutterError.onError = (FlutterErrorDetails details) {
//    debugPrint('report Error $details'); //
//  };
//  runZonedGuarded(() {
//    runApp(MyApp());
//  }, (Object error, StackTrace stack) {
//    print('$error  $stack');
//  },
//      zoneSpecification: ZoneSpecification(
//          handleUncaughtError: (Zone self,_, Zone zone,
//              Object error, StackTrace stackTrace) {
//
//          }));

  runApp(
      MaterialApp(home: DemoHomeWidget(),
  ));

  testCallback(() {
    print('函数调用');
  }, (inputSource) => inputSource.length, source: "修改的值");

  getNumbers(10).listen((event) {
    print('value: $event');
  });

}

Stream<int> getNumbers(int number) async* {
  for (int i = 0; i < number; i++) {
    await Future.delayed(Duration(seconds: 3));
    yield i;
  }
  print('end...');
}

typedef IntCallBack = int Function(String inputSource);

void testCallback(VoidCallback voidCallback, IntCallBack intCallBack,
    {String source = '默认值'}) {
  voidCallback?.call();
  int callbackResult = intCallBack?.call(source);
  print('Call Result: $callbackResult');
}
