import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:instagram/items/image_avater.dart';
import 'package:instagram/items/image_data.dart';
import 'package:instagram/paths/icons_path.dart';
import 'package:instagram/src/bottom_nav_controller.dart';

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
        Center(child: Text('Home')),
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
            icon: ImageData(path: IconsPath.homeOff),
            activeIcon: ImageData(path: IconsPath.homeOn),
            label: 'home'),
        BottomNavigationBarItem(
            icon: ImageData(path: IconsPath.searchOff),
            activeIcon: ImageData(path: IconsPath.searchOn),
            label: 'search'),
        BottomNavigationBarItem(
            icon: ImageData(path: IconsPath.upload),
            activeIcon: ImageData(path: IconsPath.upload),
            label: 'upload'),
        BottomNavigationBarItem(
            icon: ImageData(path: IconsPath.reelsOff),
            activeIcon: ImageData(path: IconsPath.reelsOn),
            label: 'reels'),
        BottomNavigationBarItem(
            icon: ImageAvatar(
                imgUrl: IconsPath.profile, type: Shape.OFF, size: 25),
            activeIcon: ImageAvatar(
                imgUrl: IconsPath.profile, type: Shape.ACTIVE, size: 25),
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
