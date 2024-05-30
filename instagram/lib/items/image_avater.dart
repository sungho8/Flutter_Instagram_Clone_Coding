import 'package:flutter/material.dart';
import 'package:instagram/items/image_data.dart';
import 'package:instagram/paths/image_path.dart';

enum Shape { ON, OFF, STORY, MYSTORY }

class ImageAvatar extends StatelessWidget {
  final String imgUrl;
  final double size;
  final Shape type;
  final void Function()? onTap;

  const ImageAvatar(
      {super.key,
      required this.imgUrl,
      required this.type,
      required this.size,
      this.onTap});

  @override
  Widget build(BuildContext context) {
    return switch (type) {
      Shape.ON => _onAvatar(),
      Shape.OFF => _offAvatar(),
      Shape.STORY => _storyAvatar(),
      Shape.MYSTORY => _myStoryAvatar(),
    };
  }

  Widget _basicAvatar() {
    return Container(
      padding: const EdgeInsets.all(1.0),
      decoration:
          const BoxDecoration(color: Colors.white, shape: BoxShape.circle),
      child: CircleAvatar(
        backgroundColor: Colors.white,
        child: SizedBox(
          width: size,
          child: ClipRRect(
            borderRadius: BorderRadius.circular(65),
            child: ImageData(
              path: imgUrl,
              width: size,
            ),
          ),
        ),
      ),
    );
  }

  Widget _onAvatar() {
    return Container(
      height: size + 2,
      width: size + 2,
      padding: const EdgeInsets.all(1.0),
      decoration:
          const BoxDecoration(color: Colors.black, shape: BoxShape.circle),
      child: _basicAvatar(),
    );
  }

  Widget _offAvatar() {
    return Container(
      height: size + 2,
      width: size + 2,
      padding: const EdgeInsets.all(1.0),
      decoration:
          const BoxDecoration(color: Colors.white, shape: BoxShape.circle),
      child: _basicAvatar(),
    );
  }

  Widget _storyAvatar() {
    return Container(
        padding: const EdgeInsets.all(3.5),
        decoration: const BoxDecoration(
            shape: BoxShape.circle,
            // 스토리 영역 그라데이션
            gradient: LinearGradient(
                begin: Alignment.bottomLeft,
                end: Alignment.topRight,
                colors: [
                  Color(0xfffce80a),
                  Color(0xfffc3a0a),
                  Color(0xffc80afc),
                ])),
        child: Container(
            padding: const EdgeInsets.all(2.0),
            decoration: const BoxDecoration(
                shape: BoxShape.circle, color: Colors.white),
            child: _basicAvatar()));
  }

  Widget _myStoryAvatar() {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 5.5, vertical: 3.5),
        child: Stack(
          children: [
            _basicAvatar(),
            Positioned(
              right: 0,
              bottom: 0,
              child: Container(
                padding: const EdgeInsets.all(3.0),
                decoration: const BoxDecoration(
                    shape: BoxShape.circle, color: Colors.white),
                child: ImageData(
                  width: 35,
                  path: ImagePath.addStory,
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
