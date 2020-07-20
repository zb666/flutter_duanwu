import 'package:flutter/material.dart';

class CustomMultiPageDelegate extends MultiChildLayoutDelegate {
  final layoutId = ['AAA', 'BBB', "CCC", 'DDD', 'EEE'];

  @override
  void performLayout(Size size) {
    for (int i = 0; i < 5; i++) {
      var text = Text('当前数据: $i');
      //测量
      layoutChild(text, BoxConstraints.loose(Size(50, 50)));
      //摆放
      positionChild(text, Offset(i * 100.0, i * 100.0));
    }
  }

  @override
  bool shouldRelayout(MultiChildLayoutDelegate oldDelegate) {
    return false;
  }
}

class MulDemo extends StatefulWidget {
  final layoutId = ['AAA', 'BBB', "CCC", 'DDD', 'EEE'];

  @override
  _MulDemoState createState() => _MulDemoState();
}

class _MulDemoState extends State<MulDemo> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: CustomMultiChildLayout(
          delegate: CustomMultiPageDelegate(),
          children: widget.layoutId
              .map((e) => SizedBox(
                    width: 100,
                     height: 100,
                     child: Text(e, style: const TextStyle(color: Colors.greenAccent))
                  ))
              .toList()),
    );
  }
}
