import 'package:flutter/material.dart';

class FlexSpace extends StatelessWidget {

  final int size;

  final Widget child;


  FlexSpace(this.size, [this.child = const SizedBox()]);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      flex: size,
      child: child,
    );
  }
}
