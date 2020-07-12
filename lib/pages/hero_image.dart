import 'package:flutter/material.dart';

class HeroImageWidget extends StatelessWidget {
  static const ROUTE_NAME = '/HeroPage';

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          body: GestureDetector(
            onTap: () => Navigator.of(context).pop(),
            child: Container(
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.height * 0.5,
                child: Hero(
                    tag: 'commonTag',
                    child: Image.asset('assets/images/background_report.webp',fit: BoxFit.fitWidth,))),
          )),
    );
  }
}
