import 'dart:async';

import 'package:buylap/log_in_page.dart';
import 'package:buylap/sign_up_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:buylap/onboarding.dart';

class SplashScreen extends StatefulWidget {
  SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Timer(
        Duration(seconds: 5),
        (() => Navigator.pushReplacement(context,
            MaterialPageRoute(builder: (BuildContext) => Onboarding()))));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
        // SizedBox(height: 342),
        Center(
          child: Image(
            image: AssetImage('images/logo12.png'),
          ),
        ),
      ]),
    );
  }
}
