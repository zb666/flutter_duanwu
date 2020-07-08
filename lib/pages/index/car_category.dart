import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutterduanwu/model/category.dart';
import 'package:flutterduanwu/model/provider/count_model.dart';
import 'package:flutterduanwu/service/service_method.dart';
import 'package:provider/provider.dart';

class CarCategoryPage extends StatefulWidget {
  @override
  _CarCategoryPageState createState() => _CarCategoryPageState();
}

class _CarCategoryPageState extends State<CarCategoryPage> {

  int value = 0;

  List list = [];

  @override
  void initState() {
    super.initState();
    _getCategory();
    print('---initState---');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Container(
          color: Colors.red,
          child: Center(
              widthFactor: 3,
              child: Container(
                  color: Colors.white30,
                  child: Text('购物车'))),
        ),
      ),
      body: Stack(
        children: [
          ListView.builder(
              itemCount: 20,
              itemBuilder: (context, index) {
                return UnconstrainedBox(
                  child: Container(
                    margin: EdgeInsets.all(10),
                    width: 380,
                    height: 300,
                    decoration: BoxDecoration(
                      border: Border.all(width: 1,color: Colors.yellow),
                      borderRadius: BorderRadius.circular(10)
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text('title'),
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
                    )
                  ),
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
