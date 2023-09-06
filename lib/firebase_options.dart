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
    apiKey: 'AIzaSyAh8PaUPGH-nMHt1AdLoUU-n8dFgsUVaRU',
    appId: '1:825794864776:web:18be633f572beb87cea13d',
    messagingSenderId: '825794864776',
    projectId: 'puzzle-web-79c25',
    authDomain: 'puzzle-web-79c25.firebaseapp.com',
    storageBucket: 'puzzle-web-79c25.appspot.com',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyBTct5aDfrIZe8r0JzZ8sYJg6i-bZ8B9yw',
    appId: '1:825794864776:android:eca0418379e60ee0cea13d',
    messagingSenderId: '825794864776',
    projectId: 'puzzle-web-79c25',
    storageBucket: 'puzzle-web-79c25.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyDDtNIn4g8tkvKtZJHGCUVcp2APeaYu4yc',
    appId: '1:825794864776:ios:8dff5723970a3742cea13d',
    messagingSenderId: '825794864776',
    projectId: 'puzzle-web-79c25',
    storageBucket: 'puzzle-web-79c25.appspot.com',
    iosClientId: '825794864776-nua0g6549jc9ojl76hmhd6jok4gtsa5i.apps.googleusercontent.com',
    iosBundleId: 'com.souvikbiswas.myFlutterPuzzle',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyDDtNIn4g8tkvKtZJHGCUVcp2APeaYu4yc',
    appId: '1:825794864776:ios:8dff5723970a3742cea13d',
    messagingSenderId: '825794864776',
    projectId: 'puzzle-web-79c25',
    storageBucket: 'puzzle-web-79c25.appspot.com',
    iosClientId: '825794864776-nua0g6549jc9ojl76hmhd6jok4gtsa5i.apps.googleusercontent.com',
    iosBundleId: 'com.souvikbiswas.myFlutterPuzzle',
  );
}