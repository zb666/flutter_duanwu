import 'package:flutterduanwu/service/goods_provider.dart';

void main() {
//  var stream = Stream<String>.fromFuture(getData());
////
////  stream.listen((event) {
////    print('async stream value: $event');
////  });
////
//////
////  Stream<int> streamPeriod =
////      Stream<int>.periodic(Duration(seconds: 1), (data) => data);
////  streamPeriod.expand((element) => [element, element])
//////      .map((event) => 'Mapped: $event')
////      .listen((event) {
////    print('stream period: $event');
////  });

     GoodsItemProvider().addListener(() {

     });

}

Future<String> getData() async {
  await Future.delayed(Duration(seconds: 5));
  return "Future对象创建完毕";
}
