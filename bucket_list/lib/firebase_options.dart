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
    apiKey: 'AIzaSyBgGfoR_iDVY-IyKmdX6rtph5mz63ONRgA',
    appId: '1:156745385964:android:cd23b3c80e3f2381b362c9',
    messagingSenderId: '156745385964',
    projectId: 'bucketlist-8a6cd',
    databaseURL: 'https://bucketlist-8a6cd-default-rtdb.firebaseio.com',
    storageBucket: 'bucketlist-8a6cd.firebasestorage.app',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyD5Nmx1A9xUYlKX_eprmwySGf3kk9W23OM',
    appId: '1:156745385964:ios:cab16194da1404beb362c9',
    messagingSenderId: '156745385964',
    projectId: 'bucketlist-8a6cd',
    databaseURL: 'https://bucketlist-8a6cd-default-rtdb.firebaseio.com',
    storageBucket: 'bucketlist-8a6cd.firebasestorage.app',
    iosBundleId: 'com.example.bucketList',
  );
}
