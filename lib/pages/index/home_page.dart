import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_easyrefresh/easy_refresh.dart';
import 'package:flutterduanwu/pages/index/home_page_widget.dart';
import 'package:flutterduanwu/service/service_method.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage>
    with AutomaticKeepAliveClientMixin {
  int page = 1;

  List<Map> goodsList = [];

  List<String> itemList = ["1", "2", "3", "4", "5", "6"];

  @override
  Widget build(BuildContext context) {
    var formData = {'lon': '115.02932', 'lat': '35.76189'};
    return Scaffold(
      appBar: AppBar(title: Text('百姓生活')),
      body: FutureBuilder(
        future: request('homePageContext', formData: formData),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            var dataJson = json.decode(snapshot.data.toString());
            List<Map> swiperDataList =
                (dataJson['data']['slides'] as List).cast();
            return EasyRefresh(
                child: ListView(
              children: [SwipeDiy(swiperDataList: swiperDataList)],
            ));
          } else {
            return Text('加载中');
          }
        },
      ),
    );
  }

  @override
  bool get wantKeepAlive => true;
}
