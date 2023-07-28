import 'dart:async';

import 'package:flutter/material.dart';

import 'package:loop_page_view/loop_page_view.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';

import '../constants/color_constants.dart';
import 'my_page.dart';

final Set<Image> banner_images = {
  Image.asset('assets/main_page/bag0.png',
    width: 230,
  height: 230,),
  Image.asset('assets/main_page/bag1.png'),
  Image.asset('assets/main_page/bag2.png'),
  Image.asset('assets/main_page/bag3.png'),
  Image.asset('assets/main_page/bag4.png'),
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

  int _currentPage = 0;
  Timer ?_timer;
  PageController _pageController = PageController(
    initialPage: 0,
  );

  @override
  void initState() {
    super.initState();
    _timer = Timer.periodic(Duration(seconds: 5), (Timer timer) {
      if (_currentPage < 5) {
        _currentPage++;
      } else {
        _currentPage = 0;
      }

      _pageController.animateToPage(
        _currentPage,
        duration: Duration(milliseconds: 350),
        curve: Curves.easeIn,
      );
    });
  }

  List<bool> _isLiked = [
    false,
    false,
    false,
    false,
    false,
    false,
    false,
    false,
    false,
    false,
    false,
    false,
    false,
    false
  ];
  List<int> _likeCount = [0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0];
  List<bool> _isLiked2 = [
    false,
    false,
    false,
    false,
    false,
    false,
    false,
    false,
    false,
    false,
    false,
    false,
    false,
    false
  ];
  List<int> _likeCount2 = [0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0];

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;
    final int selectedIndex = isSelected.indexOf(
      isSelected.firstWhere((element) => element == true),
    );

    return ListView(
      children: [
        Stack(
          children: [
            Container(height: height * 0.3, color: ColorPalette.mainBasic),
            Row(
              children: [
                SizedBox(
                  width: width*0.5,
                ),
                SizedBox(
                  height: height * 0.25,
                  width: width * 0.4,
                  child: PageView(
                    controller: _pageController,
                      children:  [
                        Image.asset('assets/main_page/bag0.png'),
                        Image.asset('assets/main_page/bag1.png'),
                        Image.asset('assets/main_page/bag2.png'),
                        Image.asset('assets/main_page/bag3.png'),
                        Image.asset('assets/main_page/bag4.png'),
                      ]
                  )
                ),
              ],
            ),
            Padding(
              padding: EdgeInsets.all(width * 0.05),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Image.asset('assets/main_page/key_title.png'),
                  SizedBox(
                    height: height * 0.05,
                  ),
                  Image.asset(
                    'assets/main_page/sub_title.png',
                    width: width * 0.45,
                  ),
                  SizedBox(height: height * 0.07),
                ],
              ),
            ),
          ],
        ),
        GridView.builder(
            shrinkWrap: true,
            primary: false,
            itemCount: 14,
            gridDelegate:
                SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
            itemBuilder: (BuildContext context, int index) {
              return Stack(
                children: [
                  Padding(
                    padding: EdgeInsets.all(width * 0.02),
                    child: GestureDetector(
                      onTap: () {},
                      child: Image.asset(
                        'assets/main_page/img_$index.png',
                        // fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  Column(
                    children: [
                      SizedBox(
                        height: height * 0.2,
                      ),
                      IconButton(
                        padding: EdgeInsets.zero,
                        icon: Icon(
                          _isLiked[index]
                              ? Icons.favorite
                              : Icons.favorite_border,
                          color: _isLiked[index] ? Colors.red : Colors.white,
                          size: MediaQuery.of(context).size.width / 20,
                        ),
                        onPressed: () {
                          setState(() {
                            _isLiked[index] = !_isLiked[index];
                            _isLiked[index]
                                ? _likeCount[index]++
                                : _likeCount[index]--;
                          });
                        },
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      SizedBox(
                        width: width * 0.34,
                      ),
                      IconButton(
                        padding: EdgeInsets.zero,
                        icon: Icon(
                          _isLiked2[index]
                              ? Icons.bookmark
                              : Icons.bookmark_border_outlined,
                          color: _isLiked2[index] ? Colors.black : Colors.black,
                          size: MediaQuery.of(context).size.width / 20,
                        ),
                        onPressed: () {
                          setState(() {
                            _isLiked2[index] = !_isLiked2[index];
                            _isLiked2[index]
                                ? _likeCount2[index]++
                                : _likeCount2[index]--;
                          });
                        },
                      ),
                    ],
                  ),
                ],
              );
            }),
      ],
    );
  }
}
