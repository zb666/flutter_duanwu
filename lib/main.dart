import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutterduanwu/init/init_helper.dart';
import 'package:flutterduanwu/pages/expand_page.dart';
import 'package:flutterduanwu/pages/index/car_category.dart';
import 'package:flutterduanwu/pages/index/home_page.dart';
import 'package:flutterduanwu/pages/index/mine_page.dart';
import 'package:flutterduanwu/pages/unlogin_page.dart';
import 'package:flutterduanwu/provider/currentIndex.dart';
import 'package:flutterduanwu/provider/user_provider.dart';
import 'package:provider/provider.dart';

void main() {
  var multiProvider = [UserProvider.instance, CurrentIndexProvider.instance];
  GlobalInit.init()..then((value) => runApp(MyApp()));
  [1, 2, 3, 4, 5, 3, 2].forEach((element) {
    var errorMsg = getMemberTips(element);
    print(errorMsg);
  });

  var demo = ChainTest()
    ..name = 'Bob'
    ..age = 1;

  print(demo.toString());


}



class ChainTest {
  var name = '';
  var age = 123;

  @override
  String toString() {
    return 'ChainTest{name: $name, age: $age}';
  }

}

class DemoStream{

}

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
    return MultiProvider(
        providers: [
          ChangeNotifierProvider.value(value: UserProvider.instance),
          ChangeNotifierProvider.value(value: CurrentIndexProvider.instance),
        ],
        child: MaterialApp(
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
        ));
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

  final _pageList = [HomePage(), MinePage(), CarCategoryPage(), MinePage()];

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
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
