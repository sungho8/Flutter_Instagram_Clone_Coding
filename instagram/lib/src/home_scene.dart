import 'dart:math';

import 'package:flutter/material.dart';
import 'package:get/route_manager.dart';
import 'package:instagram/items/image_avater.dart';
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
            _story(),
            _body(),
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

  Widget _body() {
    return SliverList.builder(
        itemCount: 50,
        itemBuilder: (context, index) => Container(
              height: 50,
              color:
                  Colors.primaries[Random().nextInt(Colors.primaries.length)],
            ));
  }

  Widget _story() {
    return SliverToBoxAdapter(
      child: SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: Row(children: [
          Column(
            children: [
              ImageAvatar(
                  imgUrl: ImagePath.profile, size: 100, type: Shape.MYSTORY),
              const Padding(
                padding: EdgeInsets.fromLTRB(0, 4, 0, 7.5),
                child: Text(
                  '내 스토리',
                  style: TextStyle(fontSize: 10),
                ),
              ),
            ],
          ),
          ...List.generate(
            10,
            (index) => SizedBox(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 12.0, vertical: 4.0),
                    child: ImageAvatar(
                      imgUrl: ImagePath.profile,
                      size: 80,
                      type: Shape.STORY,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(0, 4, 0, 7.5),
                    child: Text(
                      'user_ $index',
                      style: const TextStyle(fontSize: 10),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ]),
      ),
    );
  }
}
