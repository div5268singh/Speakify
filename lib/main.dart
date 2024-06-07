import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';
import 'package:speakify/Auth/auth_service.dart';
import 'package:speakify/screens/navigation/navigation.dart';
import 'package:flutter/foundation.dart' show kIsWeb;

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  MobileAds.instance.initialize();
  if (kIsWeb) {
    runApp(MyAppWeb());
  } else {
    runApp(MyApp());
  }
}

class MyApp extends StatelessWidget {
  MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) => MaterialApp(
        debugShowCheckedModeBanner: false,
        // home: AuthService().handleAuthState(),
        home: Nav(),
      );
}

class MyAppWeb extends StatelessWidget {
  MyAppWeb({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) => MaterialApp(
        debugShowCheckedModeBanner: false,
        // home: AuthService().handleAuthState(),
        home: Nav(),
      );
}
