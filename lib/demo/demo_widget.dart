


import 'package:flutter/material.dart';


class DemoHomeWidget extends StatefulWidget {
  @override
  _DemoHomeWidgetState createState() => _DemoHomeWidgetState();

}

class _DemoHomeWidgetState extends State<DemoHomeWidget> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Flutter Demo'),
      ),
      body: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        alignment: Alignment.center,
        transform: Matrix4.skewX(90.0),
        child: ListView(
          children: List.generate(100, (index) => Center(
              child: Transform.translate(
                offset: Offset(150, 50),
                child: Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Transform.rotate(
                      angle: 180,
                      child: Text('index:$index',key: ValueKey(1),)),
                ),
              ))),
        ),
      ),
    );
  }
}
