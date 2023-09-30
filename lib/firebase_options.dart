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
    apiKey: 'AIzaSyBAjXAKzjiw4epgNJeY3gIpTmQDMGGbjBA',
    appId: '1:220735521163:web:f1b5ee9f44b228dca16f8e',
    messagingSenderId: '220735521163',
    projectId: 'carbonapp-dce72',
    authDomain: 'carbonapp-dce72.firebaseapp.com',
    storageBucket: 'carbonapp-dce72.appspot.com',
    measurementId: 'G-3QLYERPTCC',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyBk2OTJAUfdHMLN3Z8g0hU7g0iWrE1Pybg',
    appId: '1:220735521163:android:a3e148c7574512ffa16f8e',
    messagingSenderId: '220735521163',
    projectId: 'carbonapp-dce72',
    storageBucket: 'carbonapp-dce72.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyAAleQqOniZ-eHxG_xdmi_57BKYHrJhA2Y',
    appId: '1:220735521163:ios:738ebbfeddc4e984a16f8e',
    messagingSenderId: '220735521163',
    projectId: 'carbonapp-dce72',
    storageBucket: 'carbonapp-dce72.appspot.com',
    iosBundleId: 'com.example.healthiercarbon',
  );
}
