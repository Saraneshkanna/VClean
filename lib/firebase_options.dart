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
    apiKey: 'AIzaSyAIUDZtXkSh25L9UvSgvBhFLaLgNgA_9Ng',
    appId: '1:750126735829:web:81c4cfc173baacc4c55d5c',
    messagingSenderId: '750126735829',
    projectId: 'vclean-1a5a5',
    authDomain: 'vclean-1a5a5.firebaseapp.com',
    storageBucket: 'vclean-1a5a5.appspot.com',
    measurementId: 'G-1Q79F7LQB3',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyCY1F7zFUi2OnZgKSYGq0_ctfZKo8Qy6ec',
    appId: '1:750126735829:android:7d14a762487fb558c55d5c',
    messagingSenderId: '750126735829',
    projectId: 'vclean-1a5a5',
    storageBucket: 'vclean-1a5a5.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyDyB1Wu9AVldAr4RbagK_um7eOxGnqnvxo',
    appId: '1:750126735829:ios:197537a32b75abd1c55d5c',
    messagingSenderId: '750126735829',
    projectId: 'vclean-1a5a5',
    storageBucket: 'vclean-1a5a5.appspot.com',
    iosClientId: '750126735829-klul017aj8dr0tfqtp2egavtq3jbh7gn.apps.googleusercontent.com',
    iosBundleId: 'com.example.untitled',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyDyB1Wu9AVldAr4RbagK_um7eOxGnqnvxo',
    appId: '1:750126735829:ios:197537a32b75abd1c55d5c',
    messagingSenderId: '750126735829',
    projectId: 'vclean-1a5a5',
    storageBucket: 'vclean-1a5a5.appspot.com',
    iosClientId: '750126735829-klul017aj8dr0tfqtp2egavtq3jbh7gn.apps.googleusercontent.com',
    iosBundleId: 'com.example.untitled',
  );
}
