import 'dart:html';

void main(){

  const keyCodes = [
    1,2,3,4,5
  ];

  Stream.fromIterable([1,2,3])
  .map((event) => '$event')
  .distinct()
  .listen((event) {
      print('event $event');
  });

}