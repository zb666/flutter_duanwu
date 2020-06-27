import 'package:flutter/material.dart';

class MineItem extends StatelessWidget {
  final String title;

  MineItem({@required this.title});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: ListTile(
        leading: Icon(Icons.title),
        title: Text('Horse Title'),
        subtitle: Text('Sub Title'),
        trailing: Icon(Icons.keyboard_arrow_right),
        onTap: (){
        },
      ),
    );
  }
}
