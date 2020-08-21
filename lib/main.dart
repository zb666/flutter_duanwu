import 'dart:async';
import 'dart:convert';
import 'dart:isolate';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/services.dart';
import 'package:flutterduanwu/env/env_config.dart';
import 'package:flutterduanwu/init/init_helper.dart';
import 'package:flutterduanwu/model/provider/count_model.dart';
import 'package:flutterduanwu/pages/demo/multi_demo_page.dart';
import 'package:flutterduanwu/pages/expand_page.dart';
import 'package:flutterduanwu/pages/hero_image.dart';
import 'package:flutterduanwu/pages/index/car_category.dart';
import 'package:flutterduanwu/pages/index/home_page.dart';
import 'package:flutterduanwu/pages/index/mine_page.dart';
import 'package:flutterduanwu/pages/index/selector_page.dart';
import 'package:flutterduanwu/pages/provider/common_modify_provider.dart';
import 'package:flutterduanwu/pages/unlogin_page.dart';
import 'package:flutterduanwu/provider/currentIndex.dart';
import 'package:flutterduanwu/provider/user_provider.dart';
import 'package:provider/provider.dart';

void main() async{

  WidgetsFlutterBinding.ensureInitialized();
  var loadString = await rootBundle.loadString('assets/json/config_json.json');
  var configMap = json.decode(loadString);
  var configBean = EnvConfig.fromJson(configMap);
  GlobalInit.init()
    .then((value) => runApp(MultiProvider(providers: [
          ChangeNotifierProvider(create: (_) => UserProvider.instance),
          ChangeNotifierProvider(create: (_) => CurrentIndexProvider.instance),
          ChangeNotifierProvider(create: (_) => CounterModelProvider.instance),
          ChangeNotifierProvider(create: (_) => CommonModifyProvider.instance),
        ], child: MyApp())));

  [1, 2, 3, 4, 5, 3, 2].forEach((element) {
    var errorMsg = getMemberTips(element);
    print(errorMsg);
  });

  var demo = ChainTest()
    ..name = 'Bob'
    ..age = 123;

  print(demo.toString());

  Future.microtask(() => null);

  buildHouse('aa', 10, 'sex');
//  buildHouse(10);

//  buildHouse('aaa','sex');

    startSpawn();

}

void startSpawn() async{
  final receive = ReceivePort();
  Isolate isolate = await Isolate.spawn(runTimer, receive.sendPort);
  receive.listen((message) {
    //ReceivePort将自己的发射器发送出去，让对方可以拿着自己的发射器发送消息，
    //然后可以在自己的ReceivePort的Listen回调中获取到该数据
    print('receive data from $message');
  });

}

void runTimer(SendPort sendPort){
  sendPort.send('notification message');
}

void buildHouse(String name, [int age, String sex]) {
  print('$name $age $sex');
}

class ChainTest {
  var name = '';
  var age = 123;

  @override
  String toString() {
    return 'ChainTest{name: $name, age: $age}';
  }
}

class DemoStream {}

String getMemberTips(int state) {
  switch (state) {
    case 1:
    case 3:
      return '"您已是骑手会员，请勿重复购买';
    case 2:
    case 4:
      return "您已是尊享会员，请勿重复购买";
    default:
      return "Default Value";
  }
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.

  MyApp() {
    initDio();
  }

  //上下文BuildContext
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: Theme.of(context),
      home: MyHomePage(title: 'Flutter Demo Home Page'),
      routes: {
        ExpandPage.ROUTE_NAME: (_) => ExpandPage(),
        HeroImageWidget.ROUTE_NAME: (_) => HeroImageWidget()
      },
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

void initDio() {}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage>
    with SingleTickerProviderStateMixin {
  var _battery = "0";

  var list = ["首页", "分类", "购物车", "会员中心", "选择器",'CustomPage'];

  final List<BottomNavigationBarItem> bottomTabs = [
    BottomNavigationBarItem(icon: Icon(CupertinoIcons.home), title: Text('首页')),
    BottomNavigationBarItem(
        icon: Icon(CupertinoIcons.search), title: Text('分类')),
    BottomNavigationBarItem(
        icon: Icon(CupertinoIcons.shopping_cart), title: Text('购物车')),
    BottomNavigationBarItem(
        icon: Icon(CupertinoIcons.profile_circled), title: Text('会员中心')),

    BottomNavigationBarItem(
        icon: Icon(CupertinoIcons.reply), title: Text('选择器')),
    BottomNavigationBarItem(
        icon: Icon(CupertinoIcons.battery_75_percent), title: Text('自定义')),
  ];

  final _pageList = [
    MinePage(),
    CarCategoryPage(),
    MinePage(),
    SelectorPage(),
    CustomMultiRenderDemoPage()
  ];

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    setState(() {

    });
    var currentIndex = Provider.of<CurrentIndexProvider>(context).currentIndex;
    print('curIndex: $currentIndex');
    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(
        items: bottomTabs,
        type: BottomNavigationBarType.fixed,
        currentIndex: currentIndex,
        onTap: _onItemSelected,
      ),
      body: IndexedStack(
        index: currentIndex,
        children: _pageList,
      ),
    );
  }

  void _onItemSelected(int value) {
    Provider.of<CurrentIndexProvider>(context, listen: false)
        .changeIndex(value);
  }
}


class ThemeBean{

  final String name;

  ThemeBean.name({@required this.name});

  ThemeBean copyWith({String passedName}){ //重新构造出一个属性
    return ThemeBean.name(name: name);
  }

}

