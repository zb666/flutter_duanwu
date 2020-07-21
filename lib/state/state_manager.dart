import 'package:flutter/material.dart';


class ShareDataWidget extends InheritedWidget {
  final int count;

  //为父类提供构造函数所需要的数据
  ShareDataWidget({@required this.count, Widget child}) : super(child: child);

  //方便共享数据
  static ShareDataWidget of(BuildContext context) {
    return context.dependOnInheritedWidgetOfExactType<ShareDataWidget>();
  }

  @override
  bool updateShouldNotify(ShareDataWidget oldWidget) {
    //invoke => Widget->state.didChangeDependencies
    return oldWidget.count != count;
  }
}

class _TestWidget extends StatefulWidget {
  @override
  __TestWidgetState createState() => __TestWidgetState();
}

class __TestWidgetState extends State<_TestWidget> {
  @override
  Widget build(BuildContext context) {
    return Text(ShareDataWidget.of(context).count.toString());
  }

  @override
  void didChangeDependencies() {
    print('父或者祖节点InheritedWidget改变 导致调用该InheritedWidget');
    super.didChangeDependencies();
  }
}

class InheritedWidgetTestRoute extends StatefulWidget {
  @override
  _InheritedWidgetTestRouteState createState() =>
      _InheritedWidgetTestRouteState();
}

class _InheritedWidgetTestRouteState extends State<InheritedWidgetTestRoute> {
  int count = 0;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: ShareDataWidget(
          count: count,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Padding(padding: const EdgeInsets.all(20), child: _TestWidget()),
              //TestWidget的祖节点必须包括ShareDataWidget
              RaisedButton(onPressed: () {
                setState(() {
                  ++count;
                });
              })
            ],
          )), //作为祖节点通知孙节点
    );
  }
}


void main()=>runApp(MaterialApp(home: Scaffold(
  body: InheritedWidgetTestRoute(),
)));