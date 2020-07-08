import 'package:flutter/material.dart';
import 'package:flutterduanwu/pages/mine/mine_item.dart';

class MinePage extends StatelessWidget {
  List<String> _itemList = ['优惠券', '会员中心', '历史记录'];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('会员中心')),
      body: ListView(
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
          Column(
            children: _generateItem(_itemList),
          ),
          Row(
            children: [
              Text('Left Title'),
              Expanded(child: Container(
                color: Colors.red,
                child: Center(child: Text('Center')),
              ))
            ],
          ),
          Align(
            alignment: Alignment.topRight,
            child: Container(
                child: Text('aaaaa')),
          )
        ],
      ),
    );
  }

  _generateItem(List<String> itemList) {
    return itemList.map((e) => MineItem(title: e)).toList();
  }

}
