
import 'package:flutterduanwu/env/env_config.dart';

class ConfigBean{

  String env;

  bool debug;

  static ConfigBean fromJson(Map<String,dynamic> jsonMap){
    return ConfigBean()
        ..debug = jsonMap['debug']
        ..env = jsonMap['env'];
  }



}