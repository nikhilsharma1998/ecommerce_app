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
    apiKey: 'AIzaSyBVs_KvPVLUDqUOec93jyGKe2ZnT6vIH1Y',
    appId: '1:239471776537:web:dd3d027f4f2f6416586b88',
    messagingSenderId: '239471776537',
    projectId: 'ecommerceapp-65d31',
    authDomain: 'ecommerceapp-65d31.firebaseapp.com',
    storageBucket: 'ecommerceapp-65d31.appspot.com',
    measurementId: 'G-FDGTV5ZC63',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyCDpsCRX5IUTz-Xr5iLyCi8fIu8RqE8UNA',
    appId: '1:239471776537:android:5a9b0a91f02fc15f586b88',
    messagingSenderId: '239471776537',
    projectId: 'ecommerceapp-65d31',
    storageBucket: 'ecommerceapp-65d31.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyBM9q1e576uA9UuuP59mA1EoQuJqMo9guQ',
    appId: '1:239471776537:ios:f8bdf92ea9a3a7b6586b88',
    messagingSenderId: '239471776537',
    projectId: 'ecommerceapp-65d31',
    storageBucket: 'ecommerceapp-65d31.appspot.com',
    iosBundleId: 'com.example.taskApp',
  );

}