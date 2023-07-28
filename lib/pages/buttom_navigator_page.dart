import 'package:flutter/material.dart';

import '../constants/color_constants.dart';
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
  List<bool> _selected = [true, false, false];
  Color gray = Color(0xFFF2FFF1);

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;

    return Scaffold(
      appBar: AppBar(
          backgroundColor: ColorPalette.mainBasic,
          elevation: 0.0,
          title: Container(
            child: Row(
              children: [
                Padding(
                  padding: EdgeInsets.fromLTRB(width * 0.01, 0, 0, 0),
                  child: Image.asset(
                    'assets/main_page/logo.png',
                    height: height * 0.3,
                    width: width * 0.3,
                  ),
                ),
              ],
            ),
          ),
          actions: [
            Icon(
              Icons.notifications_none_outlined,
              color: ColorPalette.mainBlack,
              size: width*0.08,
            ),
            SizedBox(
              width: width*0.04,
            ),
            Icon(
              Icons.search,
              color: ColorPalette.mainBlack,
              size: width*0.08,
            ),
            SizedBox(
              width: width*0.1,
            ),
          ]),
    // bottomNavigationBar: BottomNavigationBar(
    // items: const <BottomNavigationBarItem>[
    // BottomNavigationBarItem(
    // icon: Icon(Icons.home),
    // label: '홈',
    // ),
    // BottomNavigationBarItem(
    // icon: Icon(Icons.camera_alt),
    // label: '카메라',
    // ),
    // BottomNavigationBarItem(
    // icon: Icon(Icons.person),
    // label: '마이',
    // ),
    // ],
    // currentIndex: _selectedIndex,
    // selectedItemColor: Colors.black87,
    // selectedLabelStyle: TextStyle(
    // fontFamily: 'Arial', // 원하는 폰트 입력
    // fontSize: 12,
    // fontWeight: FontWeight.bold,
    // ),

    bottomNavigationBar: BottomNavigationBar(
        elevation: 0,
        type: BottomNavigationBarType.fixed,
        backgroundColor: ColorPalette.trueWhite,
        selectedItemColor: ColorPalette.mainBlack,
        unselectedItemColor: ColorPalette.mainBlack.withOpacity(0.1),
        selectedFontSize: 14,
        unselectedFontSize: 14,
        currentIndex: _selectedIndex,
        //현재 선택된 Index
        onTap: (int index) {
          setState(() {
            _selectedIndex = index;
          });
        },
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.home_filled),
            label: '홈',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.camera_alt),
            label: '카메라',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: '마이페이지',
          ),
        ],
      ),
      body: Center(
        child: _widgetOptions.elementAt(_selectedIndex),
      ),
    );
  }

  List _widgetOptions = [MainPage(), CameraPage(), MyPage()];
}
