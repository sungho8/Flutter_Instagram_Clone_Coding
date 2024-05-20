import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';

enum Page { HOME, SEARCH, UPLOAD, REELS, PROFILE }

class BottomNavController extends GetxController {
  final RxInt _page = 0.obs;
  int get pageIndex => _page.value;

  List bottomHistory = [0];

  void changeIndex(int value) {
    var page = Page.values[value];
    switch (page) {
      case Page.UPLOAD:
      case Page.HOME:
      case Page.SEARCH:
      case Page.REELS:
      case Page.PROFILE:
        moveTo(value);
    }
  }

  void moveTo(int value) {
    _page(value);
    if (bottomHistory.last != value && Platform.isAndroid) {
      bottomHistory.add(value);
    }
  }

  Future<bool> willPopAction() async {
    if (bottomHistory.length == 1) {
      return true;
    }

    bottomHistory.removeLast();
    _page(bottomHistory.last);
    return false;
  }
}
