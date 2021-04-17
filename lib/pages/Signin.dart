import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:trackex/pages/Dashboard.dart';
import 'package:trackex/pages/ForgotPass.dart';
import 'package:trackex/providers/UserProvider.dart';
import 'package:trackex/theme/colors.dart';

import 'package:trackex/theme/Style.dart';

import 'package:trackex/widget/inputbox.dart';

import 'package:trackex/widget/Buttons.dart';

import 'package:trackex/widget/snackbar.dart';

class SignIn extends StatefulWidget {
  @override
  _SignInState createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
  TextEditingController email, pass;
  bool email_error = false, pass_error = false;
  bool isloading = false;
  final scaffoldKey = GlobalKey<ScaffoldState>();

  FirebaseAuth auth = FirebaseAuth.instance;
  @override
  void initState() {
    email = TextEditingController();
    pass = TextEditingController();
    super.initState();
  }

  void sigin(BuildContext context) async {
    try {
      UserCredential userCredential = await FirebaseAuth.instance
          .signInWithEmailAndPassword(email: email.text, password: pass.text);
      print("login");
      print(userCredential);
      print("user instance");
      print(userCredential.user);

      Provider.of<UserProvider>(context, listen: false)
          .fetchLogedUser()
          .then((value) {
        Navigator.of(context).pushAndRemoveUntil(
            MaterialPageRoute(builder: (context) => Dashboard()),
            (route) => false);
      });
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        setState(() {
          email_error = true;
          isloading = false;
          CustomSnackBar(
                  actionTile: "close",
                  haserror: true,
                  scaffoldKey: scaffoldKey,
                  isfloating: false,
                  onPressed: () {},
                  title: "No user found for this email!")
              .show();
        });
        print('No user found for that email.');
      } else if (e.code == 'wrong-password') {
        isloading = false;
        pass_error = true;
        setState(() {
          CustomSnackBar(
                  actionTile: "close",
                  haserror: true,
                  scaffoldKey: scaffoldKey,
                  isfloating: false,
                  onPressed: () {},
                  title: "Wrong password provided for this user!")
              .show();
        });
        print('Wrong password provided for that user.');
      } else {
        isloading = false;
        pass_error = true;
        print(e.code);
        setState(() {
          CustomSnackBar(
                  actionTile: "close",
                  haserror: true,
                  scaffoldKey: scaffoldKey,
                  isfloating: false,
                  onPressed: () {},
                  title: e.code)
              .show();
        });
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: white,
      key: scaffoldKey,
      appBar: AppBar(
        brightness: Brightness.light,
        backgroundColor: white,
        elevation: 0,
        leading: IconButton(
          onPressed: () {
            Navigator.of(context).pop();
          },
          icon: Icon(
            Icons.arrow_back_ios,
            color: black,
            size: mainMargin + 6,
          ),
        ),
      ),
      body: Container(
        padding: EdgeInsets.all(mainMargin),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Login",
                style: TextStyle(
                    color: primary, fontWeight: FontWeight.bold, fontSize: 40),
              ),
              SizedBox(
                height: mainMargin,
              ),
              Text(
                "Enter your email address and password\nto get access your account",
                style: TextStyle(
                    color: primary,
                    fontWeight: FontWeight.w400,
                    fontSize: subMargin + 4),
              ),
              SizedBox(
                height: 2 * mainMargin,
              ),
              inputBox(
                controller: email,
                error: email_error,
                errorText: "",
                inuptformat: [],
                labelText: "Email Address",
                obscureText: false,
                ispassword: false,
                istextarea: false,
                readonly: false,
                onchanged: (value) {
                  setState(() {
                    email_error = false;
                  });
                },
              ),
              SizedBox(
                height: mainMargin,
              ),
              inputBox(
                controller: pass,
                error: pass_error,
                errorText: "",
                inuptformat: [],
                labelText: "Password",
                readonly: false,
                obscureText: true,
                ispassword: true,
                istextarea: false,
                onchanged: (value) {
                  setState(() {
                    pass_error = false;
                  });
                },
              ),
              SizedBox(
                height: mainMargin,
              ),
              PrimaryButton(
                isloading: isloading,
                onPressed: () {
                  if (email.text == '') {
                    print("email null");
                    setState(() {
                      CustomSnackBar(
                              actionTile: "close",
                              haserror: true,
                              isfloating: false,
                              scaffoldKey: scaffoldKey,
                              onPressed: () {},
                              title: "Please enter your email!")
                          .show();
                      email_error = true;
                    });
                  } else if (!RegExp(
                          r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
                      .hasMatch(email.text)) {
                    print("not  email");
                    setState(() {
                      CustomSnackBar(
                              actionTile: "close",
                              haserror: true,
                              isfloating: false,
                              scaffoldKey: scaffoldKey,
                              onPressed: () {},
                              title: "Please enter valid email!")
                          .show();
                      email_error = true;
                    });
                  } else if (pass.text == '') {
                    setState(() {
                      CustomSnackBar(
                              actionTile: "close",
                              haserror: true,
                              isfloating: false,
                              scaffoldKey: scaffoldKey,
                              onPressed: () {},
                              title: "Please enter your password!")
                          .show();

                      pass_error = true;
                    });
                  } else {
                    setState(() {
                      isloading = true;
                    });

                    print("calling signin");
                    sigin(context);
                  }
                },
                title: "Login",
                backgroundColor: primary,
                foregroundColor: white,
                height: 55,
              ),
              SizedBox(
                height: mainMargin,
              ),
              Center(
                child: InkWell(
                  onTap: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => ForgotPass()));
                  },
                  child: Text(
                    "Forgot Password?",
                    style: TextStyle(
                        fontSize: mainMargin - 2, fontWeight: FontWeight.w400),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
