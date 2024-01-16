import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:get_storage/get_storage.dart';
import 'package:punyam/firebase_options.dart';

import 'src/app/app.dart';

const bool isProd = false;
const bool useTestToken = true;
void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    name: "punyam-8d805",
    options: DefaultFirebaseOptions.currentPlatform,
  );
  await GetStorage.init();
  runApp(App());
}
