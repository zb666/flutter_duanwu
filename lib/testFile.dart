import 'dart:convert';

import 'package:flutterduanwu/model/user_bean.dart';

void main(){
  var map = {"a":"aaa","b":"bbb"};
  print(map);
  var result = json.encode(map);
  print(result);
  /**
   * {a: aaa, b: bbb}
   * {"a":"aaa","b":"bbb"}
   */
}