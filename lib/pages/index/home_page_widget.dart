import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_swiper/flutter_swiper.dart';
import 'package:flutterduanwu/provider/currentIndex.dart';
import 'package:provider/provider.dart';

class SwipeDiy extends StatelessWidget {

  final List swiperDataList;

  SwipeDiy({Key key, this.swiperDataList}) :super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        color: Colors.white,
        height: 100,
        child: Swiper(
            pagination: SwiperPagination(),
            autoplay: true,
            itemCount: swiperDataList.length, itemBuilder: (context, index) {
          return InkWell(
            onTap: (){
              Provider.of<CurrentIndexProvider>(context).changeIndex(2);
            },
            child: Image.network(
                "${swiperDataList[index]['image']}", fit: BoxFit.fill),
          );
        }
        ));
  }
}
