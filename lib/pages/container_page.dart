import 'package:donban/pages/person/person_center_page.dart';
import 'package:donban/pages/shop_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';

import 'group/group_page.dart';
import 'home/home_page.dart';
import 'movie/book_audio_video.dart';

class ContainerPage extends StatefulWidget {
  ContainerPage({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return _ContainerPageState();
  }
}

class _Item {
  String name, activeIcon, normalIcon;

  _Item(this.name, this.activeIcon, this.normalIcon);
}

class _ContainerPageState extends State<ContainerPage> {
  List<Widget> pages = [];

  int _selectIndex = 0;

  final itemNames = [
    _Item("首页", "assets/images/ic_tab_home_active.png",
        "assets/images/ic_tab_home_normal.png"),
    _Item("书影音", "assets/images/ic_tab_subject_active.png",
        "assets/images/ic_tab_subject_normal.png"),
    _Item("小组", "assets/images/ic_tab_group_active.png",
        "assets/images/ic_tab_group_normal.png"),
    _Item("市集", "assets/images/ic_tab_shiji_active.png",
        "assets/images/ic_tab_shiji_normal.png"),
    _Item("我的", "assets/images/ic_tab_profile_active.png",
        "assets/images/ic_tab_profile_normal.png")
  ];

  List<BottomNavigationBarItem> itemList = [];

  @override
  void initState() {
    super.initState();
    print("init _ContainerPageState");
    if (pages.length == 0) {
      this.pages = [
        HomePage(),
        BookAudioVideoPage(),
        GroupPage(),
        ShopPage(),
        PersonCenterPage(),
      ];
    };
    if (itemList.length == 0) {
      for (var item in itemNames) {
        itemList.add(BottomNavigationBarItem(
            label: item.name,
            icon: Image.asset(
              item.normalIcon,
              width: 30.0,
              height: 30.0,
            ),
            activeIcon: Image.asset(
              item.activeIcon,
              width: 30.0,
              height: 30.0,
            )));
      }
    }
  }

  Widget _getPageWidget(int index) {
    return Offstage(
      offstage: _selectIndex != index,
      child: TickerMode(
        enabled: _selectIndex == index,
        child: pages[index],
      ),
    );
  }

  @override
  void didUpdateWidget(covariant ContainerPage oldWidget) {
    // TODO: implement didUpdateWidget
    super.didUpdateWidget(oldWidget);
  }

  @override
  Widget build(BuildContext context) {
    print("build _ContainerPageState");
    return Scaffold(
      body: new Stack(
        children: [
          _getPageWidget(0),
          _getPageWidget(1),
          _getPageWidget(2),
          _getPageWidget(3),
          _getPageWidget(4),
        ],
      ),
      backgroundColor: Color.fromARGB(255, 248, 248, 248),
      bottomNavigationBar: BottomNavigationBar(
        items: itemList,
        onTap: (int index) {
          setState(() {
            _selectIndex = index;
          });
        },
        iconSize: 24,
        currentIndex: _selectIndex,
        fixedColor: Color.fromARGB(255, 0, 188, 96),
        type: BottomNavigationBarType.fixed,
      ),
    );
  }
}
