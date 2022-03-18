import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CurrentIndexController extends GetxController {


  static CurrentIndexController get to => Get.find(); // 添加这一行

  var _index = 0.obs;

  int get index => _index.value;

  change(int newIndex) {
    _index = RxInt(newIndex);
    update();
  }
}
