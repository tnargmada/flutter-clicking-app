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

  static const FirebaseOptions web = FirebaseOptions(
    apiKey: 'AIzaSyDrmnmKofJeZ95Mp-rMhD_PM_uVxHuiLhw',
    appId: '1:175929559218:web:5c7aaa06a3451ae33061ab',
    messagingSenderId: '175929559218',
    projectId: 'flutter-clicking-app',
    authDomain: 'flutter-clicking-app.firebaseapp.com',
    storageBucket: 'flutter-clicking-app.appspot.com',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyAzBEGvUexYPaVT_Csv0JHiwK9gIL7F52E',
    appId: '1:175929559218:android:882ec2fb503e80823061ab',
    messagingSenderId: '175929559218',
    projectId: 'flutter-clicking-app',
    storageBucket: 'flutter-clicking-app.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyCketJ-OtW56B1ryBqSzjIxJUOmzbmC8NA',
    appId: '1:175929559218:ios:7a9c0c93ea6e716e3061ab',
    messagingSenderId: '175929559218',
    projectId: 'flutter-clicking-app',
    storageBucket: 'flutter-clicking-app.appspot.com',
    iosClientId: '175929559218-skcf0smom0pvu7fvvbfktdlkphdm8cpi.apps.googleusercontent.com',
    iosBundleId: 'com.example.clickingApp',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyCketJ-OtW56B1ryBqSzjIxJUOmzbmC8NA',
    appId: '1:175929559218:ios:91104d0037e26d233061ab',
    messagingSenderId: '175929559218',
    projectId: 'flutter-clicking-app',
    storageBucket: 'flutter-clicking-app.appspot.com',
    iosClientId: '175929559218-blv7vtcetu8ss1mj6tq4qpf8vi3md0hr.apps.googleusercontent.com',
    iosBundleId: 'com.example.clickingApp.RunnerTests',
  );
}