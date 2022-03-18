import 'package:flutter/material.dart';
import 'package:idays/pages/home.dart';
import 'package:idays/pages/member.dart';

final bottomBarRouter = [
  {
    'page': const HomePage(),
    'title': const Text('主页'),
    'icon': const Icon(Icons.favorite),
    'text': '首页'
  },
  {
    'page': const MemberPage(),
    'title': const Text('个人中心'),
    'icon': const Icon(Icons.person),
    'text': '我的'
  }
];
