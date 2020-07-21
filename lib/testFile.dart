import 'dart:async';
import 'dart:convert';
import 'dart:isolate';

import 'package:dio/dio.dart';
import 'package:flutterduanwu/env/dev.dart';
import 'package:flutterduanwu/immutabletest/immu_test.dart';
import 'package:flutterduanwu/model/dev_bean.dart';

void main() {
  var map = {"a": "aaa", "b": "bbb"};
  print(map);
  var result = json.encode(map);
  print(result);
//  _testHttp();

//  UserBeanInfo.fromMap(map);

  var age;
  age ??= "Name"; //会有额外的一个赋值的操作
  var resultAge = age ?? 'Name'; //为空取值，没有额外的操作
  print(age);

  var strList = [
    {
      'a': {'aa': 'aaa'}
    },
    {
      'b': {'bb': 'bbb'}
    },
    {
      'c': {'cc': 'ccc'}
    }
  ];

  var dio1 = DioTest();
  var dio2 = DioTest();

  var identResult = identical(dio2, dio1);

  print(identResult);

  var dioRun = DioRun();
  var dioRun2 = DioRun();
  print(identical(dioRun, dioRun2));

  Future.delayed(Duration(seconds: 1))
      .then((value) => null, onError: () {})
      .catchError(() {});

  print('---start---$_dateTime');

  Future.delayed(Duration(seconds: 2));

  print('--end test--');

  Future.wait([getAA(), getBBB()]).then((value) {
    print('---end---$_dateTime value:$value');
  }).catchError((e) {
    print('error:$e');
  });

  print('---Inner---$_dateTime');
  getAA().then((value) {
    print('Inner: $_dateTime');
    getBBB().then((value) {
      print('Inner: $_dateTime');
    });
  });

  var count = 2;
  print(++count);
  print(count);

  asyncTest();

//  Isolate.spawn((message) { }, message);

  Son son = Son(10, 20);

  dynamic value = 1;
  print('dynamic:$value');
  value = "aaa";
  print('dynamic:$value');

  List<String> list = null;
  var length = list?.length??2;

  print(length);

  const configJson = {'env': 'dev', 'debug': true};

  var jsonA = json.encode(configJson);

  var a = "{\"env\":\"dev\",\"debug\":true}"; //json串会存在转义
  print(jsonA);

  var configBean = ConfigBean.fromJson(configJson);

  print('${configBean.env} ${configBean.debug}');

}

void asyncTest() async {
  print('start AAA$_dateTime');
  await Future.delayed(Duration(seconds: 3));
  print('start AAAAA $_dateTime');
  Future.delayed(Duration(seconds: 2))
      .then((value) => print('start BBB $_dateTime'));
}

Future<String> getAA() async {
  await Future.delayed(Duration(seconds: 10));
  return "AAA";
}

Future<bool> getBBB() async {
  await Future.delayed(Duration(seconds: 10));
  return false;
}

Future<String> getA = Future<String>(() {
  Future.delayed(Duration(seconds: 5));
  return "AAA";
});

Future<bool> getB = Future<bool>(() {
  Future.delayed(Duration(seconds: 10));
  return false;
});

class DioRun {}

class DioTest {
  static DioTest _dioTest;

  factory DioTest([String name = 'singleTon']) =>
      _dioTest ??= DioTest._internal();

  DioTest._internal();
}

class TypeRunTime<T> {
  T data;

  void request<T>() {
    print(data);
  }
}

void _testHttp() async {
  try {
    Response response = await Dio().get("https://www.baidu.com");
    print(response);
  } catch (e) {
    print(e);
  }
}

DateTime get _dateTime => DateTime.now();


class Top{
  void top(){}
}

class Bottom{
  void bottom(){}
}

class A with Top,Bottom{
  void aa(){
    top();
    bottom();
  }
}

abstract class TopC{
  void testC();
}

class DDD implements TopC{
  @override
  void testC() {
  }
}

class DDDD with TopC{
  @override
  void testC() {
    // TODO: implement testC
  }
}

mixin MixinDemo on TopC{}

//需要MixinDemo 需要继承Top这个类,因为MixinDemo中强制指定了需要继承这个类才能继承MixinDemo
class EEE extends TopC with MixinDemo{
  @override
  void testC() {
  }
}