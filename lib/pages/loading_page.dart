import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class LoadingPage extends StatefulWidget{
  @override
  _LoadingPageState createState() => _LoadingPageState();
}

class _LoadingPageState extends State<LoadingPage> {
  int _count = 0;

  var imgList = ['assets/my_page/character_r.png', 'assets/my_page/character_b.png',
    'assets/my_page/character_y.png', 'assets/my_page/character_g.png'];

  Timer? timer;
  double? width;
  double? height;

  void initState(){
    Timer.periodic(const Duration(milliseconds: 500), (Timer t){
      final isLast = _count==imgList.length - 1;
      setState(() => _count=isLast ?0 :_count + 1);
    });
    super.initState();
  }
  @override
  Widget build(BuildContext context){
    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        SizedBox(
          height: height*0.2,
        ),
        AnimatedSwitcher(duration: Duration(milliseconds: 50),
          transitionBuilder: (Widget child, Animation<double> animation){
            return FadeTransition(child: child, opacity: animation);
          },
          child: Container(
            child: SizedBox(
                width:MediaQuery.of(context).size.width / 5,
                height:MediaQuery.of(context).size.height / 10,
                child: Image.asset(imgList[_count])),
          ),
          key:ValueKey<int>(_count),
        ),
        SizedBox(height : MediaQuery.of(context).size.height*0.02),
        Image.asset('assets/my_page/loading_message.png')
      ],
    );
  }
}
