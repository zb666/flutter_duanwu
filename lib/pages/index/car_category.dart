import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutterduanwu/model/category.dart';
import 'package:flutterduanwu/model/provider/count_model.dart';
import 'package:flutterduanwu/service/service_method.dart';
import 'package:provider/provider.dart';

import '../../testFile.dart';

class CarCategoryPage extends StatefulWidget {
  @override
  _CarCategoryPageState createState() => _CarCategoryPageState();
}

class _CarCategoryPageState extends State<CarCategoryPage> {
  int value = 0;

  List list = [];

  GlobalKey<_CarCategoryPageState> globalKey = new GlobalKey();

  @override
  void initState() {
    super.initState();
    _getCategory();
    print('---CarCategoryPage initState--- $context  ${context == null}');
    Future.delayed(Duration(seconds: 0), () {});
    var dio = DioTest();
    var dio2 = DioTest();
    print('Result: ${identical(dio2, dio)}');
  }

  @override
  void reassemble() {
    //Debug模式下状态发生改变
    super.reassemble();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Container(
          color: Colors.red,
          child: Center(
              widthFactor: 3,
              child: Container(color: Colors.white30, child: Text('购物车'))),
        ),
      ),
      body: Stack(
        key: globalKey,
        children: [
          ListView.builder(
              itemCount: 20,
              itemBuilder: (context, index) {
                return UnconstrainedBox(
                  child: Container(
                      margin: EdgeInsets.all(10),
                      width: 350,
                      height: 300,
                      decoration: BoxDecoration(
                        border: Border.all(color: Colors.green, width: 2),
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          InkWell(
                            child: Container(
                              child: Text('title'),
                              decoration: BoxDecoration(
                                boxShadow: [
                                  BoxShadow(
                                      color: Colors.red,
                                      blurRadius: 2.0,
                                      spreadRadius: 5.0,
                                      offset: Offset(1.0, 1.0))
                                ],
                                color: Colors.blueAccent,
                              ),
                              padding: EdgeInsets.all(10.0),
                            ),
                            onTap: () {
                              globalKey.currentState._getCategory();
                            },
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Padding(
                                padding: const EdgeInsets.all(20),
                                child: Text('start'),
                              ),
                              Padding(
                                padding: const EdgeInsets.all(20),
                                child: Row(
                                  children: [
                                    Text('aaa'),
                                    SizedBox(width: 10),
                                    Text('bbb')
                                  ],
                                ),
                              )
                            ],
                          )
                        ],
                      )),
                );
              }),
          Positioned(
              bottom: 0,
              left: 0,
              right: 0,
              child: Container(
                color: Colors.white,
                height: 50,
                child: Row(
                  children: [
                    Container(margin: EdgeInsets.all(10), child: Text('购物车')),
                    Flexible(
                      child: Consumer<CounterModelProvider>(
                        builder: (_, countModel, __) {
                          return Container(
                            alignment: Alignment.center,
                            color: Colors.red,
                            child: Text('改变了数据${countModel.count}'),
                          );
                        },
                      ),
                    ),
                    Flexible(
                      child: Container(
                        alignment: Alignment.center,
                        color: Colors.yellow,
                        child: InkWell(
                            onTap: () {
                              Provider.of<CounterModelProvider>(context,
                                      listen: false)
                                  .count = 10;
                            },
                            child: Text('改变数据')),
                      ),
                    )
                  ],
                ),
              ))
        ],
      ),
    );
  }

  //得到后台大类数据
  void _getCategory() async {
    await request('getCategory').then((val) {
      var data = json.decode(val.toString());
      print(data);
      CategoryModel category = CategoryModel.fromJson(data);

      setState(() {
        list = category.data;
      });
      //print(list[0].bxMallSubDto);

      //list[0].bxMallSubDto.forEach((item) => print(item.mallSubName));
    });
  }
}
