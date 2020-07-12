import 'package:flutter/src/widgets/framework.dart';
import 'package:provider/provider.dart';
import 'package:provider/single_child_widget.dart';

class BobConsumer<T> extends SingleChildStatelessWidget {

  //Provider给与值->回调给外界->返回Child(用T类型数据构建出来的Widget)
  final Widget Function(BuildContext context, T value, Widget child) builder;

  final Widget child;

  BobConsumer({Key key, @required this.builder, this.child})
      : assert(builder != null),
        super(key: key);

  @override
  Widget buildWithChild(BuildContext context, Widget child) {
    return builder(
      context,
      Provider.of<T>(context),
      child
    );
  }
}
