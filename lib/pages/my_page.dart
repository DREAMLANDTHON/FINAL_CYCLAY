import 'package:flutter/material.dart';

import '../constants/color_constants.dart';

class MyPage extends StatefulWidget {
  const MyPage({Key? key}) : super(key: key);

  @override
  _MyPageState createState() => _MyPageState();
}

class _MyPageState extends State<MyPage> {
  final List<String> imageList = [
    'assets/my_page/img_0.png',
    'assets/my_page/img_1.png',
    'assets/my_page/img_2.png',
    'assets/my_page/img_3.png',
    'assets/my_page/img_4.png',
    'assets/my_page/img_5.png',
    'assets/my_page/img_6.png',
    'assets/my_page/img_7.png',
    'assets/my_page/img_8.png',
    'assets/my_page/img_9.png',
    'assets/my_page/img_10.png',
    'assets/my_page/img_11.png',
    'assets/my_page/img_12.png',
    'assets/my_page/img_13.png',
    'assets/my_page/img_14.png',
  ];

  void handleImageTap(int index) {
    // print('Image at index $index tapped.');
    if (index == 0){
      Navigator.pushNamed(context, '/detail_image_page');
    }
    // 원하는 작업을 추가하세요.
  }

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;

    return ListView(
      padding: EdgeInsets.zero,
      children: [
        Stack(
          children: [
            Row(
              children: [
                Icon(
                  Icons.notifications_none_outlined,
                  color: ColorPalette.mainBlack,
                  size: width * 0.1,
                ),
              ],
            ),
            Container(height: height * 0.35, color: ColorPalette.mainBasic),
            Padding(
              padding: const EdgeInsets.only(left: 8.0, right: 8.0),
              child: Container(
                padding: EdgeInsets.zero,
                height: MediaQuery.of(context).size.height / 3,
                width: MediaQuery.of(context).size.width,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(15),
                    topRight: Radius.circular(15),
                  ),
                  image: const DecorationImage(
                    image: AssetImage('assets/my_page/profile.png'),
                    fit: BoxFit.contain,
                  ),
                ),
              ),
            ),
            Column(
              children: [
                SizedBox(
                  height: height * 0.37,
                ),
                Center(
                  child: Image.asset(
                    'assets/my_page/texts.png',
                    width: 300,
                  ),
                ),
              ],
            )
          ],
        ),
        Padding(
          padding: EdgeInsets.fromLTRB(width*0.05, 0, width*0.05, 0),
          child: GridView.builder(
            shrinkWrap: true,
            primary: false,
            itemCount: imageList.length,
            gridDelegate:
                SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 3),
            itemBuilder: (BuildContext context, int index) {
              return Padding(
                padding: EdgeInsets.all(width*0.003),
                child: GestureDetector(
                  onTap: () {
                    handleImageTap(index);
                  },
                  child: Image.asset(
                    imageList[index],
                    fit: BoxFit.cover,
                  ),
                ),
              );
            },
          ),
        ),
      ],
    );
  }
}
