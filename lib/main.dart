import 'package:buylap/Home.dart';
import 'package:buylap/log_in_page.dart';
import 'package:buylap/sign_up_page.dart';
import 'package:device_preview/device_preview.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:buylap/splash_screen.dart';

import 'onboarding.dart';

Future main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();

  runApp(DevicePreview(enabled: false, builder: (context) => MyApp()));
}

class MyApp extends StatelessWidget {
  MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      //  home: SplashScreen()
      // );
      home: StreamBuilder<User?>(
          stream: FirebaseAuth.instance.authStateChanges(),
          builder: (context, snapshot) {            
            if (snapshot.connectionState == ConnectionState.waiting) {
              return Center(
                child: CircularProgressIndicator(),
              );
            } else if (snapshot.hasError) {
              return Center(
                child: Text('An error has occur'),
              );
            } else if (snapshot.hasData) {
              final user = FirebaseAuth.instance.currentUser;
              return Home(id: user!.uid.toString(),);
            } else {
              return SplashScreen();
            }
          }),
    );
  }
}
