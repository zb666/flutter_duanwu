import 'dart:async';
import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutterduanwu/dialog/custom_dialog.dart';
import 'package:flutterduanwu/model/user_bean.dart';

void main() {
  var map = {"a": "aaa", "b": "bbb"};
  print(map);
  var result = json.encode(map);
  print(result);
  _testHttp();

  UserBeanInfo.fromMap(map);

  var age;
//  age??="Name"; 会有额外的一个赋值的操作
  var resultAge = age??'Name';//为空取值，没有额外的操作
  print(age);

}

void _testHttp() async {
  try {
    Response response = await Dio().get(
        "https://www.baidu.com");
    print(response);
  } catch (e) {
    print(e);
  }
}


