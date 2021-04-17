import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:trackex/pages/Signin.dart';
import 'package:trackex/pages/Signup.dart';
import 'package:trackex/theme/Style.dart';
import 'package:trackex/theme/colors.dart';
import 'package:trackex/widget/Buttons.dart';

class Onboarding extends StatefulWidget {
  @override
  _OnboardingState createState() => _OnboardingState();
}

class _OnboardingState extends State<Onboarding> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: white,
        body: Container(
          width: MediaQuery.of(context).size.width,
          decoration: BoxDecoration(color: white),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                child: Container(
                  padding: EdgeInsets.symmetric(horizontal: mainMargin),
                  decoration: BoxDecoration(
                    color: white,
                    // image: DecorationImage(
                    //     image: AssetImage("assets/onb2.png"),
                    //     fit: BoxFit.fitWidth),
                  ),
                  child: Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Padding(
                          padding: EdgeInsets.symmetric(horizontal: subMargin),
                          child: Image(
                            image: AssetImage("assets/logot.png"),
                            width: 100,
                          ),
                        ),
                        SizedBox(
                          height: 6 * subMargin,
                        ),
                        PrimaryButton(
                          isloading: false,
                          onPressed: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => SignIn()));
                          },
                          title: "Login",
                          height: 55,
                          backgroundColor: primary,
                          foregroundColor: white,
                        ),
                        // SizedBox(
                        //   height: 8 * subMargin,
                        // ),
                      ],
                    ),
                  ),
                ),
              ),
              Container(
                padding: EdgeInsets.symmetric(
                    horizontal: mainMargin, vertical: 2 * subMargin),
                decoration: BoxDecoration(color: white),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Text(
                    //   "Fitness.",
                    //   style: TextStyle(
                    //       color: black,
                    //       fontWeight: FontWeight.bold,
                    //       fontSize: 40),
                    // ),
                    // Text(
                    //   "With Friends",
                    //   style: TextStyle(
                    //     color: primaryDark,
                    //     fontWeight: FontWeight.w400,
                    //     fontSize: 40,
                    //   ),
                    // ),
                    // SizedBox(
                    //   height: 2 * subMargin,
                    // ),
                    // PrimaryButton(
                    //   isloading: false,
                    //   onPressed: () {
                    //     Navigator.push(context,
                    //         MaterialPageRoute(builder: (context) => SignIn()));
                    //   },
                    //   title: "Login",
                    //   backgroundColor: primary,
                    //   foregroundColor: white,
                    // ),
                    // SizedBox(
                    //   height: 8 * subMargin,
                    // ),
                    Center(
                      child: InkWell(
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => Signup()));
                        },
                        child: Text(
                          "New here? Create New Account",
                          style: TextStyle(
                              fontSize: mainMargin - 2,
                              fontWeight: FontWeight.w400),
                        ),
                      ),
                    ),
                  ],
                ),
              )
            ],
          ),
        ));
  }
}
