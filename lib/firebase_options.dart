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
    apiKey: 'AIzaSyCkTo01LgueDMvRPbEKsNDBRGf6k5SyPR8',
    appId: '1:489252768648:android:a597c3f97eff2631b2883d',
    messagingSenderId: '489252768648',
    projectId: 'punyam-8d805',
    storageBucket: 'punyam-8d805.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyChPN5PSmCSmeJN31Ew3sBfO7memZzir5Q',
    appId: '1:489252768648:ios:2959d1a798a70ad7b2883d',
    messagingSenderId: '489252768648',
    projectId: 'punyam-8d805',
    storageBucket: 'punyam-8d805.appspot.com',
    androidClientId: '489252768648-3tf0fjs1v53j21ek8r83so7t1tgcvc0p.apps.googleusercontent.com',
    iosClientId: '489252768648-ue0ku3puedb9ttmkbpb8d5nilctjpafv.apps.googleusercontent.com',
    iosBundleId: 'com.stoxhero.app',
  );
}
