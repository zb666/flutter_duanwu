import 'package:flutter/material.dart';

class MineItem extends StatelessWidget {
  final String title;

  MineItem({@required this.title});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          Row(
            children: [
              Text('购物车'),
              Flexible(child: Container(
                alignment: Alignment.center,
                child: Text('AAA'),
                color: Colors.red,
              )),
              Flexible(child: Container(
                alignment: Alignment.center,
                child: Text('BBB'),
                color: Colors.yellow,
              )),
            ],
          ),
          ListTile(
            leading: Icon(Icons.title),
            title: Text('Horse Title'),
            subtitle: Text('Sub Title'),
            trailing: Icon(Icons.keyboard_arrow_right),
            onTap: () {},
          )
        ],
      ),
    );
  }
}
