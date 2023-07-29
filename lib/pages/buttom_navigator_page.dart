import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../constants/color_constants.dart';
import '../providers/auth_provider.dart';
import 'cam_page.dart';
import 'camera_page.dart';
import 'login_page.dart';
import 'main_page.dart';
import 'my_page.dart';
import 'start_page.dart';

class BottomNavigatorPage extends StatefulWidget {
  const BottomNavigatorPage({Key? key}) : super(key: key);

  @override
  _BottomNavigatorPageState createState() => _BottomNavigatorPageState();
}

class _BottomNavigatorPageState extends State<BottomNavigatorPage> {
  int _selectedIndex = 0;
  List<bool> _selected = [true, false, false];
  Color gray = Color(0xFFF2FFF1);
  
  Future<bool?> showLoginConfirmationDialog() async {
  return await showDialog<bool>(
    context: context,
    builder: (BuildContext context) {
      return AlertDialog(
        title: Text('Confirmation'),
        content: Text('Are you sure you want to log out?'),
        actions: [
          TextButton(
            onPressed: () => Navigator.of(context).pop(false), // No button
            child: Text('No'),
          ),
          TextButton(
            onPressed: () => Navigator.of(context).pop(true), // Yes button
            child: Text('Yes'),
          ),
        ],
      );
    },
  );
}

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;
    AuthProvider authProvider = Provider.of<AuthProvider>(context);
    return Scaffold(
      appBar: AppBar(
          backgroundColor: ColorPalette.mainBasic,
          elevation: 0.0,
          // titleSpacing: 0.0,
          // centerTitle: false,
          title: Container(
            child: Row(
              children: [
                Padding(
                  padding: EdgeInsets.fromLTRB(width * 0.02, 0, 0, 0),
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
              size: width * 0.08,
            ),
            SizedBox(
              width: width * 0.04,
            ),
            Icon(
              Icons.search,
              color: ColorPalette.mainBlack,
              size: width * 0.08,
            ),
            SizedBox(
              width: width*0.01,
            ),
            IconButton(
              icon: Icon(Icons.logout,
              color: ColorPalette.mainBlack,),
              onPressed: () {
                authProvider.handleSignOut();
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(builder: (context) => LoginPage()),
                );
              },
            ),
          ]),
      bottomNavigationBar: BottomNavigationBar(
        elevation: 0,
        type: BottomNavigationBarType.fixed,
        backgroundColor: ColorPalette.trueWhite,
        selectedItemColor: ColorPalette.mainBlack,
        unselectedItemColor: ColorPalette.mainBlack.withOpacity(0.1),
        selectedFontSize: 14,
        unselectedFontSize: 14,
        currentIndex: _selectedIndex,
        //?òÑ?û¨ ?Ñ†?Éù?êú Index
        onTap: (int index) async {
          if (index == 2) {
            AuthProvider authProvider = context.read<AuthProvider>();
            bool isLoggedIn = await authProvider.isLoggedIn();

            if (isLoggedIn) {
              // User is logged in, navigate to MyPage
              setState(() {
                _selectedIndex = index;
              });
            } else {
                bool? shouldContinue = await showLoginConfirmationDialog();
                if (shouldContinue == true) {
                  authProvider.handleSignOut();
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(builder: (context) => LoginPage()),
                  );
                }
            }
          } else {
            setState(() {
              _selectedIndex = index;
            });
          }
        },
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.home_filled),
            label: '?ôà',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.camera_alt),
            label: 'Ïπ¥Î©î?ùº',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'ÎßàÏù¥?éò?ù¥Ïß?',
          ),
        ],
      ),
      body: Center(
        child: _widgetOptions.elementAt(_selectedIndex),
      ),
    );
  }

  List _widgetOptions = [MainPage(), CamPage(), MyPage()];
}
