import 'package:flutter/material.dart';

import '../widgets/search/search_list.dart';
import '../widgets/subscribe/subscribe.dart';
import '../widgets/alarm/notice.dart';
import '../widgets/collection/collection_box.dart';
import '../commons/app_property.dart';

class AppPage extends StatefulWidget {
  const AppPage({super.key});

  @override
  AppState createState() => AppState();
}

class AppState extends State<AppPage> {
  int _currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    final List<Widget> children = [
      const SearchList(),
      const Subscribe(),
      NoticeWidget(),
      CollectionBox(),
    ];
    return Scaffold(
      appBar: AppBar(),
      body: children[_currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed, // 3개이상 아이템이 배치될경우 이 항목이 필수
        backgroundColor: StoreStyleProperties.systemBarColor,
        selectedItemColor: Colors.white,
        unselectedItemColor: Colors.white,
        onTap: _onTabTapped,
        currentIndex: _currentIndex,
        items: [
          BottomNavigationBarItem(
            icon: Icon(
              Icons.home,
              color: _currentIndex == 0 ? Colors.blue : Colors.white,
            ),
            label: "홈",
          ),
          BottomNavigationBarItem(
              icon: Icon(
                Icons.ondemand_video_outlined,
                color: _currentIndex == 1 ? Colors.blue : Colors.white,
              ),
              label: "구독"),
          BottomNavigationBarItem(
              icon: Icon(
                Icons.notifications_none_sharp,
                color: _currentIndex == 2 ? Colors.blue : Colors.white,
              ),
              label: "알림"),
          BottomNavigationBarItem(
              icon: Icon(
                Icons.video_collection,
                color: _currentIndex == 3 ? Colors.blue : Colors.white,
              ),
              label: "보관함"),
        ],
      ),
    );
  }

  void _onTabTapped(int index) {
    setState(() {
      _currentIndex = index;
    });
  }
}
