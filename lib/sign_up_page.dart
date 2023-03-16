import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

import 'log_in_page.dart';

class SignUp extends StatefulWidget {
  SignUp({super.key});

  @override
  State<SignUp> createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  bool isVisible = true;
  bool isVisible1 = true;
  final _FirstNameController = TextEditingController();
  final _emailController = TextEditingController();
  final _phoneNumberController = TextEditingController();
  final _passwordController = TextEditingController();
  final _LastNameController = TextEditingController();
  final GlobalKey<FormState> _signUpKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.only(
            left: 20,
            right: 20,
          ),
          child: SingleChildScrollView(
            child: Form(
              key: _signUpKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    height: 27,
                  ),
                  SizedBox(
                    height: 40,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'Connect With Us',
                        style: TextStyle(
                            fontFamily: 'Lato-Regular',
                            color: Colors.white,
                            fontWeight: FontWeight.w400,
                            fontSize: 14),
                      ),
                    ],
                  ),
                  SizedBox(height: 4),
                  Center(
                    child: Text(
                      'BuyLap',
                      style: TextStyle(
                          fontFamily: 'Lato-Regular',
                          color: Colors.white,
                          fontWeight: FontWeight.w700,
                          fontSize: 26),
                    ),
                  ),
                  SizedBox(
                    height: 40,
                  ),
                  Text(
                    'First Name',
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 14,
                        fontWeight: FontWeight.w500,
                        fontFamily: 'Lato-Regular'),
                  ),
                  SizedBox(
                    height: 8,
                  ),
                  TextFormField(
                    controller: _FirstNameController,
                    validator: (value) {
                      if (_FirstNameController.text.isEmpty) {
                        return 'Enter First Name';
                      } else {
                        return null;
                      }
                    },
                    decoration: InputDecoration(
                      enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.black),
                          borderRadius: BorderRadius.zero),
                      border: InputBorder.none,
                      filled: true,
                      fillColor: Colors.grey,
                      hintText: 'Your full name',
                    ),
                    keyboardType: TextInputType.name,
                  ),
                  SizedBox(
                    height: 8,
                  ),
                  Text(
                    'Last Name',
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 14,
                        fontWeight: FontWeight.w500,
                        fontFamily: 'Lato-Regular'),
                  ),
                  SizedBox(
                    height: 8,
                  ),
                  TextFormField(
                    controller: _LastNameController,
                    validator: (value) {
                      if (_LastNameController.text.isEmpty) {
                        return 'Enter Last Name';
                      } else {
                        return null;
                      }
                    },
                    decoration: InputDecoration(
                      enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.black),
                          borderRadius: BorderRadius.zero),
                      border: InputBorder.none,
                      filled: true,
                      fillColor: Colors.grey,
                      hintText: 'Your Last Name name',
                    ),
                    keyboardType: TextInputType.name,
                  ),
                  SizedBox(
                    height: 12,
                  ),
                  Text(
                    'Email',
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 14,
                        fontWeight: FontWeight.w500,
                        fontFamily: 'Lato-Regular'),
                  ),
                  SizedBox(
                    height: 8,
                  ),
                  TextFormField(
                      controller: _emailController,
                      decoration: InputDecoration(
                        enabledBorder: OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.black),
                            borderRadius: BorderRadius.zero),
                        border: InputBorder.none,
                        filled: true,
                        fillColor: Colors.grey,
                        hintText: 'Your email@gmail.com',
                      ),
                      keyboardType: TextInputType.emailAddress,
                      validator: (value) {
                        if (_emailController.text.isEmpty) {
                          return 'Enter email address';
                        } else {
                          return null;
                        }
                      }),
                  SizedBox(
                    height: 12,
                  ),
                  Text(
                    'Phone Number',
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 14,
                        fontWeight: FontWeight.w500,
                        fontFamily: 'Lato-Regular'),
                  ),
                  SizedBox(
                    height: 8,
                  ),
                  TextFormField(
                    controller: _phoneNumberController,
                    validator: (value) {
                      if (_phoneNumberController.text.length < 11) {
                        return 'Enter complete phone number';
                      } else {
                        return null;
                      }
                    },
                    decoration: InputDecoration(
                      enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.black),
                          borderRadius: BorderRadius.zero),
                      border: InputBorder.none,
                      filled: true,
                      fillColor: Colors.grey,
                      hintText: '+234',
                    ),
                    keyboardType: TextInputType.number,
                  ),
                  SizedBox(
                    height: 12,
                  ),
                  Text(
                    'Password',
                    style: TextStyle(
                        color: Color(0xff484848),
                        fontSize: 14,
                        fontWeight: FontWeight.w500,
                        fontFamily: 'Lato-Regular'),
                  ),
                  SizedBox(
                    height: 8,
                  ),
                  TextFormField(
                    controller: _passwordController,
                    validator: (value) {
                      if (_passwordController.text.isEmpty) {
                        return 'Enter Password';
                      } else {
                        return null;
                      }
                    },
                    obscureText: isVisible,
                    decoration: InputDecoration(
                        enabledBorder: OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.black),
                            borderRadius: BorderRadius.zero),
                        border: InputBorder.none,
                        filled: true,
                        fillColor: Colors.grey,
                        hintText: '**********',
                        suffixIcon: GestureDetector(
                            onTap: () {
                              setState(() {
                                isVisible = !isVisible;
                              });
                            },
                            child: isVisible
                                ? Icon(
                                    Icons.visibility,
                                    color: Colors.white,
                                  )
                                : Icon(
                                    Icons.visibility_off,
                                    color: Colors.white,
                                  ))),
                    keyboardType: TextInputType.text,
                  ),
                  SizedBox(
                    height: 12,
                  ),
                  SizedBox(
                    height: 70,
                  ),
                  SizedBox(
                    height: 50,
                    width: double.infinity,
                    child: ElevatedButton(
                        style: ButtonStyle(
                            backgroundColor: MaterialStateProperty.all(
                              Colors.yellow,
                            ),
                            shape: MaterialStateProperty.all<
                                RoundedRectangleBorder>(RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10.0),
                            ))),
                        onPressed: (() {
                          Navigator.of(context).push(MaterialPageRoute(
                              builder: (BuildContext) => LogIn()));
                        }),
                        child: Text(
                          'Sign Up',
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 20,
                            fontWeight: FontWeight.w700,
                            fontFamily: 'Lato-Regular',
                          ),
                        )),
                  ),
                  SizedBox(
                    height: 36,
                  ),
                  Center(
                    child: RichText(
                      text: TextSpan(
                          text: 'Already have an account?',
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 12,
                              fontWeight: FontWeight.w400),
                          children: <TextSpan>[
                            TextSpan(
                                text: ' Sign In ',
                                style: TextStyle(
                                    color: Colors.yellow,
                                    fontSize: 12,
                                    fontWeight: FontWeight.w400),
                                recognizer: TapGestureRecognizer()
                                  ..onTap = () {
                                    Navigator.of(context).push(
                                        MaterialPageRoute(
                                            builder: (BuildContext) =>
                                                LogIn()));
                                  })
                          ]),
                    ),
                  ),
                  SizedBox(
                    height: 45,
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
