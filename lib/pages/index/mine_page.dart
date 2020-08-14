
import 'package:flutter/material.dart';
import 'package:flutterduanwu/pages/mine/mine_item.dart';
import 'package:flutterduanwu/pages/multi_widget.dart';

import '../hero_image.dart';

class MinePage extends StatelessWidget {

  ScrollController _controller = ScrollController()..addListener(() {
  });

  List<String> get _itemList {
    return ['优惠券', '会员中心', '历史记录'];
  }

  set itemList(List<String> list) {
    itemList = list;
  }

  @override
  Widget build(BuildContext context) {
    NotificationListener(child: null);
    return Scaffold(
      appBar: AppBar(title: Text('会员中心')),
      body: NotificationListener(
        onNotification: (ScrollNotification scrollNotification){
          if(scrollNotification is ScrollEndNotification){

          }
          return false;
        },
        child: Container(
          child: NestedScrollView(
            headerSliverBuilder: (BuildContext context,isScroll){
              return [
                SliverAppBar(
                  title: const Text('Floating Nested SliverAppBar'),
                  floating: true,
                  expandedHeight: 200.0,
                  forceElevated: isScroll,
                )
              ];
            },
            body: ListView(
              shrinkWrap: true,
              controller: _controller,
              children: [
                Center(
                  child: Container(
                    height: 100,
                    color: Colors.lightBlueAccent,
                    alignment: Alignment.center,
                    child: ClipOval(
                      child: Container(
                        width: 30,
                        height: 30,
                        color: Colors.red,
                      ),
                    ),
                  ),
                ),
                CircularProgressIndicator(),
                Theme(
                    data: Theme.of(context).copyWith(),
                    child: Row(
                      children: [
                        RotatedBox(
                            quarterTurns: 2,
                            child: FlatButton(onPressed: () {}, child: Text('店铺信息主题')))
                      ],
                    )),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 30),
                  child: Transform(
                    transform: Matrix4.identity()
                      ..setEntry(3, 2, 0.006)
                      ..rotateX(90 / 4),
                    alignment: Alignment.bottomCenter,
                    child: ClipRRect(
                      borderRadius: BorderRadius.all(Radius.circular(8)),
                      child: Container(
                          color: Colors.cyanAccent, child: Text('AAAAAA \n AAAAA')),
                    ),
                  ),
                ),
                Column(
                  children: _generateItem(_itemList),
                ),
                Row(
                  children: [
                    Text('Left Title'),
                    Expanded(
                        child: Container(
                          color: Colors.red,
                          child: Center(child: Text('Center')),
                        ))
                  ],
                ),
//            InkWell(
//              onTap: () {
//                Navigator.of(context).pushNamed(HeroImageWidget.ROUTE_NAME);
//              },
//            ),
                MulDemo(),
                InkWell(
                    onTap: () =>
                        Navigator.of(context).pushNamed(HeroImageWidget.ROUTE_NAME),
                    child: Center(
                        child: Text(
                          '点击进行跳转',
                          style: TextStyle(fontSize: 30, color: Colors.greenAccent),
                        ))),
              ],
            )
          ),
        ),
      ),
    );
  }

  _generateItem(List<String> itemList) {
    return itemList.map((e) => MineItem(title: e)).toList();
  }
}

class ThemeData {
  final String name;

  ThemeData.name({@required this.name});

  ThemeData copyWith({String passedName}) {
    //重新构造出一个属性
    return ThemeData.name(name: name);
  }
}
