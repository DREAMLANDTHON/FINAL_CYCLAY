import 'package:flutter/material.dart';

import 'camera_page.dart';
import 'main_page.dart';
import 'my_page.dart';

class BottomNavigatorPage extends StatefulWidget {
  const BottomNavigatorPage({Key? key}) : super(key: key);

  @override
  _BottomNavigatorPageState createState() => _BottomNavigatorPageState();
}

class _BottomNavigatorPageState extends State<BottomNavigatorPage> {

  int _selectedIndex = 0;
  Color gray = Color(0xFFD9D9D9);

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;

    return Scaffold(
      appBar: AppBar(
          backgroundColor: gray,
          elevation: 0.0,
          title: Container(
            child: Row(
              children: [
                Padding(
                  padding: EdgeInsets.fromLTRB(width*0.01, 0, 0, 0),
                  child: Image.asset(
                    'assets/main_page/CYCLAY.png',
                    height: height * 0.2,
                    width: width * 0.2,
                  ),
                ),
              ],
            ),
          ),
          actions: [
            Icon(Icons.notifications_none_outlined),
            Icon(Icons.search)
          ]),
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        backgroundColor: Colors.grey,
        selectedItemColor: Colors.white,
        unselectedItemColor: Colors.white.withOpacity(.60),
        selectedFontSize: 14,
        unselectedFontSize: 14,
        currentIndex: _selectedIndex, //현재 선택된 Index
        onTap: (int index) {
          setState(() {
            _selectedIndex = index;
          });
        },
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: '홈',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.camera_alt_outlined),
            label: '카메라',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.people),
            label: '마이페이지',
          ),
        ],
      ),
      body: Center(
        child: _widgetOptions.elementAt(_selectedIndex),
      ),
    );
  }

  List _widgetOptions = [
    MainPage(),
    CameraPage(),
    MyPage()
  ];
}
