import 'package:flutter/material.dart';

class DemoBuilder extends StatelessWidget {

  final WidgetBuilder widgetBuilder;

  DemoBuilder({Key key,this.widgetBuilder}):assert(widgetBuilder!=null),super(key: key);

  @override
  Widget build(BuildContext context) {
    return widgetBuilder(context);
  }

}
