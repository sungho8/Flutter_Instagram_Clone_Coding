import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

enum Shape { ACTIVE, OFF }

class ImageAvatar extends StatelessWidget {
  final String imgUrl;
  final double size;
  final Shape type;

  const ImageAvatar(
      {super.key,
      required this.imgUrl,
      required this.type,
      required this.size});

  @override
  Widget build(BuildContext context) {
    return type == Shape.ACTIVE ? _activeAvatar() : _offAvatar();
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
          height: size,
          child: ClipRRect(
            borderRadius: BorderRadius.circular(65),
            child: Image.asset(
              imgUrl,
              width: size,
            ),
          ),
        ),
      ),
    );
  }

  Widget _activeAvatar() {
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
}
