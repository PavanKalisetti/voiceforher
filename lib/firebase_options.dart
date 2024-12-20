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
        throw UnsupportedError(
          'DefaultFirebaseOptions have not been configured for ios - '
          'you can reconfigure this by running the FlutterFire CLI again.',
        );
      case TargetPlatform.macOS:
        throw UnsupportedError(
          'DefaultFirebaseOptions have not been configured for macos - '
          'you can reconfigure this by running the FlutterFire CLI again.',
        );
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
    apiKey: 'AIzaSyA2RAw3Jy4b_OQfAL08pEhrj7XJwiteFHk',
    appId: '1:671167689132:web:0b76ade109c84b9691ca09',
    messagingSenderId: '671167689132',
    projectId: 'voiceforher-728b6',
    authDomain: 'voiceforher-728b6.firebaseapp.com',
    storageBucket: 'voiceforher-728b6.firebasestorage.app',
    measurementId: 'G-4F872ECMTK',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyAr67v4tIAvzgZWBv1kZ4db9q7a_AzLzaE',
    appId: '1:671167689132:android:59f3579216b5b45d91ca09',
    messagingSenderId: '671167689132',
    projectId: 'voiceforher-728b6',
    storageBucket: 'voiceforher-728b6.firebasestorage.app',
  );

  static const FirebaseOptions windows = FirebaseOptions(
    apiKey: 'AIzaSyA2RAw3Jy4b_OQfAL08pEhrj7XJwiteFHk',
    appId: '1:671167689132:web:1de45532f3882cc791ca09',
    messagingSenderId: '671167689132',
    projectId: 'voiceforher-728b6',
    authDomain: 'voiceforher-728b6.firebaseapp.com',
    storageBucket: 'voiceforher-728b6.firebasestorage.app',
    measurementId: 'G-JKXKCSRMME',
  );
}
