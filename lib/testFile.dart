import 'dart:async';
import 'dart:convert';

import 'package:dio/dio.dart';
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
  var length = list?.length ?? 2;

  print(length);

  const configJson = {'env': 'dev', 'debug': true};

  var jsonA = json.encode(configJson);

  var a = "{\"env\":\"dev\",\"debug\":true}"; //json串会存在转义
  print(jsonA);

  var configBean = ConfigBean.fromJson(configJson);

  print('${configBean.env} ${configBean.debug}');
}

get name {
  return 'Name';
}

set name(int value) {}

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

class Top {
  void top() {}
}

class Bottom {
  void bottom() {}
}

class A with Top, Bottom {
  void aa() {
    top();
    bottom();
  }
}

abstract class TopC {
  void testC();
}

class DDD implements TopC {
  @override
  void testC() {}
}

class DDDD with TopC {
  @override
  void testC() {}
}

mixin MixinDemo on TopC {}

//需要MixinDemo 需要继承Top这个类,因为MixinDemo中强制指定了需要继承这个类才能继承MixinDemo
class EEE extends TopC with MixinDemo {
  @override
  void testC() {

  }
}

String get area {
  return "AAA";
}

//void main() {
//  print("main start");
//
//  Future(() => print("task1"));
//
//  final future = Future(() => null);
//
//  Future(() => print("task2")).then((_) {
//    print("task3");
//    scheduleMicrotask(() => print('task4'));
//  }).then((_) => print("task5"));
//
//  future.then((_) => print("task6"));
//  scheduleMicrotask(() => print('task7'));
//
//  Future(() => print('task8'))
//      .then((_) => Future(() => print('task9')))
//      .then((_) => print('task10'));
//
//  print("main end");
//
//  MySql().save();
//
//  Timer.periodic(Duration(seconds: 1), (timer) {
//
//  });
//
//  Future.delayed(Duration(seconds: 1),(){
//
//  }).then((value) => print('success'),onError: (error){
//
//  }).catchError((ex){
//
//  }).whenComplete(() => null);
//
//
//  Future.wait([
//    Future.delayed(Duration(seconds: 0),(){
//      print('${DateTime.now()}');
//    }),
//    // 2秒后返回结果
//    Future.delayed(new Duration(seconds: 2), () {
//      return "hello";
//    }),
//    // 4秒后返回结果
//    Future.delayed(new Duration(seconds: 4), () {
//      return " world";
//    })
//  ]).then((results){
//    print('${DateTime.now()}');
//    print(results[0]+results[1]);
//  }).catchError((e){
//    print(e);
//  });
//
//
//}

class AAA {
  int height;

  AAA() : height = 2 {
    print('构造方法被调用了');
  }
}

//available at http://127.0.0.1:57535/
abstract class DB {
  String uri;

  addStr(String data);

  save(){
    print('MySql: $uri');
  }
}

class MySql extends DB{

  @override
  String get uri => "super.uri";

  @override
  addStr(String data) {

  }

  @override
  save() {
    super.save();
  }
}

class MyImpl implements DB{
  @override
  String uri;

  @override
  addStr(String data) {
  }

  @override
  save() {
  }
}


// main start -> main end 因为两者不是Future，属于普通的方法
// 注意，Dart的Future是有先后的执行顺序的，不存在Java那样的多线程并发的情况的发生。 存在的只有EventQueue和MicroTaskQueue.
// 7是 scheduleMicrotask所以最先执行。
// 之后因为tasks 2,3,4是一次性的被装载到 EventQueue中的，相当于 await 2,3,4. task4虽然优先级高，但还想相当于新开了一个Future,
// Future 5的执行相当于在 234所在的EventQueue上新开了一个Future,所以自然在234之后，又因为他是scheduleMicroTask，所以执行的顺序肯定比
// 8要靠前,而且是属于task3的一部分的，不是属于单独的一个Future.
//然后执行完之后，再执行8,9,10.
//记住 即使是在Future中发起一个新的Future,该Future还是属于发起者的一部分.
// 所以最终的执行顺序是
//main start
//main end
//task7
//task1
//task6
//task2
//task3
//task5
//task4
//task8
//task9
//task10
