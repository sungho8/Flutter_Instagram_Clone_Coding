import 'package:flutter/material.dart';
import 'package:get/route_manager.dart';

class ImageData extends StatelessWidget {
  final String path;
  final double width;

  const ImageData({super.key, required this.path, this.width = 70});

  @override
  Widget build(BuildContext context) {
    return Image.asset(
      path,
      width: width / Get.mediaQuery.devicePixelRatio,
    );
  }
}
