 
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:trackex/pages/Dashboard.dart';
import 'package:trackex/pages/Onboarding.dart';
import 'package:trackex/pages/Signin.dart';
import 'package:trackex/theme/colors.dart';
 

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen>
    with SingleTickerProviderStateMixin {
  AnimationController controller;
  Animation heartbeatAnimation;
  @override
  void initState() {
    super.initState();

    controller =
        AnimationController(vsync: this, duration: Duration(milliseconds: 1000))
          ..repeat(reverse: true);
    heartbeatAnimation =
        Tween<double>(begin: 110.0, end: 220.0).animate(controller);
    controller.forward().whenComplete(() {
      controller.reverse();
    });
    Future.delayed(Duration(seconds: 2)).then((value) {
   if(FirebaseAuth.instance.currentUser!=null)
   {

        Navigator.of(context).pushAndRemoveUntil(
          MaterialPageRoute(builder: (context) => Dashboard()),
          (route) => false);

   }else{

        Navigator.of(context).pushAndRemoveUntil(
          MaterialPageRoute(builder: (context) => Onboarding()),
          (route) => false);
   }
    });
  }

  @override
  void dispose() {
    // TODO: implement dispose
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: heartbeatAnimation,
      builder: (context, widget) {
        return Scaffold(
          backgroundColor: white,
          // appBar: AppBar(
          //     backgroundColor: transperentColor,
          //     elevation: 0,
          //     brightness: Brightness.dark),
          // extendBodyBehindAppBar: true,
//
          body: Stack(children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                Row(),
                Image(
                  image: AssetImage("assets/logot.png"),
                  width: heartbeatAnimation.value,
                  height: heartbeatAnimation.value,
                ),
              ],
            ),
            // Align(
            //   alignment: Alignment.center,
            //   child: Padding(
            //     padding: const EdgeInsets.only(top: 200.0),
            //     child: Text(
            //       "BreathSense",
            //       style: TextStyle(
            //           color: white,
            //           fontSize: 36.0,
            //           fontWeight: FontWeight.w300),
            //     ),
            //   ),
            // )
          ]),
        );
      },
    );
  }

 
}
 