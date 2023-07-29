import 'package:flutter/material.dart';
import 'package:onboarding/onboarding.dart';

import '../constants/color_constants.dart';

class OnBoardingPage extends StatefulWidget {
  const OnBoardingPage({Key? key}) : super(key: key);

  @override
  _OnBoardingPageState createState() => _OnBoardingPageState();
}

class _OnBoardingPageState extends State<OnBoardingPage> {
  late GestureDetector materialButton;
  late int index;
  final onboardingPagesList = [
    PageModel(
      widget: DecoratedBox(
        decoration: BoxDecoration(
          color: ColorPalette.trueWhite,
          border: Border.all(
            width: 0.0,
            color: ColorPalette.trueWhite,
          ),
        ),
        child: SingleChildScrollView(
          controller: ScrollController(),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(
                height: 100,
              ),
              Center(
                  child: Image.asset(
                'assets/onboarding_page/onboarding_1_1.png',
                width: 300,
                height: 300,
              )),
              SizedBox(
                height: 50,
              ),
              Center(
                  child: Image.asset(
                'assets/onboarding_page/onboarding_1_2.png',
                width: 200,
              )),
              SizedBox(
                height: 30,
              ),
              Center(
                  child: Image.asset(
                      'assets/onboarding_page/onboarding_1_3.png',
                      width: 200)),
            ],
          ),
        ),
      ),
    ),
    PageModel(
      widget: DecoratedBox(
        decoration: BoxDecoration(
          color: ColorPalette.trueWhite,
          border: Border.all(
            width: 0.0,
            color: ColorPalette.trueWhite,
          ),
        ),
        child: SingleChildScrollView(
          controller: ScrollController(),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(
                height: 100,
              ),
              Center(
                  child: Image.asset(
                'assets/onboarding_page/onboarding_2_1.png',
                width: 300,
                height: 300,
              )),
              SizedBox(
                height: 50,
              ),
              Center(
                  child: Image.asset(
                'assets/onboarding_page/onboarding_2_2.png',
                width: 200,
              )),
              SizedBox(
                height: 30,
              ),
              Center(
                  child: Image.asset(
                      'assets/onboarding_page/onboarding_2_3.png',
                      width: 200)),
            ],
          ),
        ),
      ),
    ),
    PageModel(
      widget: DecoratedBox(
        decoration: BoxDecoration(
          color: ColorPalette.trueWhite,
          border: Border.all(
            width: 0.0,
            color: ColorPalette.trueWhite,
          ),
        ),
        child: SingleChildScrollView(
          controller: ScrollController(),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(
                height: 100,
              ),
              Center(
                  child: Image.asset(
                'assets/onboarding_page/onboarding_3_1.png',
                width: 300,
                height: 300,
              )),
              SizedBox(
                height: 50,
              ),
              Center(
                  child: Image.asset(
                'assets/onboarding_page/onboarding_3_2.png',
                width: 200,
              )),
              SizedBox(
                height: 30,
              ),
              Center(
                  child: Image.asset(
                      'assets/onboarding_page/onboarding_3_3.png',
                      width: 200)),
            ],
          ),
        ),
      ),
    ),
  ];

  @override
  void initState() {
    super.initState();
    materialButton = _skipButton();
    index = 0;
  }

  GestureDetector _skipButton({void Function(int)? setIndex}) {
    return GestureDetector(
      child: Image.asset(
        'assets/onboarding_page/next_button.png',
        width: 250,
        height: 100,
      ),
      onTap: (){
        if (setIndex != null) {
          if (setIndex != 2) {
            index = index + 1;
            setIndex(index);
          } else {
            index = 2;
            setIndex(2);
          }
        }
      },
    );
  }

  GestureDetector get _signupButton {
    return GestureDetector(
      child: Image.asset(
        'assets/onboarding_page/confirm_button.png',
        width: 250,
        height: 100,
      ),
      onTap: (){
        Navigator.pushNamed(context, '/login_page');
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: Scaffold(
        backgroundColor: ColorPalette.trueWhite,
        body: Onboarding(
          pages: onboardingPagesList,
          onPageChange: (int pageIndex) {
            index = pageIndex;
          },
          startPageIndex: 0,
          footerBuilder: (context, dragDistance, pagesLength, setIndex) {
            return index == pagesLength - 1
                ? _signupButton
                : _skipButton(setIndex: setIndex);
          },
        ),
      ),
    );
  }
}
