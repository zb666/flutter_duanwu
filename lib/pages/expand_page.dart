import 'package:flutter/material.dart';
import 'package:flutterduanwu/model/user_bean.dart';

class ExpandPage extends StatefulWidget {
  static const ROUTE_NAME = "Expand_Page_Route_Name";

  @override
  _ExpandPageState createState() => _ExpandPageState();
}

class _ExpandPageState extends State<ExpandPage> {
  @override
  Widget build(BuildContext context) {
    var args = ModalRoute.of(context).settings.arguments;
    var userModel = UserModel.fromJson(args);
    return Scaffold(
      appBar: AppBar(
        leading: Icon(Icons.close),
      ),
      body:SizedBox(),
    );
  }
}

