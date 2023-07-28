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
        Padding(
            padding: EdgeInsets.fromLTRB(0.0, 30.0, 30.0, 10.0),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                InkWell(
                    child: Container(
                      height: MediaQuery.of(context).size.height / 7,
                      width: MediaQuery.of(context).size.width / 3,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        image: const DecorationImage(
                          image: AssetImage('assets/my_page/cha.jpeg'),
                          fit:BoxFit.cover,
                        ),
                      ),
                    )
                ),
                SizedBox(width : MediaQuery.of(context).size.width / 12),
                Container(
                  height: MediaQuery.of(context).size.height / 7,
                  width: MediaQuery.of(context).size.width / 3.2,
                  decoration: BoxDecoration(
                    image: const DecorationImage(
                      image: AssetImage('assets/my_page/refresh_score.png'),
                    ),
                  ),
                )
              ],

            )
        ),
        Padding(
          padding: EdgeInsets.only(bottom : MediaQuery.of(context).size.height / 30 ),
          child : Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start, // 왼쪽 정렬
              children: [
                Container(
                  height: 30,
                  width : 100,
                  margin: EdgeInsets.only(left:30),
                  decoration: BoxDecoration(
                    image: const DecorationImage(
                      image: AssetImage('assets/my_page/nangbi.png'),
                    ),
                  ),
                ),
                Container(
                  height: 30,
                  width: 200,
                  margin: EdgeInsets.only(left:25),
                  decoration: BoxDecoration(
                    image: const DecorationImage(
                      image: AssetImage('assets/my_page/moamoa.png'),
                    ),

                  ),
                  padding: EdgeInsets.only(bottom: MediaQuery.of(context).size.height / 5),
                )
              ]
          ),
        ),
        Container(
          height: MediaQuery.of(context).size.height / 10,
          width : MediaQuery.of(context).size.width ,
          color: Colors.grey.shade300,
          child : Row(
// mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  margin: EdgeInsets.only(left:MediaQuery.of(context).size.width / 10),
                  height: MediaQuery.of(context).size.height / 7,
                  width: MediaQuery.of(context).size.width / 5.2,
                  decoration: BoxDecoration(
                      image: const DecorationImage(image: AssetImage('assets/my_page/gaesi.png'),
                      )
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(left:MediaQuery.of(context).size.width / 9),
                  height: MediaQuery.of(context).size.height / 7,
                  width: MediaQuery.of(context).size.width / 5.2,
                  decoration: BoxDecoration(
                      image: const DecorationImage(image: AssetImage('assets/my_page/follow.png'),
                      )
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(left:MediaQuery.of(context).size.width / 9),
                  height: MediaQuery.of(context).size.height / 7,
                  width: MediaQuery.of(context).size.width / 5.2,
                  decoration: BoxDecoration(
                      image: const DecorationImage(image: AssetImage('assets/my_page/follower.png'),
                      )
                  ),
                )
              ]
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
