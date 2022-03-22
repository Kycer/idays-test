import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:idays/state/current_index.dart';

class RootPage extends GetView<CurrentIndexController> {
  RootPage({Key? key}) : super(key: key);

  final CurrentIndexController c = Get.put(CurrentIndexController());

  //底部导航栏切换
  void _onChangeTap(int index) {
    controller.jumpToPage(index);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: controller.title[controller.index],
      ),
      bottomNavigationBar: Obx(
        () => BottomNavigationBar(
          items: controller.bottomTabs,
          currentIndex: controller.index, //当前选中标识符
          onTap: _onChangeTap,
          type: BottomNavigationBarType.fixed,
        ),
      ),
      body: PageView(
        controller: controller.pageController,
        children: controller.bodyList,
        onPageChanged: _onChangeTap,
      ),
    );
  }
}
