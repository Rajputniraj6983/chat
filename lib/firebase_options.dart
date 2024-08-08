// File generated by FlutterFire CLI.
// ignore_for_file: type=lint
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
      return web;
    }
    switch (defaultTargetPlatform) {
      case TargetPlatform.android:
        return android;
      case TargetPlatform.iOS:
        return ios;
      case TargetPlatform.macOS:
        return macos;
      case TargetPlatform.windows:
        return windows;
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

  static const FirebaseOptions web = FirebaseOptions(
    apiKey: 'AIzaSyDWxgwxa4aiX1HSye-jfBG_9BYhfrXUh5c',
    appId: '1:25593804544:web:2981195f13b2318086e5e5',
    messagingSenderId: '25593804544',
    projectId: 'chat-b2904',
    authDomain: 'chat-b2904.firebaseapp.com',
    storageBucket: 'chat-b2904.appspot.com',
    measurementId: 'G-YPR7LC59M4',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyCfYKZylYcaZxUwa-2QDc4ZhjWJGvHSjEE',
    appId: '1:25593804544:android:33915cbdf7f76faf86e5e5',
    messagingSenderId: '25593804544',
    projectId: 'chat-b2904',
    storageBucket: 'chat-b2904.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyAWDw6aQRmZi748H8Vxhhh40t2U-oKh1bs',
    appId: '1:25593804544:ios:033083c04090e07a86e5e5',
    messagingSenderId: '25593804544',
    projectId: 'chat-b2904',
    storageBucket: 'chat-b2904.appspot.com',
    iosBundleId: 'com.example.chat',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyAWDw6aQRmZi748H8Vxhhh40t2U-oKh1bs',
    appId: '1:25593804544:ios:033083c04090e07a86e5e5',
    messagingSenderId: '25593804544',
    projectId: 'chat-b2904',
    storageBucket: 'chat-b2904.appspot.com',
    iosBundleId: 'com.example.chat',
  );

  static const FirebaseOptions windows = FirebaseOptions(
    apiKey: 'AIzaSyDWxgwxa4aiX1HSye-jfBG_9BYhfrXUh5c',
    appId: '1:25593804544:web:d7ab2e50391b3c7786e5e5',
    messagingSenderId: '25593804544',
    projectId: 'chat-b2904',
    authDomain: 'chat-b2904.firebaseapp.com',
    storageBucket: 'chat-b2904.appspot.com',
    measurementId: 'G-RJJSTGGX3M',
  );

}