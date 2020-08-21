import 'dart:io';
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

class Demo extends StatelessWidget {
  @override
  Widget build(BuildContext context) => Scaffold(
    appBar: AppBar(title: const Text('NetworkToFileImage example')),
    body: Padding(
      padding: const EdgeInsets.all(30.0),
      child: Image(
        image: NetworkToFileImage(
          url: "http://img3.dian.so/lhc/2019/11/13/1080w_2244h_DF87D1573635417.png",
          file: fileFromDocsDir("flutter.png"),
          debug: true,
        ),
      ),
    ),
  );
}
