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
    apiKey: 'AIzaSyAHwRS5y1ynF3ykOwQWyrtfJESa_or7Uow',
    appId: '1:749319995610:web:3c29359316b5777afee5e3',
    messagingSenderId: '749319995610',
    projectId: 'innolympics-sanetech',
    authDomain: 'innolympics-sanetech.firebaseapp.com',
    storageBucket: 'innolympics-sanetech.appspot.com',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyCSHe1aCpb9khbiRPWar7HwfEgJDCszjZE',
    appId: '1:749319995610:android:328d57491e5e9ff1fee5e3',
    messagingSenderId: '749319995610',
    projectId: 'innolympics-sanetech',
    storageBucket: 'innolympics-sanetech.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyDtzhoazdy1SAlUS9z1tGQ7WqkQV1yCXtQ',
    appId: '1:749319995610:ios:b545c4181634465efee5e3',
    messagingSenderId: '749319995610',
    projectId: 'innolympics-sanetech',
    storageBucket: 'innolympics-sanetech.appspot.com',
    iosBundleId: 'com.example.innolympicsSanetech',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyDtzhoazdy1SAlUS9z1tGQ7WqkQV1yCXtQ',
    appId: '1:749319995610:ios:b545c4181634465efee5e3',
    messagingSenderId: '749319995610',
    projectId: 'innolympics-sanetech',
    storageBucket: 'innolympics-sanetech.appspot.com',
    iosBundleId: 'com.example.innolympicsSanetech',
  );

  static const FirebaseOptions windows = FirebaseOptions(
    apiKey: 'AIzaSyAHwRS5y1ynF3ykOwQWyrtfJESa_or7Uow',
    appId: '1:749319995610:web:fa80c2238dc238d6fee5e3',
    messagingSenderId: '749319995610',
    projectId: 'innolympics-sanetech',
    authDomain: 'innolympics-sanetech.firebaseapp.com',
    storageBucket: 'innolympics-sanetech.appspot.com',
  );

}