import 'package:flutter/services.dart';

class BatteryUtil{

  static const batteryChannel = "sample.flutter.io/battery";

  static const platform = MethodChannel(batteryChannel);

 static Future<String> getBatteryLevel() async{
    var map = {"a":"aaa","b":"bbb"};
    return platform.invokeMethod('batteryCount',map);
  }

}