import 'package:flutter/material.dart';
import 'package:flutterduanwu/pages/demo/multi_demo_page.dart';
import 'package:flutterduanwu/pages/mine/mine_item.dart';
import 'package:flutterduanwu/pages/multi_widget.dart';

import '../hero_image.dart';

class MinePage extends StatelessWidget {

  List<String> get _itemList {
    return ['优惠券', '会员中心', '历史记录'];
  }

  set itemList(List<String> list){
    itemList = list;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('会员中心')),
      body: Container(
        child: ListView(
          shrinkWrap: true,
          children: [
            CustomMultiRenderDemoPage(),
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
        ),
      ),
    );
  }

  _generateItem(List<String> itemList) {
    return itemList.map((e) => MineItem(title: e)).toList();
  }
}
