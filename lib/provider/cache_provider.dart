import 'package:flutter/material.dart';

class MyImage extends StatefulWidget {

  static const ROUTE_NAME = 'my_image';

  String title = "title";

  final ImageProvider imageProvider;


  MyImage({Key key,this.imageProvider}):assert(imageProvider!=null),super(key: key);

  @override
  _MyImageState createState() => _MyImageState();


}

class _MyImageState extends State<MyImage> {

  ImageStream _imageStream;
  ImageInfo _imageInfo;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();

  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Text(widget.title),
    );
  }
}
