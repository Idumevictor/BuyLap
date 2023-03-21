import 'package:buylap/size_config.dart';
import 'package:buylap/util.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'log_in_page.dart';

class SignUp extends StatefulWidget {
  @override
  State<SignUp> createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  bool isVisible = true;
  bool isVisible1 = true;
  final _firstNameController = TextEditingController();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  final _lastNameController = TextEditingController();
  final GlobalKey<FormState> _signUpKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    SizeConfig.init(context);
    return Scaffold(
      backgroundColor: Colors.black,
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.only(left: 20, right: 20, top: 15),
          child: SingleChildScrollView(
            child: Form(
              key: _signUpKey,
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Center(
                      child: Image(
                        image: AssetImage('images/logo12.png'),
                        height: getProportionateScreenHeight(120),
                        width: getProportionateScreenWidth(120),
                      ),
                    ),
                    SizedBox(
                      height: getProportionateScreenHeight(8),
                    ),
                    Center(
                      child: Text(
                        'Register With Us @ ',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            fontFamily: 'Lato-Regular',
                            color: Colors.white,
                            fontWeight: FontWeight.w400,
                            fontSize: 14),
                      ),
                    ),
                    SizedBox(height: getProportionateScreenHeight(4)),
                    Center(
                      child: Text(
                        'BuyLap',
                        style: TextStyle(
                            fontFamily: 'Lobster-Regular',
                            color: Color(0xfffec619),
                            fontWeight: FontWeight.w700,
                            fontSize: 26),
                      ),
                    ),
                    SizedBox(
                      height: getProportionateScreenHeight(40),
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
                      height: getProportionateScreenHeight(8),
                    ),
                    TextFormField(
                      controller: _firstNameController,
                      cursorColor: Colors.black,
                      validator: (value) {
                        if (_firstNameController.text.isEmpty) {
                          return 'Enter First Name';
                        } else {
                          return null;
                        }
                      },
                      decoration: InputDecoration(
                        border: OutlineInputBorder(borderSide: BorderSide.none),
                        filled: true,
                        prefixIcon: Icon(
                          Icons.person,
                          color: Colors.black,
                        ),
                        fillColor: Colors.grey,
                        hintText: 'First name',
                      ),
                      keyboardType: TextInputType.name,
                    ),
                    SizedBox(
                      height: getProportionateScreenHeight(8),
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
                      height: getProportionateScreenHeight(8),
                    ),
                    TextFormField(
                      controller: _lastNameController,
                      cursorColor: Colors.black,
                      validator: (value) {
                        if (_lastNameController.text.isEmpty) {
                          return 'Enter Last Name';
                        } else {
                          return null;
                        }
                      },
                      decoration: InputDecoration(
                        border: OutlineInputBorder(borderSide: BorderSide.none),
                        filled: true,
                        prefixIcon: Icon(
                          Icons.person,
                          color: Colors.black,
                        ),
                        fillColor: Colors.grey,
                        hintText: 'Last Name',
                      ),
                      keyboardType: TextInputType.name,
                    ),
                    SizedBox(
                      height: getProportionateScreenHeight(12),
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
                      height: getProportionateScreenHeight(8),
                    ),
                    TextFormField(
                        controller: _emailController,
                        cursorColor: Colors.black,
                        decoration: InputDecoration(
                          border:
                              OutlineInputBorder(borderSide: BorderSide.none),
                          filled: true,
                          prefixIcon: Icon(
                            Icons.email,
                            color: Colors.black,
                          ),
                          fillColor: Colors.grey,
                          hintText: 'Your email@gmail.com',
                        ),
                        keyboardType: TextInputType.emailAddress,
                        validator: (value) {
                          if (_emailController.text.isEmpty) {
                            return 'Email address';
                          } else {
                            return null;
                          }
                        }),
                    SizedBox(
                      height: getProportionateScreenHeight(12),
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
                      height: getProportionateScreenHeight(8),
                    ),
                    TextFormField(
                      controller: _passwordController,
                      cursorColor: Colors.black,
                      validator: (value) {
                        if (_passwordController.text.isEmpty) {
                          return 'Enter Password';
                        } else {
                          return null;
                        }
                      },
                      obscureText: isVisible,
                      decoration: InputDecoration(
                          border:
                              OutlineInputBorder(borderSide: BorderSide.none),
                          filled: true,
                          fillColor: Colors.grey,
                          hintText: '**********',
                          prefixIcon: Icon(
                            Icons.lock,
                            color: Colors.black,
                          ),
                          suffixIcon: GestureDetector(
                              onTap: () {
                                setState(() {
                                  isVisible = !isVisible;
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
                      height: getProportionateScreenHeight(70),
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
                                      RoundedRectangleBorder>(
                                  RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10.0),
                              ))),
                          onPressed: (() {
                            signUp();
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
                      height: getProportionateScreenHeight(36),
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
                                  text: ' Log In ',
                                  style: TextStyle(
                                      color: Color(0xfffec619),
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
                      height: getProportionateScreenHeight(45),
                    ),
                  ]),
            ),
          ),
        ),
      ),
    );
  }

  Future signUp() async {
    final isValid = _signUpKey.currentState!.validate();
    if (!isValid) return;
    showDialog(
        context: context,
        barrierDismissible: false,
        builder: (context) => const Center(
              child: CircularProgressIndicator(
                color: Colors.white,
              ),
            ));
    try {
      await FirebaseAuth.instance
          .createUserWithEmailAndPassword(
              email: _emailController.text, password: _passwordController.text)
          .then((value) {
        FirebaseFirestore.instance
            .collection('userData')
            .doc(value.user!.uid)
            .set({
          'email': value.user!.email,
          'first_name': _firstNameController.text,
          'last_name': _lastNameController.text
        });
      });

      Navigator.of(context)
          .pushReplacement(MaterialPageRoute(builder: (context) => LogIn()));
    } on FirebaseAuthException catch (e) {
      Navigator.pop(context);
      failureSnackBar(context: context, message: e.message.toString());
    }
  }
}
