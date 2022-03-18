import 'package:flutter/material.dart';
import 'package:idays/provider/current_index.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> with AutomaticKeepAliveClientMixin {
  @override
  void initState() {
    super.initState();
    print("init home");
  }

  @override
  Widget build(BuildContext context) {
    var index = CurrentIndexController.to.index;
    print(index);
    return const Center(child: Text("主页"));
  }

  @override
  bool get wantKeepAlive => true;
}
