import 'dart:async';

import 'package:flutter/cupertino.dart';
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

  testCallback(() {
    print('函数调用');
  }, (inputSource)=>inputSource.length,source: "修改的值");

}

typedef IntCallBack = int Function(String inputSource);

void testCallback(VoidCallback voidCallback, IntCallBack intCallBack,
    {String source = '默认值'}) {
  voidCallback?.call();
  int callbackResult = intCallBack?.call(source);
  print('Call Result: $callbackResult');
}
