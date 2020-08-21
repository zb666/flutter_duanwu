import 'dart:io';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:network_to_file_image/network_to_file_image.dart';
import 'package:path/path.dart' as p;
import 'package:path_provider/path_provider.dart';

Directory _appDocsDir;

void main() async {
  // You should get the Application Documents Directory only once.
  WidgetsFlutterBinding.ensureInitialized();
  _appDocsDir = await getApplicationDocumentsDirectory();

  runApp(MaterialApp(home: Demo()));
}

File fileFromDocsDir(String filename) {
  String pathName = p.join(_appDocsDir.path, filename);
  return File(pathName);
}

const IMAGE_URL = "https://img3.dian.so/fox/2020/08/18/657FB1597730078.png";
class Demo extends StatelessWidget {
  @override
  Widget build(BuildContext context) => Scaffold(
    appBar: AppBar(title: const Text('NetworkToFileImage example')),
    body: Container(
        color: Colors.white,
        child: CachedNetworkImage(imageUrl: IMAGE_URL)),
  );
}