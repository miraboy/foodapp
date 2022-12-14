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
    apiKey: 'AIzaSyCMkHEoj1tdX7Qp9_PCHAowVqT-WT9sUbw',
    appId: '1:973908807827:web:74c99e2104f7911e77fd66',
    messagingSenderId: '973908807827',
    projectId: 'foodapp-5e4fd',
    authDomain: 'foodapp-5e4fd.firebaseapp.com',
    storageBucket: 'foodapp-5e4fd.appspot.com',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyBLYd4EDNssQI_m-OwbrwY0mPuey9CZRPw',
    appId: '1:973908807827:android:a95fa58473708ff877fd66',
    messagingSenderId: '973908807827',
    projectId: 'foodapp-5e4fd',
    storageBucket: 'foodapp-5e4fd.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyCoHppByz2k7KYfmmEEze8FMR2u49zYG6s',
    appId: '1:973908807827:ios:a25312ce860c715c77fd66',
    messagingSenderId: '973908807827',
    projectId: 'foodapp-5e4fd',
    storageBucket: 'foodapp-5e4fd.appspot.com',
    iosClientId: '973908807827-mkk80d0u1ancnafv2u46v73kvm2s5i4g.apps.googleusercontent.com',
    iosBundleId: 'com.example.foodapp',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyCoHppByz2k7KYfmmEEze8FMR2u49zYG6s',
    appId: '1:973908807827:ios:a25312ce860c715c77fd66',
    messagingSenderId: '973908807827',
    projectId: 'foodapp-5e4fd',
    storageBucket: 'foodapp-5e4fd.appspot.com',
    iosClientId: '973908807827-mkk80d0u1ancnafv2u46v73kvm2s5i4g.apps.googleusercontent.com',
    iosBundleId: 'com.example.foodapp',
  );
}
