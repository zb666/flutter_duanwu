import 'dart:async';

import 'dart:convert';

import 'dart:math';

import 'package:rxdart/rxdart.dart';

void main() {
  var bb = 0.1 + 0.2;
  print(bb);
  doSomeThing();
//  Container(
//    width: double.infinity,
//  )

  Timer.periodic(const Duration(seconds: 3), (timer) {
    //间隔的功能实现
    print('轮询任务开始');
    timer.cancel();
  });

  Map userInfo = {"a": "张三", "b": "李四"};
  try {
    assert(userInfo == null);
  } catch (ex) {
//    rethrow; 将堆栈信息保留 并且重新抛出
  }

  //map to json,序列化Map到Json字符串
  var encode = json.encode(userInfo);
  print(encode);
  //json转化成map类型
  Map user = json.decode(encode);
  var decodeZhangSan = user['a'];
  print(decodeZhangSan);

  Demo().doSubscribe();
}

class Demo {
  StreamController<String> _streamController = StreamController<String>();

  StreamSink get _streamSink => _streamController.sink;

  Stream get _stream => _streamController.stream;

  void doSubscribe() {
    StreamSubscription<String> streamSubscription = _stream.listen((event) {
      print('event: $event');
    });

    streamSubscription.onError((error) {
      print('error: $error');
    });

    var asBroadcastStream = _stream.asBroadcastStream(onListen: (value) {
      print('asBroadcastStream: $value');
    }, onCancel: (cancel) {
      print('asBroadcastStream: $cancel');
    });

    _streamController.add('controlller test');

    _streamSink.add('value');

    _streamSink.addError(Exception('error occur'));

    _streamController.close();

    Timer.periodic(Duration(seconds: 1), (timer) {
      _streamSink.add(Random(10).toString());
    });

    //Stream单播和广播的用法
    var publishSubject = PublishSubject<String>();
    publishSubject.stream.listen((event) {
      print('valueA: $event');
    });

    publishSubject.stream.listen((event) {
      print('valueB: $event');
    });

    publishSubject.sink
      ..add("----Value----")
      ..add('-----Value-----')
      ..add("---Value---")
      ..addError(Exception('错误'));

    publishSubject.close();

//    streamSubscription.cancel();
//    streamSubscription.resume();
//    streamSubscription.pause();
  }

//流提供入口

}

//Stream生成的是流
Stream<int> doSomeThing() async* {
  for (int i = 1; i <= 10; i++) {
    await Future.delayed(const Duration(seconds: 2));
    yield i;
  }
}
