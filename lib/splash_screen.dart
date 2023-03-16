import 'dart:async';

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
        (() => Navigator.of(context).pushReplacement(
            MaterialPageRoute(builder: (BuildContext) => Onboarding()))));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Column(crossAxisAlignment: CrossAxisAlignment.center, children: [
        SizedBox(height: 342),
        Center(
          child: Icon(
            Icons.laptop,
            size: 20,
            color: Colors.white10,
          ),
        ),
        Text(
          'Buylap.',
          style: TextStyle(
              color: Color(0xffffffff),
              fontSize: 64,
              fontWeight: FontWeight.w600,
              fontFamily: 'WorkSans-Regular'),
        )
      ]),
    );
  }
}
