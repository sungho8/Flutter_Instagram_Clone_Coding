import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:instagram/items/image_avater.dart';
import 'package:instagram/items/image_data.dart';
import 'package:instagram/paths/image_path.dart';
import 'package:instagram/src/bottom_nav_controller.dart';
import 'package:instagram/src/home_scene.dart';

class App extends GetView<BottomNavController> {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: controller.willPopAction,
      child: Obx(
        () => Scaffold(
          body: _body(),
          bottomNavigationBar: Theme(
              data: ThemeData(
                  splashColor: Colors.transparent,
                  highlightColor: Colors.transparent),
              child: _bottomNavigationBar()),
        ),
      ),
    );
  }

  Widget _body() {
    return IndexedStack(
      index: controller.pageIndex,
      children: const [
        HomeScene(),
        Center(child: Text('Search')),
        Center(child: Text('Upload')),
        Center(child: Text('Reels')),
        Center(child: Text('Profile')),
      ],
    );
  }

  Widget _bottomNavigationBar() {
    return BottomNavigationBar(
      type: BottomNavigationBarType.fixed,
      elevation: 0.0,
      backgroundColor: Colors.white,
      showSelectedLabels: false,
      showUnselectedLabels: false,
      currentIndex: controller.pageIndex,
      onTap: controller.changeIndex,
      items: [
        BottomNavigationBarItem(
            icon: ImageData(path: ImagePath.homeOff),
            activeIcon: ImageData(path: ImagePath.homeOn),
            label: 'home'),
        BottomNavigationBarItem(
            icon: ImageData(path: ImagePath.searchOff),
            activeIcon: ImageData(path: ImagePath.searchOn),
            label: 'search'),
        BottomNavigationBarItem(
            icon: ImageData(path: ImagePath.upload),
            activeIcon: ImageData(path: ImagePath.upload),
            label: 'upload'),
        BottomNavigationBarItem(
            icon: ImageData(path: ImagePath.reelsOff),
            activeIcon: ImageData(path: ImagePath.reelsOn),
            label: 'reels'),
        BottomNavigationBarItem(
            icon: ImageAvatar(
                imgUrl: ImagePath.profile, type: Shape.OFF, size: 25),
            activeIcon: ImageAvatar(
                imgUrl: ImagePath.profile, type: Shape.ON, size: 25),
            label: 'profile'),
      ],
    );
  }
}

class InitBinding extends Bindings {
  @override
  void dependencies() {
    Get.put(BottomNavController(), permanent: true);
  }
}
