

import 'package:flutter/material.dart';

void main(){
  MaterialApp(
    home: RepaintBoundary(
      child: Column(
        children: [
          NotificationListener(child: null,onNotification: (ScrollNotification notification){
            var scrollMetrics = notification.metrics;
            if(notification is ScrollEndNotification){
              //滚动结束的时候去加载数据
              return false;
            }
            return false;
          }),
          CustomPaint(
            painter: AnimCustom(),
          ),
        ],
      ),
    ),
  );
}

class AnimCustom extends CustomPainter{
  @override
  void paint(Canvas canvas, Size size) {
    // TODO: implement paint
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    // TODO: implement shouldRepaint
    throw UnimplementedError();
  }

}

class Demo extends RepaintBoundary{

}