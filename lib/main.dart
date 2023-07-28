import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:final_cyclay/pages/loading_page.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'constants/color_constants.dart';
import 'firebase_options.dart';
import 'pages/buttom_navigator_page.dart';
import 'pages/category_register_page.dart';
import 'pages/login_page.dart';
import 'pages/main_page.dart';
import 'pages/my_page.dart';
import 'pages/splash_page.dart';
import 'pages/start_page.dart';
import 'providers/auth_provider.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized(); // Ensure that the binding is initialized
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  SharedPreferences prefs = await SharedPreferences.getInstance();
  runApp(MyApp(prefs: prefs));
}

class MyApp extends StatelessWidget {
  final SharedPreferences prefs;
  final FirebaseFirestore firebaseFirestore = FirebaseFirestore.instance;
  final FirebaseStorage firebaseStorage = FirebaseStorage.instance;
  MyApp({required this.prefs});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {

    return MultiProvider(
      providers: [
        ChangeNotifierProvider<AuthProvider>(
          create: (_) => AuthProvider(
            firebaseAuth: FirebaseAuth.instance,
            googleSignIn: GoogleSignIn(),
            prefs: this.prefs,
            firebaseFirestore: this.firebaseFirestore,
          ),
        ),
      ],
      child: MaterialApp(
        title: 'Handong Manna',
        theme: ThemeData(scaffoldBackgroundColor: ColorPalette.trueWhite),
        initialRoute: '/splash',
        onGenerateRoute: (settings){
          switch (settings.name){
            case '/splash':
              return MaterialPageRoute(builder: (context)=>SplashPage());
            case '/register':
              return MaterialPageRoute(builder: (context)=>CategoryRegisterPage());
            case '/start_page':
              return MaterialPageRoute(builder: (context)=>StartPage());
            case '/login_page':
              return MaterialPageRoute(builder: (context)=>LoginPage());
            case '/bottom_navigator_page':
              return MaterialPageRoute(builder: (context)=>BottomNavigatorPage());
            case '/loading_page':
              return MaterialPageRoute(builder: (context)=>LoadingPage());
          }
        },
        // routes: {
        //   // For Passing arguments
        //   '/chat_profile': (BuildContext context) => ChatProfilePage()
        // },
      ),
    );
  }
}