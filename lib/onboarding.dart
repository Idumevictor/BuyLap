import 'dart:async';
import 'package:buylap/log_in_page.dart';
import 'package:buylap/sign_up_page.dart';
import 'package:buylap/size_config.dart';
import 'package:flutter/material.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class Onboarding extends StatefulWidget {
  Onboarding({super.key});

  @override
  State<Onboarding> createState() => _OnboardingState();
}

class _OnboardingState extends State<Onboarding> {
  final controller = PageController();
  int value = 0;
  // var progressValue = (100 * PageController.).toInt();

  @override
  Widget build(BuildContext context) {
    SizeConfig.init(context);
    // print(width);
    return Scaffold(
      backgroundColor: Colors.black,
      body: PageView(
        controller: controller,
        children: [
          // SizedBox(height: 20,),
          buildPageViewColumn(
              imageName: 'images/image1.png',
              titleText: 'Find Your Product',
              subtitleText:
                  'Ease up your mind and free up your space. You are not overwhelmed, you just need to plan.'),
          buildPageViewColumn(
              imageName: 'images/page1.png',
              titleText: 'Create Your Own Business',
              subtitleText:
                  'Things get a lot better when you properly schedule your daily task and activites.'),
          buildPageViewColumn(
            imageName: 'images/sells.png',
            titleText: 'Sell Your Own Products',
            subtitleText:
                'Are work tasks hard to monitor? You can now work better and be accountable to your team members.',
          ),
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
        SizedBox(
          height: getProportionateScreenHeight(100),
        ),
        Container(
          padding: EdgeInsets.symmetric(horizontal: 24, vertical: 52),
          height: getProportionateScreenHeight(300),
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
          height: getProportionateScreenHeight(40),
        ),
        Text(
          titleText,
          style: TextStyle(
            color: Colors.white,
            fontFamily: 'Sen',
            fontStyle: FontStyle.normal,
            fontSize: 30,
            fontWeight: FontWeight.w700,
          ),
        ),
        SizedBox(
          height: getProportionateScreenHeight(40),
        ),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 24),
          child: Text(
            subtitleText,
            style: TextStyle(
                fontFamily: 'Sen',
                fontStyle: FontStyle.normal,
                fontSize: 20,
                fontWeight: FontWeight.w400,
                color: Colors.white),
            textAlign: TextAlign.center,
          ),
        ),
        SizedBox(
          height: getProportionateScreenHeight(70),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SmoothPageIndicator(
                axisDirection: Axis.horizontal,
                controller: controller,
                count: 3,
                effect: ExpandingDotsEffect(
                  dotHeight: 10,
                  activeDotColor: Color(0xfffec619),
                  dotColor: Colors.white,
                )),
          ],
        ),
        SizedBox(
          height: getProportionateScreenHeight(100),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            SizedBox(
              height: getProportionateScreenHeight(50),
              width: getProportionateScreenWidth(200),
              child: ElevatedButton(
                  style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.all(
                        Color(0xfffec619),
                      ),
                      shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                          RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10.0),
                      ))),
                  onPressed: (() {
                    Navigator.of(context).push(
                        MaterialPageRoute(builder: (BuildContext) => SignUp()));
                  }),
                  child: Text(
                    'Sign Up',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 18,
                      fontWeight: FontWeight.w700,
                      fontFamily: 'Raleway-Regular',
                    ),
                  )),
            ),
            SizedBox(
              height: getProportionateScreenHeight(50),
              width: getProportionateScreenWidth(200),
              child: ElevatedButton(
                  style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.all(
                        Color(0xfffec619),
                      ),
                      shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                          RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10.0),
                      ))),
                  onPressed: (() {
                    Navigator.of(context).push(
                        MaterialPageRoute(builder: (BuildContext) => LogIn()));
                  }),
                  child: Text(
                    'Log In',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 18,
                      fontWeight: FontWeight.w700,
                      fontFamily: 'Raleway-Regular',
                    ),
                  )),
            ),
          ],
        ),
      ],
    );
  }
}
