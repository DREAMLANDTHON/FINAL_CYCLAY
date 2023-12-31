// File generated by FlutterFire CLI.
// ignore_for_file: lines_longer_than_80_chars, avoid_classes_with_only_static_members
import 'package:firebase_core/firebase_core.dart' show FirebaseOptions;
import 'package:flutter/foundation.dart'
    show defaultTargetPlatform, kIsWeb, TargetPlatform;

/// Default [FirebaseOptions] for use with your Firebase apps.
///
/// Example:
/// ```dart
/// import 'firebase_options.dart';
/// // ...
/// await Firebase.initializeApp(
///   options: DefaultFirebaseOptions.currentPlatform,
/// );
/// ```
class DefaultFirebaseOptions {
  static FirebaseOptions get currentPlatform {
    if (kIsWeb) {
      throw UnsupportedError(
        'DefaultFirebaseOptions have not been configured for web - '
        'you can reconfigure this by running the FlutterFire CLI again.',
      );
    }
    switch (defaultTargetPlatform) {
      case TargetPlatform.android:
        return android;
      case TargetPlatform.iOS:
        return ios;
      case TargetPlatform.macOS:
        throw UnsupportedError(
          'DefaultFirebaseOptions have not been configured for macos - '
          'you can reconfigure this by running the FlutterFire CLI again.',
        );
      case TargetPlatform.windows:
        throw UnsupportedError(
          'DefaultFirebaseOptions have not been configured for windows - '
          'you can reconfigure this by running the FlutterFire CLI again.',
        );
      case TargetPlatform.linux:
        throw UnsupportedError(
          'DefaultFirebaseOptions have not been configured for linux - '
          'you can reconfigure this by running the FlutterFire CLI again.',
        );
      default:
        throw UnsupportedError(
          'DefaultFirebaseOptions are not supported for this platform.',
        );
    }
  }

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyCt4CgvsjFd-rAIDWWKsygnJmr7ntctbhY',
    appId: '1:1005162673751:android:d340f89e14b75a2a2ed512',
    messagingSenderId: '1005162673751',
    projectId: 'cyclay-2bed7',
    storageBucket: 'cyclay-2bed7.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyDhn-0526LznEmKepbIwUNa42LPGkNb8SE',
    appId: '1:1005162673751:ios:fc8f901f4643f0352ed512',
    messagingSenderId: '1005162673751',
    projectId: 'cyclay-2bed7',
    storageBucket: 'cyclay-2bed7.appspot.com',
    androidClientId: '1005162673751-fbbkm5754jugojhlr6f8a1vtlagignu0.apps.googleusercontent.com',
    iosClientId: '1005162673751-mha5aqsldm7ottc33isc5ef52h8r9crr.apps.googleusercontent.com',
    iosBundleId: 'com.example.finalCyclay',
  );
}
