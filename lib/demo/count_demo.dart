import 'dart:io';

import 'package:flutter/material.dart';
import 'package:path_provider/path_provider.dart';

void main(){
  runApp(FlieOperatorRoute());
}

class FlieOperatorRoute extends StatefulWidget {
  @override
  _FlieOperatorRouteState createState() => _FlieOperatorRouteState();
}

class _FlieOperatorRouteState extends State<FlieOperatorRoute> {

  int _counter = 0;

  @override
  void initState() {
    super.initState();
    _readCounter().then((value){
      setState(() {
        _counter = value;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(title: Text('计数器')),
        body: Container(
          child: Center(
            child: InkWell(
                onTap: (){
                  _incrementCount();
                },
                child: Text('$_counter')),
          ),
        ),
      ),
    );
  }

  Future<int> _readCounter() async{
    try {
      File file = await _getLocalFile();
      String contents = await file.readAsString();
      return int.parse(contents);
    } on FileSystemException{
      return 0;
    }
  }

  Future<File> _getLocalFile() async{
    String dir = (await getApplicationDocumentsDirectory()).path;
     var file = File('$dir/path.txt');
     return file;
  }

  void _incrementCount() {
    setState(() {
      _counter++;
    });
    _getLocalFile().then((file){
      file.writeAsStringSync("$_counter");
    });
  }

}
