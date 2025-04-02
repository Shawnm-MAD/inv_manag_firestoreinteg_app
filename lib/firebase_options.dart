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
    apiKey: 'AIzaSyDIlhnPLSUqrjXDVGbQxMh1ahDnqmUNqBQ',
    appId: '1:388379833513:web:420180e060a0fbe88265b8',
    messagingSenderId: '388379833513',
    projectId: 'ca12-88a9b',
    authDomain: 'ca12-88a9b.firebaseapp.com',
    storageBucket: 'ca12-88a9b.firebasestorage.app',
    measurementId: 'G-BC79D4JLX4',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyCDJjSAlPe_4JiruYySgwzu59jRRO0j66E',
    appId: '1:388379833513:android:ae10fb9cdb4208858265b8',
    messagingSenderId: '388379833513',
    projectId: 'ca12-88a9b',
    storageBucket: 'ca12-88a9b.firebasestorage.app',
  );
}
