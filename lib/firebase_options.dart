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
    apiKey: 'AIzaSyAu7uroYo3y4VBvsEzCKh4vhbr9bODRoH4',
    appId: '1:84631138096:web:a9c1d770861d34243622f5',
    messagingSenderId: '84631138096',
    projectId: 'fintech-payment-app',
    authDomain: 'fintech-payment-app.firebaseapp.com',
    storageBucket: 'fintech-payment-app.appspot.com',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyARDTZWB8t0JtNRrKDXYbK7VhasBi-UJxQ',
    appId: '1:84631138096:android:6795c819701b2ea53622f5',
    messagingSenderId: '84631138096',
    projectId: 'fintech-payment-app',
    storageBucket: 'fintech-payment-app.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyCzsGRgvhGn-o2pAxxm9JGxxprFjD7Jz5U',
    appId: '1:84631138096:ios:b7e2380be79d6e803622f5',
    messagingSenderId: '84631138096',
    projectId: 'fintech-payment-app',
    storageBucket: 'fintech-payment-app.appspot.com',
    iosBundleId: 'com.example.fintechPaymentApp',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyCzsGRgvhGn-o2pAxxm9JGxxprFjD7Jz5U',
    appId: '1:84631138096:ios:b7e2380be79d6e803622f5',
    messagingSenderId: '84631138096',
    projectId: 'fintech-payment-app',
    storageBucket: 'fintech-payment-app.appspot.com',
    iosBundleId: 'com.example.fintechPaymentApp',
  );

  static const FirebaseOptions windows = FirebaseOptions(
    apiKey: 'AIzaSyAu7uroYo3y4VBvsEzCKh4vhbr9bODRoH4',
    appId: '1:84631138096:web:cee450cd75ff86113622f5',
    messagingSenderId: '84631138096',
    projectId: 'fintech-payment-app',
    authDomain: 'fintech-payment-app.firebaseapp.com',
    storageBucket: 'fintech-payment-app.appspot.com',
  );
}
