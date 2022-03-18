import 'package:flutter/material.dart';
import 'package:idays/provider/current_index.dart';

class MemberPage extends StatefulWidget {
  const MemberPage({Key? key}) : super(key: key);

  @override
  _MemberPageState createState() => _MemberPageState();
}

class _MemberPageState extends State<MemberPage> with AutomaticKeepAliveClientMixin {
  @override
  void initState() {
    super.initState();
    print("init member");
  }

  @override
  Widget build(BuildContext context) {
    var index = CurrentIndexController.to.index;
    print(index);
    return Container(
        child: const Center(
          // child: new Text(wordPair.asPascalCase),
          child: Text('个人中心'),
        ));
  }

  @override
  bool get wantKeepAlive => true;
}
