import 'package:flutter/services.dart';

class ASRPlugin{

  static MethodChannel _methodChannel = new MethodChannel('startRecord');

  static Future<int> getRecordDuration(Map<String,String> mapJson) async{
    return await _methodChannel.invokeMethod('start',mapJson);
  }



}