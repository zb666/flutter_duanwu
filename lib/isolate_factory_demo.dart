import 'dart:io';
import 'dart:isolate';

void main() async{

  var circleA = Circle();
  var circleB = Circle();

  var bool = identical(circleA, circleB);

  print('result:$bool');

  var square = Square();
  print('Circle: ${circleA.area} Square: ${square.area}');

   Future<int> ftResult = Future.delayed(Duration(seconds: 3)).then((value){
      return 123;
  },onError: (ex){
    //if canHandle do this
     //else rethrow
  });

   var result = await ftResult;

   print('result: $result');

   Future.sync((){

   });

   Future.microtask((){
      print('microtask');
   });


   isolateSpawnDemo();


}

void isolateSpawnDemo() async{

  ReceivePort receivePort = new ReceivePort();

  SendPort port1 = receivePort.sendPort;
  //1将自己的发射器发送给2 ，该发射器可以用来装载2的发射器
  await Isolate.spawn(_doWork,port1);

  SendPort port2;

  receivePort.listen((message) {
    print('message:$message');
   if(message[0] == 0){
     port2 = message[1];
   }else {
     //1拿到了2的发射器
     port2?.send([1,'这条信息是mainIsoLate发送的']);
   }
  });

}

abstract class Shape {
  factory Shape(String type) {
    if (type == 'circle') return Circle();
    return Square();
  }

  num get area;
}

class Circle implements Shape {
  @override
  num get area => 123;
}

class Square implements Shape {
  @override
  num get area => 456;
}

void _doWork(SendPort port1) {

  //耗时操作
  ReceivePort port2 = new ReceivePort();
  var sendPort2 = port2.sendPort;
  port2.listen((message) {
    //1拿到了2的发射器 然后发送了数据
    print('do work message :$message');
  });

  port1.send([0,sendPort2]);

  sleep(Duration(seconds: 3));
  port1.send([1,"DoWork任务完成"]);

  //将2的发射器发送出去，然后在1中进行接收

}
