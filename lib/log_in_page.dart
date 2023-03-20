import 'package:buylap/sign_up_page.dart';
import 'package:buylap/util.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

import 'Home.dart';

class LogIn extends StatefulWidget {
  const LogIn({super.key});

  @override
  State<LogIn> createState() => _LogInState();
}

class _LogInState extends State<LogIn> {
  bool isVisible = true;
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  final GlobalKey<FormState> _logInKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.only(
            top: 24,
            left: 20,
            right: 20,
          ),
          child: SingleChildScrollView(
            child: Form(
              key: _logInKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Center(
                    child: Image(
                      image: AssetImage(
                        'images/logo12.png',
                      ),
                      height: 120,
                      fit: BoxFit.contain,
                      width: 120,
                    ),
                  ),
                  SizedBox(height: 8),
                  Center(
                    child: Text(
                      'Welcome to ',
                      style: TextStyle(
                          fontFamily: 'Lobster-Regular',
                          color: Colors.white,
                          fontWeight: FontWeight.w400,
                          fontSize: 14),
                    ),
                  ),
                  SizedBox(height: 4),
                  Center(
                    child: Text(
                      'BuyLap',
                      style: TextStyle(
                          fontFamily: 'Raleway-Regular',
                          color: Color(0xfffec619),
                          fontWeight: FontWeight.w700,
                          fontSize: 26),
                    ),
                  ),
                  SizedBox(
                    height: 32,
                  ),
                  Text(
                    'Sign in to continue',
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 14,
                        fontWeight: FontWeight.w400,
                        fontFamily: 'Lato-Regular'),
                  ),
                  SizedBox(
                    height: 32,
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
                    cursorColor: Colors.black,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(borderSide: BorderSide.none),
                      filled: true,
                      prefixIcon: Icon(
                        Icons.email,
                        color: Colors.black,
                      ),
                      fillColor: Colors.grey,
                      hintText: 'Your email@gmail.com',
                    ),
                    keyboardType: TextInputType.emailAddress,
                  ),
                  SizedBox(
                    height: 37,
                  ),
                  Text(
                    'Password',
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
                    controller: _passwordController,
                    obscureText: isVisible,
                    cursorColor: Colors.black,
                    decoration: InputDecoration(
                        border: OutlineInputBorder(borderSide: BorderSide.none),
                        filled: true,
                        prefixIcon: Icon(
                          Icons.lock,
                          color: Colors.black,
                        ),
                        fillColor: Colors.grey,
                        hintText: '**********',
                        suffixIcon: GestureDetector(
                            onTap: () {
                              setState(() {
                                isVisible = !isVisible;
                                print(isVisible);
                              });
                            },
                            child: isVisible
                                ? Icon(
                                    Icons.visibility,
                                    color: Colors.black,
                                  )
                                : Icon(
                                    Icons.visibility_off,
                                    color: Colors.black,
                                  ))),
                    keyboardType: TextInputType.text,
                  ),
                  SizedBox(
                    height: 40,
                  ),
                  SizedBox(
                    height: 50,
                    width: double.infinity,
                    child: ElevatedButton(
                        style: ButtonStyle(
                            backgroundColor: MaterialStateProperty.all(
                              Color(0xfffec619),
                            ),
                            shape: MaterialStateProperty.all<
                                RoundedRectangleBorder>(RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10.0),
                            ))),
                        onPressed: (() {
                          logIn();
                          Navigator.of(context).push(MaterialPageRoute(
                              builder: (BuildContext) => Home()));
                        }),
                        child: Text(
                          'Sign In',
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 18,
                            fontWeight: FontWeight.w700,
                            fontFamily: 'Raleway-Regular',
                          ),
                        )),
                  ),
                  SizedBox(
                    height: 36,
                  ),
                  Center(
                    child: RichText(
                      text: TextSpan(
                          text: 'Don\'t have an account?',
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 12,
                              fontWeight: FontWeight.w400),
                          children: <TextSpan>[
                            TextSpan(
                                text: ' Sign up ',
                                style: TextStyle(
                                    color: Color(0xfffec619),
                                    fontSize: 12,
                                    fontWeight: FontWeight.w600),
                                recognizer: TapGestureRecognizer()
                                  ..onTap = () {
                                    Navigator.of(context).push(
                                        MaterialPageRoute(
                                            builder: (BuildContext) =>
                                                SignUp()));
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

  Future logIn() async {
    final isValid = _logInKey.currentState!.validate();
    if (!isValid) return;

    showDialog(
        context: context,
        barrierDismissible: false,
        builder: (context) => Center(
              child: CircularProgressIndicator(),
            ));

    try {
      await FirebaseAuth.instance
          .signInWithEmailAndPassword(
              email: _emailController.text, password: _passwordController.text)
          .then((value) => Navigator.of(context)
              .push(MaterialPageRoute(builder: (BuildContext) => Home())));
    } on FirebaseAuthException catch (e) {
      failureSnackBar(context: context, message: e.message.toString());
    }
    Navigator.pop(context);

    // navigatorKey.currentState!.popUntil((route) => route.isFirst);
  }
}
