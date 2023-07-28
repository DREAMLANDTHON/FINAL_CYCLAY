import 'package:flutter/material.dart';

import 'login_page.dart';

class StartPage extends StatefulWidget {
  const StartPage({Key? key}) : super(key: key);

  @override
  _StartPageState createState() => _StartPageState();
}

class _StartPageState extends State<StartPage> {
  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Center(child: Image.asset('assets/start_page/logo.png')),
          SizedBox(
            height: height*0.3,
          ),
          GestureDetector(
            onTap: (){
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(builder: (context) => LoginPage()),
              );
            },
            child: Image.asset('assets/start_page/login_button.png'),
          ),
          SizedBox(
            height: height*0.01,
          ),
          GestureDetector(
            onTap: (){
              print("SignUp Click!");
            },
            child: Image.asset('assets/start_page/signup_button.png'),
          ),        ],
      ),

    );
  }
}
