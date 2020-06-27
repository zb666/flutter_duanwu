import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutterduanwu/dialog/custom_dialog.dart';
import 'package:flutterduanwu/init/init_helper.dart';
import 'package:flutterduanwu/pages/expand_page.dart';
import 'package:flutterduanwu/pages/index/home_page.dart';
import 'package:flutterduanwu/pages/index/home_page_widget.dart';
import 'package:flutterduanwu/pages/unlogin_page.dart';
import 'package:flutterduanwu/provider/cache_provider.dart';
import 'package:flutterduanwu/provider/currentIndex.dart';
import 'package:flutterduanwu/provider/global_provider.dart';
import 'package:flutterduanwu/provider/user_provider.dart';
import 'package:flutterduanwu/utils/nattery_utils.dart';
import 'package:provider/provider.dart';

void main() {
  var multiProvider = [
    UserProvider.instance,
    CurrentIndexProvider.instance
  ];
  GlobalInit.init()
    ..then((value) => runApp(MyApp()));
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.

  MyApp() {
    initDio();
  }

  @override
  Widget build(BuildContext context) {
    return MultiProvider(providers:[
      ChangeNotifierProvider.value(value: UserProvider.instance),
      ChangeNotifierProvider.value(value: CurrentIndexProvider.instance),
    ],child: MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: MyHomePage(title: 'Flutter Demo Home Page'),
      routes: {
        ExpandPage.ROUTE_NAME: (_) => ExpandPage()
      },
      onGenerateRoute: (RouteSettings settings) {
        String routeName = settings.name;
        print('RouteName:$routeName');
        return MaterialPageRoute(builder: (context) {
          return UnLoginPage();
        });
      },
    ));
  }
}

void initDio() {

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

  var list = ["首页", "分类", "购物车", "会员中心"];

  final List<BottomNavigationBarItem> bottomTabs = [
    BottomNavigationBarItem(icon: Icon(CupertinoIcons.home), title: Text('首页')),
    BottomNavigationBarItem(
        icon: Icon(CupertinoIcons.search), title: Text('分类')),
    BottomNavigationBarItem(
        icon: Icon(CupertinoIcons.shopping_cart), title: Text('购物车')),
    BottomNavigationBarItem(
        icon: Icon(CupertinoIcons.profile_circled), title: Text('会员中心')),
  ];

  final pageList = [HomePage(), HomePage(), HomePage(), HomePage()];

  TabController _tabController;

  @override
  void initState() {
    _tabController = TabController(length: list.length, vsync: this);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var currentIndex = Provider
        .of<CurrentIndexProvider>(context)
        .currentIndex;
    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(
        items: bottomTabs,
        type: BottomNavigationBarType.fixed,
        currentIndex: currentIndex,
      ),
      body: IndexedStack(
        index: currentIndex,
        children: pageList,
      ),
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
