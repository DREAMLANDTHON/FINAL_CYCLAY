import 'package:flutter/material.dart';

import 'package:loop_page_view/loop_page_view.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';

import 'my_page.dart';

final Set<Image> banner_images = {
  Image.asset('assets/main_page/image.png'),
  Image.asset('assets/main_page/image.png'),
  Image.asset('assets/main_page/image.png'),
  Image.asset('assets/main_page/image.png'),
};

final Set<Image> feed_images = {
  Image.asset(''),
};

class MainPage extends StatefulWidget {
  const MainPage({Key? key}) : super(key: key);

  @override
  _MainPageState createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  final List<bool> isSelected =
  banner_images.map((e) => e == banner_images.last ? true : false).toList();
  LoopScrollMode selectedScrollMode = LoopScrollMode.shortest;
  final LoopPageController controller = LoopPageController(
      scrollMode: LoopScrollMode.shortest,
      activationMode: LoopActivationMode.immediate);

  Color gray = Color(0xFFD9D9D9);

  int _selectedIndex = 0; // 선택된 페이지의 인덱스 넘버 초기화

  int currentPage = 0;

  PageController _PageController = PageController(
    initialPage: 0,
  );

  static const TextStyle optionStyle = TextStyle(
      fontSize: 30,
      fontWeight: FontWeight.bold); // 텍스트 스타일 지정이므로 해당 부분은 제거해도 된다.

  final List<Widget> _widgetOptions = <Widget>[
    MainPage(),
    MyPage(),
  ]; // 3개의 페이지를 연결할 예정이므로 3개의 페이지를 여기서 지정해준다. 탭 레이아웃은 3개.

  void _onItemTapped(int index) {
    // 탭을 클릭했을떄 지정한 페이지로 이동
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;
    final int selectedIndex = isSelected.indexOf(
      isSelected.firstWhere((element) => element == true),
    );

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
      body: MasonryGridView.count(
        crossAxisCount: 2,
        crossAxisSpacing: 0,
        mainAxisSpacing: 0,
        itemBuilder: (BuildContext context, int index) {
          if (index == 0) {
            return Stack(
              children: [
                Container(height: height * 0.3, color: gray),
                Padding(
                  padding: EdgeInsets.all(width * 0.05),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Image.asset('assets/main_page/key_title.png'),
                      SizedBox(
                        height: height * 0.03,
                      ),
                      Image.asset(
                        'assets/main_page/sub_title.png',
                        width: width * 0.33,
                      ),
                      SizedBox(height: height * 0.07),
                      Text('$_selectedIndex/5'),
                      SizedBox(height: height*0.05,)

                    ],
                  ),
                ),
              ],
            );
          } else if (index == 1) {
            return Stack(children: [
              Container(
                height: height * 0.3,
                color: gray,
              ),
              Column(
                children: [
                  SizedBox(
                    height: height * 0.1,
                  ),
                  SizedBox(
                    height: height * 0.25,
                    width: width * 0.4,
                    child: LoopPageView.builder(
                      controller: controller,
                      itemCount: banner_images.length,
                      itemBuilder: (_, index) {
                        return banner_images.elementAt(index);
                      },
                    ),
                  ),
                ],
              )
            ]);
          } else if (index % 3 == 0) {
            return Column(
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                SizedBox(
                  height: 20,
                ),
                ListTile(
                  leading: Icon(Icons.album, size: 10),
                  title: Text('Sonu Nigam'),
                  subtitle: Text('Best of Sonu Nigam Song'),
                ),
              ],
            );
          } else {
            return Column(
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                SizedBox(
                  height: 20,
                ),
                ListTile(
                  leading: Icon(Icons.album, size: 10),
                  title: Text('Sonu Nigam'),
                  subtitle: Text('Best of Sonu Nigam Song'),
                ),
              ],
            );
          }
        },
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
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
        currentIndex: _selectedIndex, // 지정 인덱스로 이동
        selectedItemColor: Colors.lightGreen,
        onTap: _onItemTapped, // 선언했던 onItemTapped
      ),
    );
  }
}
