import 'package:final_cyclay/pages/buttom_navigator_page.dart';
import 'package:final_cyclay/pages/category_register_page.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:fluttertoast/fluttertoast.dart';

import '../providers/auth_provider.dart';
import 'main_page.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final TextEditingController _email = TextEditingController();
  final TextEditingController _password = TextEditingController();

  String get emailText => _email.text;

  String get passwordText => _password.text;

  @override
  Widget build(BuildContext context) {
    AuthProvider authProvider = Provider.of<AuthProvider>(context);
    switch (authProvider.status) {
      case Status.authenticateError:
        Fluttertoast.showToast(msg: "Sign in fail");
        break;
      case Status.authenticateCanceled:
        Fluttertoast.showToast(msg: "Sign in canceled");
        break;
      case Status.authenticated:
        Fluttertoast.showToast(msg: "Sign in success");
        break;
      default:
        break;
    }

    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(
              height: height * 0.15,
            ),
            Center(child: Image.asset('assets/main_page/logo.png',
            height: height*0.15,
            width: width*0.6,)),
            SizedBox(
              height: height * 0.15,
            ),
            SizedBox(
              width: width * 0.72,
              child: TextField(
                controller: _email,
                decoration: InputDecoration(
                  hintText: 'E-Mail',
                ),
                obscureText: true,
              ),
            ),
            SizedBox(
              width: width * 0.72,
              child: TextField(
                controller: _email,
                decoration: InputDecoration(
                    hintText: 'Password',
                    suffixIcon: IconButton(
                      icon: Icon(Icons.remove_red_eye, color: Colors.grey),
                      onPressed: () {},
                    )),
                obscureText: true,
              ),
            ),
            SizedBox(
              height: height * 0.03,
            ),
            GestureDetector(
              onTap: () {
                print("SignUp Clickdsad!");
              },
              child: Image.asset('assets/login_page/login_button.png'),
            ),
            SizedBox(
              height: height * 0.03,
            ),
            Image.asset('assets/login_page/find_text.png'),
            SizedBox(
              height: height * 0.1,
            ),
            Image.asset('assets/login_page/line.png'),
            SizedBox(
              height: height * 0.04,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Image.asset(
                    'assets/login_page/kakaotalk.png',
                    height: height * 0.08, width: width * 0.08
                ),
                SizedBox(
                  width: width * 0.03,
                ),
                Image.asset('assets/login_page/naver.png',
                    height: height * 0.08, width: width * 0.08),
                SizedBox(
                  width: width * 0.03,
                ),
                Image.asset('assets/login_page/facebook.png',
                    height: height * 0.08, width: width * 0.08),
                SizedBox(
                  width: width * 0.03,
                ),
                GestureDetector(
                  onTap: () {
                    authProvider.handleSignIn().then((isSuccess) {
                      if (isSuccess) {
                        if(authProvider.first()){
                          Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(
                              builder: (context) => CategoryRegisterPage(),
                            ),
                          );
                        }
                        else{
                          Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(
                              builder: (context) => CategoryRegisterPage(),
                            ),
                          );
                        }
                      }
                    }).catchError((error, stackTrace) {
                      Fluttertoast.showToast(msg: error.toString());
                      authProvider.handleException();
                    });
                  },
                  child: Image.asset('assets/login_page/google.png',
                      height: height * 0.08, width: width * 0.08),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
