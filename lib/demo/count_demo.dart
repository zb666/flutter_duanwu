import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:path_provider/path_provider.dart';

final Provider<String> helloProvider = Provider((ref) => 'Hello World');

void main() {
  runApp(ProviderScope(child: FlieOperatorRoute()));
}

class FlieOperatorRoute extends StatefulWidget {
  @override
  _FlieOperatorRouteState createState() => _FlieOperatorRouteState();
}

class _FlieOperatorRouteState extends State<FlieOperatorRoute> {
  int _counter = 0;

  int _curStep = 0;

  var list = {"1111", "22222", "33333"};

  final steps = [
    Step(
        title: Text('11111'),
        content: Container(height: 60, width: 60, child: Text('1111111111'))),
    Step(
        title: Text('22222'),
        content: Container(height: 60, width: 60, child: Text('2222222222'))),
    Step(
        title: Text('33333'),
        content: Container(height: 60, width: 60, child: Text('3333333333')))
  ];

  @override
  void initState() {
    super.initState();
    _readCounter().then((value) {
      setState(() {
        _counter = value;
      });
    });
    print('initState');
  }

  @override
  void deactivate() {
    super.deactivate();
    print('deactivate');
  }

  @override
  void dispose() {
    super.dispose();
    print('dispose');
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    print('didChangeDependencies');
  }

  @override
  void didUpdateWidget(FlieOperatorRoute oldWidget) {
    super.didUpdateWidget(oldWidget);
    print("FileOperatorRouteState: $didUpdateWidget");
  }

  @override
  Widget build(BuildContext context) {
    print('build');
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(title: Text('计数器')),
        body: Container(
          child: ListView(
            shrinkWrap: true,
            children: [
              InkWell(
                  onTap: (){
                    setState(() {
                      if(++_curStep==3){
                        _curStep = 0;
                      }
                    });
                  },
                  child: Text('点击后更新位置')),
              Stepper(
                  currentStep: _curStep,
                  type: StepperType.vertical,
                  steps: steps,
                  controlsBuilder: _builder
              )
            ],
          ),
        ),
      ),
    );
  }

  Future<int> _readCounter() async {
    try {
      File file = await _getLocalFile();
      String contents = await file.readAsString();
      return int.parse(contents);
    } on FileSystemException {
      return 0;
    }
  }

  Future<File> _getLocalFile() async {
    String dir = (await getApplicationDocumentsDirectory()).path;
    var file = File('$dir/path.txt');
    return file;
  }

  void _incrementCount() {
    setState(() {
      _counter++;
    });
    _getLocalFile().then((file) {
      file.writeAsStringSync("$_counter");
    });
  }

  Widget _builder(BuildContext context, {onStepCancel, onStepContinue}) {
    return Row(
      children: [
        RaisedButton(onPressed: null,child: Icon(Icons.check)),
        RaisedButton(onPressed: null,child: Icon(Icons.edit)),
        RaisedButton(onPressed: null,child: Icon(Icons.cancel)),
      ],
    );
  }
}

class MyUpdateWidget extends ConsumerWidget {
  @override
  Widget build(BuildContext context,
      T Function<T>(ProviderBase<Object, T> provider) watch) {
    final String value = watch(helloProvider);
    return Container(
      child: Text('$value'),
    );
  }
}

class _MyUpdateWidgetState extends State<MyUpdateWidget> {
  @override
  void didUpdateWidget(MyUpdateWidget oldWidget) {
    super.didUpdateWidget(oldWidget);
    print("MyUpdateWidgetState: $didUpdateWidget");
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Text('My Update'),
    );
  }
}
