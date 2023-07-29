import 'package:flutter/material.dart';

import '../constants/color_constants.dart';

class DetailImagePage extends StatefulWidget {
  const DetailImagePage({Key? key}) : super(key: key);

  @override
  _DetailImagePageState createState() => _DetailImagePageState();
}

class _DetailImagePageState extends State<DetailImagePage> {
  bool _isLiked = false;
  int _likeCount = 0;
  bool _isCollected = true;
  int _CollectedCount = 0;

  void _toggleCollect() {
    setState(() {
      _isCollected = !_isCollected;
      _isCollected ? _CollectedCount++ : _CollectedCount--;
    });
  }

  void _toggleLike() {
    setState(() {
      _isLiked = !_isLiked;
      _isLiked ? _likeCount++ : _likeCount--;
    });
  }

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    final controller = PageController();
    return Scaffold(
        appBar: AppBar(
          backgroundColor: ColorPalette.trueWhite,
          elevation: 0.0,
          leading: IconButton(
            icon: Icon(
              Icons.arrow_back,
              color: ColorPalette.mainBlack,
            ),
            onPressed: () {
              Navigator.pop(context);
            },
          ),
        ),
        body: ListView(
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                InkWell(
                    child: Container(
                  margin: EdgeInsets.only(left: 10),
                  height: MediaQuery.of(context).size.height / 10,
                  width: MediaQuery.of(context).size.width / 5,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    image: const DecorationImage(
                      image: AssetImage('assets/detail_image_page/YH.png'),
                      fit: BoxFit.contain,
                    ),
                  ),
                )),
                Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                          // margin: EdgeInsets.only(top:5),
                          height: MediaQuery.of(context).size.height / 30,
                          width: MediaQuery.of(context).size.width / 4.8,
                          decoration: BoxDecoration(
                            image: const DecorationImage(
                              image: AssetImage('assets/my_page/kim.png'),
                              // fit:BoxFit.cover,
                            ),
                          )),
                      Container(
                          height: MediaQuery.of(context).size.height / 50,
                          width: MediaQuery.of(context).size.width / 4.2,
                          decoration: BoxDecoration(
                            image: const DecorationImage(
                              image: AssetImage('assets/my_page/aldsk_039.png'),
                              // fit:BoxFit.cover,
                            ),
                          ))
                    ]),
              ],
            ),
            Padding(
              padding: EdgeInsets.fromLTRB(width * 0.07, 0, width * 0.07, 0),
              child: SizedBox(
                  height: height * 0.5,
                  width: width * 0.4,
                  child: PageView(
                    controller: controller,
                    children: [
                      Image.asset('assets/detail_image_page/ex_0.png',
                           height: 250, width:250,),
                      Image.asset('assets/detail_image_page/ex_1.png',
                        height: 250, width:250,
                          ),
                      Image.asset('assets/detail_image_page/ex_2.png',
                        height: 250, width:250,
                          ),
                      Image.asset('assets/detail_image_page/ex_3.png',
                        height: 250, width:250,
                          ),
                      Image.asset('assets/detail_image_page/ex_4.png',
                        height: 250, width:250,
                          ),
                    ],
                  )),
            ),
            Row(children: [
              SizedBox(
                width: width * 0.08,
              ),
              Container(
                height: MediaQuery.of(context).size.height / 18,
                width: MediaQuery.of(context).size.width / 3.5,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image:
                        AssetImage('assets/detail_image_page/product_name.png'),
                    // fit:BoxFit.cover,
                  ),
                ),
              ),
              SizedBox(width: width * 0.3),
              IconButton(
                padding: EdgeInsets.zero,
                icon: Icon(
                  _isLiked ? Icons.favorite : Icons.favorite_border,
                  color: _isLiked ? Colors.red : Colors.black,
                  size: MediaQuery.of(context).size.width / 15,
                ),
                onPressed: _toggleLike,
              ),
              IconButton(
                padding: EdgeInsets.zero,
                icon: Icon(
                  _isCollected ? Icons.bookmark_border : Icons.bookmark,
                  color: _isCollected ? Colors.black : Colors.black,
                  size: MediaQuery.of(context).size.width / 13,
                ),
                onPressed: _toggleCollect,
              ),
            ]),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                Container(
                  padding: EdgeInsets.fromLTRB(5.0, 0.0, 0, 0),
                  // padding: EdgeInsets.zero,
                  height: MediaQuery.of(context).size.height / 4,
                  width: MediaQuery.of(context).size.width,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image:
                          AssetImage('assets/detail_image_page/cont_text.png'),
                      // fit:BoxFit.fitWidth,
                    ),
                  ),
                ),
                Row(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(1.0),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          InkWell(
                            onTap: () {},
                            child: Container(
                              padding: EdgeInsets.zero,
                              height: MediaQuery.of(context).size.height * 0.08,
                              width: MediaQuery.of(context).size.width *0.49,
                              decoration: BoxDecoration(
                                image: DecorationImage(
                                  image:
                                  AssetImage('assets/detail_image_page/chat_img.png'),
                                  // fit:BoxFit.fitWidth,
                                  ),
                                ),
                              ),
                              ),
                        ],
                        //   GestureDetector(
                        //     onTap: () {},
                        //     child: Image.asset(
                        //       'assets/detail_image_page/chat_img.png',
                        //       // Replace with your image asset
                        //       width: MediaQuery.of(context).size.width * 0.49,
                        //       height: MediaQuery.of(context).size.height * 0.08,
                        //     ),
                        //   ),
                        // ],
                      ),
                    ),
                    InkWell(
                      onTap: () {},
                      child: Container(
                        // padding: EdgeInsets.all(10),
                        padding: EdgeInsets.zero,
                        height: MediaQuery.of(context).size.height * 0.08,
                        width: MediaQuery.of(context).size.width *0.5,
                        decoration: BoxDecoration(
                          image: DecorationImage(
                            image:
                                AssetImage('assets/detail_image_page/buying_page.png'),
                            // fit:BoxFit.fitWidth,
                          ),
                        ),
                      ),
                    ),
                  ],
                )
              ],
            )
            // print()
          ],
        ));
  }
}
