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
    apiKey: 'AIzaSyAtIHI4S_MxdveYEo8QMTnYEvjStoXnHoM',
    appId: '1:466171900772:web:f358cb073c0d4a2ee28071',
    messagingSenderId: '466171900772',
    projectId: 'se380project-d7026',
    authDomain: 'se380project-d7026.firebaseapp.com',
    databaseURL: 'https://se380project-d7026-default-rtdb.europe-west1.firebasedatabase.app',
    storageBucket: 'se380project-d7026.firebasestorage.app',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyABkxzv-NnMl16d95rz1rmYHfLWmgjwUag',
    appId: '1:466171900772:android:bdf3a998ff2891d0e28071',
    messagingSenderId: '466171900772',
    projectId: 'se380project-d7026',
    databaseURL: 'https://se380project-d7026-default-rtdb.europe-west1.firebasedatabase.app',
    storageBucket: 'se380project-d7026.firebasestorage.app',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyA5b4i2npFrwVT64x3YWMozriNRXjxOKbs',
    appId: '1:466171900772:ios:bd3e70b640ea96e2e28071',
    messagingSenderId: '466171900772',
    projectId: 'se380project-d7026',
    databaseURL: 'https://se380project-d7026-default-rtdb.europe-west1.firebasedatabase.app',
    storageBucket: 'se380project-d7026.firebasestorage.app',
    androidClientId: '466171900772-scvg7d1a98khcr9gq8b0kfd8lhkvud7o.apps.googleusercontent.com',
    iosClientId: '466171900772-vu5r6tsa62h8vl5a5824i04j2jknhb9p.apps.googleusercontent.com',
    iosBundleId: 'com.example.se380Project',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyA5b4i2npFrwVT64x3YWMozriNRXjxOKbs',
    appId: '1:466171900772:ios:bd3e70b640ea96e2e28071',
    messagingSenderId: '466171900772',
    projectId: 'se380project-d7026',
    databaseURL: 'https://se380project-d7026-default-rtdb.europe-west1.firebasedatabase.app',
    storageBucket: 'se380project-d7026.firebasestorage.app',
    androidClientId: '466171900772-scvg7d1a98khcr9gq8b0kfd8lhkvud7o.apps.googleusercontent.com',
    iosClientId: '466171900772-vu5r6tsa62h8vl5a5824i04j2jknhb9p.apps.googleusercontent.com',
    iosBundleId: 'com.example.se380Project',
  );

  static const FirebaseOptions windows = FirebaseOptions(
    apiKey: 'AIzaSyAtIHI4S_MxdveYEo8QMTnYEvjStoXnHoM',
    appId: '1:466171900772:web:e7ecaeabb845f86fe28071',
    messagingSenderId: '466171900772',
    projectId: 'se380project-d7026',
    authDomain: 'se380project-d7026.firebaseapp.com',
    databaseURL: 'https://se380project-d7026-default-rtdb.europe-west1.firebasedatabase.app',
    storageBucket: 'se380project-d7026.firebasestorage.app',
  );

}