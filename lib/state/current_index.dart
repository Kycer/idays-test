import 'package:get/get.dart';
import "package:idays/config/bottom_bar.dart" show bottomBarRouter;
import 'package:flutter/material.dart';

class CurrentIndexController extends GetxController {
  static CurrentIndexController get to => Get.find(); // 添加这一行

  final PageController _pageController = PageController(initialPage: 0);

  final List<BottomNavigationBarItem> _bottomTabs = [];
  final List<Widget> _bodyList = [];
  final List<Widget> _title = [];

  var _index = 0.obs;

  int get index => _index.value;

  List<BottomNavigationBarItem> get bottomTabs => _bottomTabs;

  List<Widget> get bodyList => _bodyList;

  List<Widget> get title => _title;

  PageController get pageController => _pageController;

  change(int newIndex) {
    _index.value = newIndex;
  }

  jumpToPage(int newIndex) {
    change(newIndex);
    _pageController.jumpToPage(index);
    _pageController.animateToPage(index,
        duration: const Duration(milliseconds: 300), curve: Curves.ease);
  }

  @override
  void onInit() {
    for (var value in bottomBarRouter) {
      _bottomTabs.add(_buildBottom(value));
      _bodyList.add(value['page'] as Widget);
      _title.add(value['title'] as Widget);
    }
  }

  @override
  void dispose() {
    // 销毁 PageView 控制器
    _pageController.dispose();
  }

  BottomNavigationBarItem _buildBottom(Map<String, dynamic> bar) {
    return BottomNavigationBarItem(icon: bar['icon'], label: bar['text']);
  }
}
