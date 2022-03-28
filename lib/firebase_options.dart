// File generated by FlutterFire CLI.
// ignore_for_file: lines_longer_than_80_chars
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
    // ignore: missing_enum_constant_in_switch
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
    }

    throw UnsupportedError(
      'DefaultFirebaseOptions are not supported for this platform.',
    );
  }

  static const FirebaseOptions web = FirebaseOptions(
    apiKey: 'AIzaSyB1cUTv-OmW8SdX4c7Q8Ig2sutaenJFopM',
    appId: '1:943591895548:web:bc06d34476c44499b88279',
    messagingSenderId: '943591895548',
    projectId: 'shop-app-69a8e',
    authDomain: 'shop-app-69a8e.firebaseapp.com',
    storageBucket: 'shop-app-69a8e.appspot.com',
    measurementId: 'G-6KC32KRT8D',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyBFetLRTHXqaV0Equr4nlJoPQcaceulyyw',
    appId: '1:943591895548:android:c08e61fe5ae66cccb88279',
    messagingSenderId: '943591895548',
    projectId: 'shop-app-69a8e',
    storageBucket: 'shop-app-69a8e.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyAdS37V_0mnQEVYm_xsgqT9lircw6LoLMg',
    appId: '1:943591895548:ios:56d23f5bc0820aa2b88279',
    messagingSenderId: '943591895548',
    projectId: 'shop-app-69a8e',
    storageBucket: 'shop-app-69a8e.appspot.com',
    iosClientId: '943591895548-skghf6dbvftq7mc5o8vu6nn4kj6jhmip.apps.googleusercontent.com',
    iosBundleId: 'com.example.shopApp',
  );
}
