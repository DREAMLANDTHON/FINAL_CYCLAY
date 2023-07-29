import 'dart:async';

import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';

import 'package:loop_page_view/loop_page_view.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:provider/provider.dart';
import 'package:path/path.dart' as path;

import '../constants/color_constants.dart';
import '../providers/search_provider.dart';
import 'my_page.dart';

class RecommandPage extends StatefulWidget {
  const RecommandPage({Key? key}) : super(key: key);

  @override
  _RecommandPageState createState() => _RecommandPageState();
}

class _RecommandPageState extends State<RecommandPage> {
  LoopScrollMode selectedScrollMode = LoopScrollMode.shortest;

  final LoopPageController controller = LoopPageController(
      scrollMode: LoopScrollMode.shortest,
      activationMode: LoopActivationMode.immediate);

  int _currentPage = 0;
  Timer? _timer;
  PageController _pageController = PageController(
    initialPage: 0,
  );

  late List<String> imageURLs;

  late List<String> _searchTerms;

  Future<List<String>> fetchImageURLs() async {
    List<String> imageURLs = [];
    // Replace "cup" with your desired search term or pattern
    try {
      final result = await FirebaseStorage.instance.ref().listAll();
      for (var item in result.items) {
        String imageName = path.basenameWithoutExtension(item.name);
        if (_searchTerms.any((term) => imageName.contains(term))) {
          String downloadURL = await item.getDownloadURL();
          imageURLs.add(downloadURL);
        }
      }
    } catch (e) {
      print("Error fetching image URLs: $e");
    }
    return imageURLs;
  }

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
    final selectedIndexProvider =
    Provider.of<SelectedIndexProvider>(context, listen: false);
    _searchTerms = selectedIndexProvider.categoryList;
    fetchImageURLs().then((List<String> urls) {
      setState(() {
        imageURLs = urls;
      });
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
    final selectedIndexProvider =
        Provider.of<SelectedIndexProvider>(context, listen: false);
    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: ColorPalette.mainBasic,
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
        title: Image.asset(
          'assets/main_page/logo.png',
          width: width * 0.3,
        ),
        centerTitle: true,
      ),
      body: ListView(
        children: [
          Padding(
            padding: EdgeInsets.all(width * 0.05),
            child: Stack(
              children: [
                if (selectedIndexProvider.categoryList.isNotEmpty)
                  Column(
                    children: [
                      SizedBox(height: height * 0.1),
                      Row(
                        children: [
                          Row(
                            children: selectedIndexProvider.categoryList
                                .map((category) {
                              if (category == "bottle" || category == "cup") {
                                return Padding(
                                  padding: EdgeInsets.all(width * 0.01),
                                  child: OutlinedButton(
                                    style: OutlinedButton.styleFrom(
                                      backgroundColor:
                                          Colors.green, //<-- SEE HERE
                                    ),
                                    child: Text(category),
                                    onPressed: null,
                                  ),
                                );
                              } else {
                                return Text('');
                              }
                            }).toList(),
                          ),
                        ],
                      ),
                    ],
                  ),
                Image.asset('assets/recommend_page/title.png'),
                Column(
                  children: [
                    SizedBox(
                      height: height * 0.08,
                    ),
                    Image.asset('assets/recommend_page/title2.png')
                  ],
                ),
                Column(
                  children: [
                    SizedBox(
                      height: height * 0.02,
                    ),
                    Row(
                      children: [
                        SizedBox(
                          width: width * 0.7,
                        ),
                        Image.asset('assets/recommend_page/character.png')
                      ],
                    ),
                  ],
                )
              ],
            ),
          ),
          Padding(
            padding: EdgeInsets.all(width * 0.03),
            child: GridView.builder(
              shrinkWrap: true,
              primary: false,
              itemCount: imageURLs.length,
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2),
              itemBuilder: (BuildContext context, int index) {
                return Stack(
                  children: [
                    Padding(
                      padding: EdgeInsets.all(width * 0.02),
                      child: GestureDetector(
                        onTap: () {},
                        child: Image.network(
                          imageURLs[index], // Use the fetched image URL here
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                    // ... (existing code for like and bookmark buttons)
                  ],
                );
              },
            ),
          ),

          // Padding(
          //   padding: EdgeInsets.all(width * 0.03),
          //   child: GridView.builder(
          //       shrinkWrap: true,
          //       primary: false,
          //       itemCount: 14,
          //       gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          //           crossAxisCount: 2),
          //       itemBuilder: (BuildContext context, int index) {
          //         return Stack(
          //           children: [
          //             Padding(
          //               padding: EdgeInsets.all(width * 0.02),
          //               child: GestureDetector(
          //                 onTap: () {},
          //                 child: Image.asset(
          //                   'assets/main_page/img_$index.png',
          //                   // fit: BoxFit.cover,
          //                 ),
          //               ),
          //             ),
          //             Column(
          //               children: [
          //                 SizedBox(
          //                   height: height * 0.2,
          //                 ),
          //                 IconButton(
          //                   padding: EdgeInsets.zero,
          //                   icon: Icon(
          //                     _isLiked[index]
          //                         ? Icons.favorite
          //                         : Icons.favorite_border,
          //                     color:
          //                         _isLiked[index] ? Colors.red : Colors.white,
          //                     size: MediaQuery.of(context).size.width / 20,
          //                   ),
          //                   onPressed: () {
          //                     setState(() {
          //                       _isLiked[index] = !_isLiked[index];
          //                       _isLiked[index]
          //                           ? _likeCount[index]++
          //                           : _likeCount[index]--;
          //                     });
          //                   },
          //                 ),
          //               ],
          //             ),
          //             Row(
          //               children: [
          //                 SizedBox(
          //                   width: width * 0.34,
          //                 ),
          //                 IconButton(
          //                   padding: EdgeInsets.zero,
          //                   icon: Icon(
          //                     _isLiked2[index]
          //                         ? Icons.bookmark
          //                         : Icons.bookmark_border_outlined,
          //                     color: _isLiked2[index]
          //                         ? Colors.black
          //                         : Colors.black,
          //                     size: MediaQuery.of(context).size.width / 20,
          //                   ),
          //                   onPressed: () {
          //                     setState(() {
          //                       _isLiked2[index] = !_isLiked2[index];
          //                       _isLiked2[index]
          //                           ? _likeCount2[index]++
          //                           : _likeCount2[index]--;
          //                     });
          //                   },
          //                 ),
          //               ],
          //             ),
          //           ],
          //         );
          //       }),
          // ),

        ],
      ),
    );
  }
}
