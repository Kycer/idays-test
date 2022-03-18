import 'package:flutter/material.dart';
import 'package:get/get.dart';
import "package:idays/config/bottom_bar.dart" show bottomBarRouter;
import 'package:idays/provider/current_index.dart';

class RootPage extends StatefulWidget {
  const RootPage({Key? key}) : super(key: key);

  @override
  _RootPageState createState() => _RootPageState();
}

class _RootPageState extends State<RootPage>
    with SingleTickerProviderStateMixin {
  final List<BottomNavigationBarItem> _bottomTabs = [];
  final List<Widget> _bodyList = [];
  final List<Widget> _title = [];
  final CurrentIndexController c = Get.put(CurrentIndexController());
  final PageController _pageController = PageController(initialPage: 0);

  @override
  void initState() {
    super.initState();
    for (var value in bottomBarRouter) {
      _bottomTabs.add(_buildBottom(value));
      _bodyList.add(value['page'] as Widget);
      _title.add(value['title'] as Widget);
    }
  }

  @override
  void dispose() {
    super.dispose();

    // 销毁 PageView 控制器
    _pageController.dispose();
  }

  BottomNavigationBarItem _buildBottom(Map<String, dynamic> bar) {
    return BottomNavigationBarItem(icon: bar['icon'], label: bar['text']);
  }

  //底部导航栏切换
  void _onChangeTap(int index) {
    _pageController.jumpToPage(index);
    _pageController.animateToPage(index,
        duration: const Duration(milliseconds: 300), curve: Curves.ease);
    c.change(index);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: IndexedStack(index: c.index, children: _title),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: _bottomTabs,
        currentIndex: c.index, //当前选中标识符
        onTap: _onChangeTap,
        type: BottomNavigationBarType.fixed,
      ),
      body: PageView(
        controller: _pageController,
        children: _bodyList,
        onPageChanged: _onChangeTap,
      ),
    );
  }
}
