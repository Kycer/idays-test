import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:idays/app.dart';
import 'package:idays/config/theme.dart';

void main() async {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'IDays 倒数日',
      debugShowCheckedModeBanner: false,
      theme: appTheme,
      home: RootPage(),
    );
  }
}
