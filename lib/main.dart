import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutterduanwu/dialog/custom_dialog.dart';
import 'package:flutterduanwu/init/init_helper.dart';
import 'package:flutterduanwu/pages/expand_page.dart';
import 'package:flutterduanwu/pages/unlogin_page.dart';
import 'package:flutterduanwu/provider/cache_provider.dart';
import 'package:flutterduanwu/utils/nattery_utils.dart';

void main() {
  GlobalInit.init()..then((value) => runApp(MyApp()));
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: MyHomePage(title: 'Flutter Demo Home Page'),
      routes: {ExpandPage.ROUTE_NAME: (_) => ExpandPage()},
      onGenerateRoute: (RouteSettings settings) {
        String routeName = settings.name;
        print('RouteName:$routeName');
        return MaterialPageRoute(builder: (context) {
          return UnLoginPage();
        });
      },
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage>
    with SingleTickerProviderStateMixin {
  var _battery = "0";

  var list = ["AAA", "BBB", "CCC"];

  TabController _tabController;

  @override
  void initState() {
    _tabController = TabController(length: list.length, vsync: this);
    super.initState();
  }

  void _incrementCounter() {}

  @override
  Widget build(BuildContext context) {
    // This method is rerun every time setState is called, for instance as done
    // by the _incrementCounter method above.
    //
    // The Flutter framework has been optimized to make rerunning build methods
    // fast, so that you can just rebuild anything that needs updating rather
    // than having to individually change instances of widgets.
    return Scaffold(
      appBar: AppBar(
        // Here we take the value from the MyHomePage object that was created by
        // the App.build method, and use it to set our appbar title.
        title: Text(widget.title),
        bottom: TabBar(
            controller: _tabController,
            tabs: list.map((e) => Tab(text: e)).toList()),
      ),
      body: TabBarView(
          controller: _tabController,
          children: list
              .map(
                (e) => GestureDetector(
                    onTap: _startJump,
                    child: Column(
                      children: [
                        GestureDetector(
                            onTap: _getBattery, child: Text('获取手机电量$_battery')),
                        LimitedBox(
                          maxWidth: 300,
                          maxHeight: 300,
                          child: Text('LimitBox'),
                        ),
                        Expanded(
                            child: Container(
                          color: Colors.blue,
                          child: Text('Container'),
                        ))
                      ],
                    )),
              )
              .toList()),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: Icon(Icons.add),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }

  void _performPop() {
    Navigator.of(context).pop();
  }

  void _startJump() {
    var argName = {"name": "ZB", "age": 27};
//    Navigator.of(context).pushNamed(ExpandPage.ROUTE_NAME, arguments: argName);
    var widgetList = [
      Row(
        children: [Flexible(child: Text('title')), Icon(Icons.close)],
      ),
    ];
    showCustomDialog(context, '这是标题', widgetList);
  }

  Future<Null> _getBattery() async {
    var map = {'MapKey': 'MapValue'};
    try {
      var value = await BatteryUtil.getBatteryLevel();
      setState(() {
        _battery = value;
      });
    } on PlatformException catch (e, s) {
      print(s);
    }
  }
}
