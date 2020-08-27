

import 'dart:isolate';

import  'package:cached_network_image/cached_network_image.dart' as imgdart;
import  'package:flutter/material.dart';

const String img_url = 'https://img3.dian.so/fox/2020/08/18/657FB1597730078.png';

void main(){
  runApp(MaterialApp(
    home: Scaffold(
      appBar: AppBar(
        title: Text('磁盘缓存'),
      ),
      body: Container(
        child: imgdart.CachedNetworkImage(imageUrl: img_url),
      ),
    ),
  ));
}