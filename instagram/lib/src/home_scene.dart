import 'dart:math';

import 'package:flutter/material.dart';
import 'package:instagram/items/image_data.dart';
import 'package:instagram/paths/image_path.dart';

class HomeScene extends StatelessWidget {
  const HomeScene({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: CustomScrollView(
          slivers: [
            _appBar(),
          ],
        ),
      ),
    );
  }

  Widget _appBar() {
    return SliverAppBar(
      backgroundColor: Colors.white,
      flexibleSpace: FlexibleSpaceBar(
        background: Container(
          color: Colors.white,
        ),
      ),
      floating: true,
      title: ImageData(
        path: ImagePath.logo,
        width: 300,
      ),
      actions: [
        GestureDetector(
          onTap: () {},
          child: Padding(
            padding: const EdgeInsets.all(15.0),
            child: ImageData(path: ImagePath.active),
          ),
        ),
        GestureDetector(
          onTap: () {},
          child: Padding(
            padding: const EdgeInsets.all(15.0),
            child: ImageData(path: ImagePath.dm),
          ),
        ),
      ],
    );
  }
}
