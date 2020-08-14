import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutterduanwu/main.dart';

void main() {
  FlutterError.onError = (FlutterErrorDetails details) {
    debugPrint('report Error $details'); //
  };
  runZonedGuarded(() {
    runApp(MyApp());
  }, (Object error, StackTrace stack) {
    print('$error  $stack');
  },
      zoneSpecification: ZoneSpecification(
          handleUncaughtError: (Zone self,_, Zone zone,
              Object error, StackTrace stackTrace) {

          }));


}
