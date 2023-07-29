import 'package:flutter/material.dart';

class CategoryPage extends StatefulWidget {
  const CategoryPage({Key? key}) : super(key: key);

  @override
  _CategoryPageState createState() => _CategoryPageState();
}

class _CategoryPageState extends State<CategoryPage> {

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SizedBox(height:height*0.05,),
          Center(
            child: Image.asset('assets/category_page/category_1.png',
            width: width*0.7,),
          ),
          SizedBox(height:height*0.05,),
          Image.asset('assets/category_page/category_2.png',
            width: width*0.7,),
          SizedBox(height:height*0.05,),
          GestureDetector(
            child: Image.asset('assets/category_page/next_button.png',
              width: width*0.7,),
            onTap: (){
              Navigator.pushNamed(context, '/bottom_navigator_page');
            },
          ),
          SizedBox(height:height*0.05,),
          Image.asset('assets/category_page/category_4.png',
            width: width*0.5,),
        ],
      ),
    );
  }
}
