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

  static const FirebaseOptions web = FirebaseOptions(
    apiKey: 'AIzaSyDM9kvR0cepG1JIDt5S9QRcUJWkATiSwqc',
    appId: '1:591968216080:web:5e662b52ba7738c0679695',
    messagingSenderId: '591968216080',
    projectId: 'teste-356814',
    authDomain: 'teste-356814.firebaseapp.com',
    storageBucket: 'teste-356814.appspot.com',
    measurementId: 'G-VJG40CSXCH',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyCFolttdGQGOj0oee28SpZv5sNIPo0sjac',
    appId: '1:591968216080:android:0cfc68d0c3938d1e679695',
    messagingSenderId: '591968216080',
    projectId: 'teste-356814',
    storageBucket: 'teste-356814.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyAvwHE78Z9EAiYSuTyx4dRoyahanRho9-k',
    appId: '1:591968216080:ios:bbf91fd722189c39679695',
    messagingSenderId: '591968216080',
    projectId: 'teste-356814',
    storageBucket: 'teste-356814.appspot.com',
    iosClientId: '591968216080-5kcm2qifpfhofkglvfk1l32mrnokj3gk.apps.googleusercontent.com',
    iosBundleId: 'com.example.ipheira',
  );
}