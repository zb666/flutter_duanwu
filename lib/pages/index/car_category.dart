import 'package:flutter/material.dart';

class CarCategoryPage extends StatefulWidget {
  @override
  _CarCategoryPageState createState() => _CarCategoryPageState();
}

class _CarCategoryPageState extends State<CarCategoryPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('购物车'),
      ),
      body: Stack(
        children: [
          ListView.builder(
              itemCount: 20,
              itemBuilder: (context, index) {
                return Container(
                  margin: EdgeInsets.all(10),
                  height: 300,
                  color: Colors.orange,
                  child: Text('Center'),
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
                      child: Container(
                        alignment: Alignment.center,
                        color: Colors.red,
                        child: Text('11111'),
                      ),
                    ),
                    Flexible(
                      child: Container(
                        alignment: Alignment.center,
                        color: Colors.yellow,
                        child: Text('22222'),
                      ),
                    )
                  ],
                ),
              ))
        ],
      ),
    );
  }
}
