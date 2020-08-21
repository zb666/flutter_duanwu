import 'dart:async';
import 'dart:convert';
import 'dart:io';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_cache_manager/flutter_cache_manager.dart';
import 'package:flutter_easyrefresh/easy_refresh.dart';
import 'package:flutterduanwu/constant/assets.dart';
import 'package:flutterduanwu/pages/common/common_image.dart';
import 'package:flutterduanwu/pages/index/home_page_widget.dart';
import 'package:flutterduanwu/service/service_method.dart';

import '../hero_image.dart';

typedef Callback = int Function(String name);

class HomePage extends StatefulWidget {
  bool isExpand = false;

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage>
    with AutomaticKeepAliveClientMixin {
  int page = 1;

  List<Map> goodsList = [];

  List<String> itemList = ["1", "2", "3", "4", "5", "6"];

  var streamController = StreamController<List<String>>();

  @override
  void initState() {
    super.initState();
//    streamController.sink.add(event)
//    streamController.stream.listen((event) {
//
//    });

    onResume(1, 'gender', (name) => name.hashCode);
  }

  void onResume(int name, String gender, Callback callback) {
    int result = callback.call(gender);
    print('Result:$name $result');
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);
    var formData = {'lon': '115.02932', 'lat': '35.76189'};
    return Scaffold(
      appBar: AppBar(
          title: InkWell(
              onTap: () {
                loadFile();
              },
              child: Text('百姓生活')),
          backgroundColor: Theme.of(context).highlightColor),
      body: ListView(
        shrinkWrap: true,
        children: [
          Image(
              image: CachedNetworkImageProvider(
                  'http://img3.dian.so/lhc/2019/11/13/1080w_2244h_DF87D1573635417.png',
              )),
          Container(
              height: 500,
              width: double.infinity,
              child: Image.network(
                  'http://img3.dian.so/lhc/2019/11/13/1080w_2244h_DF87D1573635417.png')),
          Chip(
            label: Text('Label 文字'),
            backgroundColor: Colors.cyan,
            avatar: Icon(Icons.clear, color: Colors.black12),
            labelPadding: EdgeInsets.fromLTRB(2.0, 0.0, 2.0, 0.0),
          ),
          AspectRatio(
              aspectRatio: 16 / 9,
              child: DecoratedBox(
                  decoration: BoxDecoration(color: Colors.greenAccent),
                  child: Center(child: Text('AAA')))),
          Column(
            children: [
              InkWell(
                  onTap: () => Navigator.of(context)
                      .pushNamed(HeroImageWidget.ROUTE_NAME),
                  child: SizedBox(
                      width: 50,
                      height: 50,
                      child: Hero(
                          tag: 'commonTag',
                          child: Image.asset(
                              'assets/images/background_report.webp')))),
              CommonImage.asset('assets/images/ic_report_diadema.svg'),
              Container(
                margin: const EdgeInsets.only(top: 30),
                alignment: Alignment.center,
                width: MediaQuery.of(context).size.width,
                height: 200,
                decoration: BoxDecoration(
                    color: Colors.yellow,
                    border: Border.all(color: Colors.red)),
                child: SizedBox(
                  child: InkWell(
                      onTap: () {
                        setState(() {
                          var isExpand = widget.isExpand;
                          widget.isExpand = isExpand;
                          streamController.sink.add(['1']);
                          streamController.add(['A', 'B', 'C']);
                        });
                      },
                      child: Text('点击改变')),
                ),
              ),
              GridView.count(
                crossAxisCount: 5,
                scrollDirection: Axis.vertical,
                shrinkWrap: true,
                childAspectRatio: 1.0,
                crossAxisSpacing: 10,
                children: List.generate(
                    5,
                    (index) => Container(
                          color: Colors.red,
                          alignment: Alignment.center,
                          child: Text('$index'),
                        )),
              ),
//              AnimWidget()
            ],
          ),
        ],
      ),
    );
  }

  var cachedUrl =
      "http://img3.dian.so/lhc/2019/11/13/1080w_2244h_DF87D1573635417.png";

  @override
  bool get wantKeepAlive => true;

  void loadFile() async {}
}

class AnimWidget extends StatefulWidget {
  bool isExpand = false;

  @override
  _AnimWidgetState createState() => _AnimWidgetState();
}

class _AnimWidgetState extends State<AnimWidget> {
  bool isFirst = false;

  @override
  Widget build(BuildContext context) {
    return AnimatedCrossFade(
        firstCurve: Curves.easeInCirc,
        secondCurve: Curves.easeInToLinear,
        sizeCurve: Curves.bounceOut,
        firstChild: Container(
          child: InkWell(
              onTap: () {
                setState(() {
                  isFirst = !isFirst;
                });
              },
              child: Text(
                '改变',
                style: TextStyle(fontSize: 20),
              )),
        ),
        secondChild: GridView.count(
            shrinkWrap: true,
            padding: EdgeInsets.all(10),
            physics: NeverScrollableScrollPhysics(),
            crossAxisCount: 4,
            crossAxisSpacing: 10,
            mainAxisSpacing: 10,
            scrollDirection: Axis.vertical,
            childAspectRatio: 1 / 2,
            children: List.generate(4, (index) => index)
                .map((e) => Container(
                      color: Colors.yellow,
                      child: Center(
                          child: Column(
                        children: [
                          Image.asset(Images.headbandDevice),
                          Text('innerText'),
                          if (e == 2)
                            Expanded(
                                child: InkWell(
                              onTap: () {
                                setState(() {
                                  isFirst = !isFirst;
                                });
                              },
                              child: Text('innerTextAAAAAAAAAAAAAa改变数据',
                                  textAlign: TextAlign.center),
                            ))
                        ],
                      )),
                    ))
                .toList()),
        crossFadeState:
            isFirst ? CrossFadeState.showSecond : CrossFadeState.showFirst,
        duration: Duration(milliseconds: 1500));
  }
}
