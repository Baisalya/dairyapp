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
    apiKey: 'AIzaSyA7BpM0h0oQPY5B87_URxQnMtJQS2XS6VI',
    appId: '1:540266310547:web:777dbba65e746022b15666',
    messagingSenderId: '540266310547',
    projectId: 'dairyapp-8710b',
    authDomain: 'dairyapp-8710b.firebaseapp.com',
    storageBucket: 'dairyapp-8710b.appspot.com',
    measurementId: 'G-S42MLKJWPG',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyDh6WB4pNQEj--9nsjz56S0yV5-VbaQljw',
    appId: '1:540266310547:android:e8711bd3fbd0a7f3b15666',
    messagingSenderId: '540266310547',
    projectId: 'dairyapp-8710b',
    storageBucket: 'dairyapp-8710b.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyBCiQS9ld8WerzTbeLy0HDGkbFj1_iGsF4',
    appId: '1:540266310547:ios:2e7b4a08f501879fb15666',
    messagingSenderId: '540266310547',
    projectId: 'dairyapp-8710b',
    storageBucket: 'dairyapp-8710b.appspot.com',
    androidClientId: '540266310547-mab4u5k3paflaj4rg0g1ft16o2vo31ej.apps.googleusercontent.com',
    iosClientId: '540266310547-vus7n832qh00k6rc0o6nbukn55di7t9g.apps.googleusercontent.com',
    iosBundleId: 'com.dairy.dairyapp',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyBCiQS9ld8WerzTbeLy0HDGkbFj1_iGsF4',
    appId: '1:540266310547:ios:2e7b4a08f501879fb15666',
    messagingSenderId: '540266310547',
    projectId: 'dairyapp-8710b',
    storageBucket: 'dairyapp-8710b.appspot.com',
    androidClientId: '540266310547-mab4u5k3paflaj4rg0g1ft16o2vo31ej.apps.googleusercontent.com',
    iosClientId: '540266310547-vus7n832qh00k6rc0o6nbukn55di7t9g.apps.googleusercontent.com',
    iosBundleId: 'com.dairy.dairyapp',
  );

}