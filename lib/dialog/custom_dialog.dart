import 'package:flutter/material.dart';

class CustomDialog extends Dialog {
  final String title;

  final List<Widget> actions;

  CustomDialog({Key key, @required this.title, this.actions}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Material(
      type: MaterialType.transparency,
      child: Center(
        child: Container(
          height: 300,
          width: 300,
          color: Colors.white,
          child: Column(
            children: actions,
          ),
        ),
      ),
    );
  }

}

void showCustomDialog(
    BuildContext buildContext, String title, List<Widget> childWidget) {
  showDialog(
      context: buildContext,
      barrierDismissible: true,
      builder: (context) {
        return CustomDialog(title: title, actions: childWidget);
      });
}
