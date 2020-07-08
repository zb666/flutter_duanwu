import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class CommonImage extends StatelessWidget {
  final String asset;

  final double width;

  final double height;

  final BoxFit fit;

  final Color color;

  CommonImage.asset(this.asset, {this.width, this.height, this.fit = BoxFit.cover, this.color});

  @override
  Widget build(BuildContext context) {
    return asset.endsWith('.svg') ?
    SvgPicture.asset(
        asset,
        width: width,
        height: height,
        fit: fit,
        color: color) :
    Image.asset(
        asset,
        width: width,
        height: height,
        fit: fit,
        color: color);
  }

}
