import 'dart:async';

import 'package:buylap/sign_up_page.dart';
import 'package:flutter/material.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class Onboarding extends StatefulWidget {
  Onboarding({super.key});

  @override
  State<Onboarding> createState() => _OnboardingState();
}

class _OnboardingState extends State<Onboarding> {
  void initState() {
    // TODO: implement initState
    super.initState();
    Timer(
        Duration(seconds: 3),
        (() => Navigator.of(context).pushReplacement(
            MaterialPageRoute(builder: (BuildContext) => SignUp()))));
  }

  final controller = PageController();

  @override
  Widget build(BuildContext context) {
    // double _height = MediaQuery.of(context).size.height;
    double _width = MediaQuery.of(context).size.width;
    // print(_width);
    return Scaffold(
      backgroundColor: Colors.black,
      body: PageView(
        controller: controller,
        children: [
          buildPageViewColumn(
              imageName: 'images/page1.png',
              titleText: 'Planning Made Easy',
              subtitleText:
                  'Ease up your mind and free up your space. You are not overwhelmed, you just need to plan.'),
          buildPageViewColumn(
              imageName: 'images/page1.png',
              titleText: 'Schedule Your Tasks',
              subtitleText:
                  'Things get a lot better when you properly schedule your daily task and activites.'),
          buildPageViewColumn(
              imageName: 'images/page1.png',
              titleText: 'Team Up With Members',
              subtitleText:
                  'Are work tasks hard to monitor? You can now work better and be accountable to your team members.'),
        ],
      ),
    );
  }

  Column buildPageViewColumn({
    required String imageName,
    required String titleText,
    required String subtitleText,
  }) {
    return Column(
      children: [
        Container(
          padding: EdgeInsets.symmetric(horizontal: 24, vertical: 52),
          height: 200,
          width: double.infinity,
          decoration: BoxDecoration(
            image: DecorationImage(
              fit: BoxFit.fill,
              image: AssetImage(imageName),
              // alignment: Alignment.topCenter,
            ),
          ),
        ),
        SizedBox(
          height: 40,
        ),
        Text(
          titleText,
          style: TextStyle(
            color: Colors.white,
            fontFamily: 'Sen',
            fontStyle: FontStyle.normal,
            fontSize: 24,
            fontWeight: FontWeight.w700,
          ),
        ),
        SizedBox(
          height: 40,
        ),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 24),
          child: Text(
            subtitleText,
            style: TextStyle(
                fontFamily: 'Sen',
                fontStyle: FontStyle.normal,
                fontSize: 14,
                fontWeight: FontWeight.w700,
                color: Colors.white),
            textAlign: TextAlign.center,
          ),
        ),
        SizedBox(
          height: 35,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SmoothPageIndicator(
                axisDirection: Axis.horizontal,
                controller: controller,
                count: 3,
                effect: ExpandingDotsEffect(
                  activeDotColor: Colors.yellow,
                  dotColor: Colors.grey,
                )
                // SwapEffect(
                //   activeDotColor: Color(0xff0F68ED),
                //   dotColor: Color(0xffC4C4C4),
                //   dotHeight: 15,
                //   dotWidth: 15,
                // ),
                ),
          ],
        ),
        CircularPercentIndicator(
          radius: 50,
          lineWidth: 5,
          percent: 0.2,
          center: new Icon(
            Icons.arrow_circle_right,
            size: 50.0,
            color: Colors.yellow,
          ),
          backgroundColor: Colors.grey,
          progressColor: Colors.yellow,
        ),
      ],
    );
  }
}
