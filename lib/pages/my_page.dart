import 'package:flutter/material.dart';

class MyPage extends StatefulWidget {
  const MyPage({Key? key}) : super(key: key);

  @override
  _MyPageState createState() => _MyPageState();
}

class _MyPageState extends State<MyPage> {

  final List<String> imageList = [
    'assets/my_page/0b8b807151408be5e6f6df02b826e63c.jpg',
    'assets/my_page/0da5120a02de094c11e942c95a6e3c70.jpg',
    'assets/my_page/0e7f1a80174b18144f60452cec8e4197.jpg',
    'assets/my_page/00b18a314695e37d3355d3b3f440abc8.jpg',
    'assets/my_page/1ad110ed2c88b16a76958b29eba21972.jpg',
    'assets/my_page/2b15dce0ba5b50815e4d8d55ff415284.jpg',
    'assets/my_page/2f19c62cf0d19dad8ebead5865771942.jpg',
    'assets/my_page/3d694c643e70e006465060f38e84c2cb.jpg',
    'assets/my_page/3e717c5d6e12dbc6d72f04535ed3c365.jpg',
    'assets/my_page/4c8af8cecee9dfe268a34954ed392db4.jpg',
    'assets/my_page/4c45ab880ae0055c3f4af3c8ff624773.jpg',
    'assets/my_page/5a9a0ed1acba24039053f91dca6c5f01.jpg',
  ];

  void handleImageTap(int index) {
    print('Image at index $index tapped.');
    // 원하는 작업을 추가하세요.
  }

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        // Image.asset('assets/my_page/profile.png'),
        Padding(
          padding: const EdgeInsets.only(left: 8.0, right: 8.0),
          child: Container(
            padding: EdgeInsets.zero,
            height: MediaQuery.of(context).size.height / 2.4,
            width: MediaQuery.of(context).size.width ,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(15),
                topRight: Radius.circular(15),
              ),
              image: const DecorationImage(
                image: AssetImage('assets/my_page/profile.png'),
                fit:BoxFit.contain,
              ),
            ),
          ),
        ),
        GridView.builder(
          shrinkWrap: true,
          primary: false,
          itemCount: imageList.length,
          gridDelegate:
          SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 3),
          itemBuilder: (BuildContext context, int index) {
            return Padding(
              padding: const EdgeInsets.all(8.0),
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
      ],
    );
  }
}
