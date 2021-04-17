import 'package:cached_network_image/cached_network_image.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_icons/flutter_icons.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';
import 'package:provider/provider.dart';
import 'package:trackex/Models/User.dart';
import 'package:trackex/pages/Onboarding.dart';
import 'package:trackex/providers/UserProvider.dart';
import 'package:trackex/theme/colors.dart';
import 'package:trackex/theme/Style.dart';

class ProfilePage extends StatefulWidget {
  @override
  _ProfilePageState createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  TextEditingController _email =
      TextEditingController(text: "abbie_wilson@gmail.com");
  TextEditingController dateOfBirth = TextEditingController(text: "04-19-1992");
  TextEditingController bio = TextEditingController(text: " ");
  AppUser user;
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Consumer<UserProvider>(builder: (context, UserProvider, child) {
      user = UserProvider.user;
      if (user != null) {
        print(user.profilePicture);
        _email.text = user.email;
        bio.text = user.bio;

        dateOfBirth.text = DateTime.fromMillisecondsSinceEpoch(
                user.birthdate.millisecondsSinceEpoch)
            .toString()
            .substring(0, 10);
      }
      return user == null
          ? CircularProgressIndicator.adaptive()
          : Scaffold(
              backgroundColor: grey,
              appBar: AppBar(
                title: AppTitle(title: "Profile"),
                actions: [
                  Padding(
                    padding: EdgeInsets.only(right: mainMargin),
                    child: IconButton(
                      icon: Icon(
                        FontAwesome.power_off,
                        color: primary,
                      ),
                      onPressed: () {
                        FirebaseAuth.instance.signOut().then((value) {
                          Navigator.pushAndRemoveUntil(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => Onboarding()),
                              (route) => false);
                        });
                      },
                    ),
                  )
                ],
              ),
              body: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      decoration: BoxDecoration(
                          color: white,
                          boxShadow: [
                            BoxShadow(
                              color: grey.withOpacity(0.01),
                              spreadRadius: 10,
                              blurRadius: 3,
                              // changes position of shadow
                            ),
                          ],
                          borderRadius: BorderRadius.only(
                              bottomLeft: Radius.circular(2 * subMargin),
                              bottomRight: Radius.circular(2 * subMargin))),
                      child: Padding(
                        padding: EdgeInsets.only(
                            top: 20, right: 20, left: 20, bottom: 25),
                        child: Column(
                          children: [
                            Row(
                              children: [
                                Container(
                                  width: (size.width - 40) * 0.4,
                                  child: Container(
                                    child: Stack(
                                      children: [
                                        RotatedBox(
                                          quarterTurns: -2,
                                          child: CircularPercentIndicator(
                                              circularStrokeCap:
                                                  CircularStrokeCap.round,
                                              backgroundColor:
                                                  grey.withOpacity(0.3),
                                              radius: 110.0,
                                              lineWidth: 6.0,
                                              percent: 0.53,
                                              progressColor: primary),
                                        ),
                                        Positioned(
                                          top: 12.5,
                                          left:12.5,
                                          
                                          child: Center(
                                            child: Container(
                                              width: 85,
                                              height: 85,
                                              decoration: BoxDecoration(
                                                shape: BoxShape.circle,
                                                // image: DecorationImage(
                                                //     image: CachedNetworkImageProvider(
                                                //         user.profilePicture),
                                                //     fit: BoxFit.cover)
                                                //
                                              ),
                                              child: ClipRRect(
                                                borderRadius: BorderRadius.circular(42.5),
                                                child: CachedNetworkImage(
                                                  imageUrl: user.profilePicture,
                                                  fit: BoxFit.fitWidth,
                                                  placeholder: (context, url) =>
                                                      CircularProgressIndicator(
                                                    valueColor:
                                                        new AlwaysStoppedAnimation<
                                                            Color>(primary),
                                                    backgroundColor: grey,
                                                  ),
                                                  errorWidget:
                                                      (context, url, error) =>
                                                          Container(
                                                              width: 85,
                                                              height: 85,
                                                              color: primary,
                                                              child: Icon(
                                                                CupertinoIcons
                                                                    .person_solid,
                                                                color: primary,
                                                                size: 50,
                                                              )),
                                                ),
                                              ),
                                            ),
                                          ),
                                        )
                                      ],
                                    ),
                                  ),
                                ),
                                Container(
                                  width: (size.width - 40) * 0.6,
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        user.name,
                                        style: TextStyle(
                                            fontSize: 20,
                                            fontWeight: FontWeight.bold,
                                            color: black),
                                      ),
                                      SizedBox(
                                        height: 10,
                                      ),
                                      Text(
                                        "Credit score: 73.50",
                                        style: TextStyle(
                                            fontSize: 14,
                                            fontWeight: FontWeight.w500,
                                            color: black.withOpacity(0.4)),
                                      ),
                                    ],
                                  ),
                                )
                              ],
                            ),
                            SizedBox(
                              height: 25,
                            ),
                            Container(
                              width: double.infinity,
                              decoration: BoxDecoration(
                                  color: primary,
                                  borderRadius:
                                      BorderRadius.circular(subMargin),
                                  boxShadow: [
                                    BoxShadow(
                                      color: primary.withOpacity(0.01),
                                      spreadRadius: 10,
                                      blurRadius: 3,
                                      // changes position of shadow
                                    ),
                                  ]),
                              child: Padding(
                                padding: const EdgeInsets.only(
                                    left: 20, right: 20, top: 25, bottom: 25),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          "United Bank Asia",
                                          style: TextStyle(
                                              fontWeight: FontWeight.w500,
                                              fontSize: 12,
                                              color: white),
                                        ),
                                        SizedBox(
                                          height: 10,
                                        ),
                                        Text(
                                          "\$2446.90",
                                          style: TextStyle(
                                              fontWeight: FontWeight.bold,
                                              fontSize: 20,
                                              color: white),
                                        ),
                                      ],
                                    ),
                                    Container(
                                      decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(10),
                                          border: Border.all(color: white)),
                                      child: Padding(
                                        padding: const EdgeInsets.all(13.0),
                                        child: Text(
                                          "Update",
                                          style: TextStyle(color: white),
                                        ),
                                      ),
                                    )
                                  ],
                                ),
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
                    SizedBox(
                      height: mainMargin,
                    ),
                    Container(
                      padding: const EdgeInsets.only(left: 20, right: 20),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            width: double.infinity,
                            decoration: BoxDecoration(
                                color: white,
                                borderRadius: BorderRadius.circular(subMargin),
                                boxShadow: [
                                  BoxShadow(
                                    color: primary.withOpacity(0.01),
                                    spreadRadius: 10,
                                    blurRadius: 3,
                                    // changes position of shadow
                                  ),
                                ]),
                            child: Padding(
                              padding: const EdgeInsets.only(
                                  left: 20, right: 20, top: 25, bottom: 25),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        "Email",
                                        style: TextStyle(
                                            fontWeight: FontWeight.w500,
                                            fontSize: 12,
                                            color: primary),
                                      ),
                                      SizedBox(
                                        height: 5,
                                      ),
                                      Container(
                                        height: 30,
                                        width: size.width - 80,
                                        child: TextField(
                                          controller: _email,
                                          cursorColor: black,
                                          style: TextStyle(
                                              fontSize: 17,
                                              fontWeight: FontWeight.bold,
                                              color: black),
                                          decoration: InputDecoration(
                                              hintText: "Email",
                                              contentPadding: EdgeInsets.zero,
                                              border: InputBorder.none),
                                        ),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          ),
                          SizedBox(
                            height: 20,
                          ),
                          Container(
                            width: double.infinity,
                            decoration: BoxDecoration(
                                color: white,
                                borderRadius: BorderRadius.circular(subMargin),
                                boxShadow: [
                                  BoxShadow(
                                    color: primary.withOpacity(0.01),
                                    spreadRadius: 10,
                                    blurRadius: 3,
                                    // changes position of shadow
                                  ),
                                ]),
                            child: Padding(
                              padding: const EdgeInsets.only(
                                  left: 20, right: 20, top: 25, bottom: 25),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        "Date of birth",
                                        style: TextStyle(
                                            fontWeight: FontWeight.w500,
                                            fontSize: 12,
                                            color: primary),
                                      ),
                                      SizedBox(
                                        height: 5,
                                      ),
                                      Container(
                                        height: 30,
                                        width: size.width - 80,
                                        child: TextField(
                                          controller: dateOfBirth,
                                          cursorColor: black,
                                          style: TextStyle(
                                              fontSize: 17,
                                              fontWeight: FontWeight.bold,
                                              color: black),
                                          decoration: InputDecoration(
                                              hintText: "Date of birth",
                                              contentPadding: EdgeInsets.zero,
                                              border: InputBorder.none),
                                        ),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          ),
                          SizedBox(
                            height: 20,
                          ),
                          Container(
                            width: double.infinity,
                            decoration: BoxDecoration(
                                color: white,
                                borderRadius: BorderRadius.circular(subMargin),
                                boxShadow: [
                                  BoxShadow(
                                    color: primary.withOpacity(0.01),
                                    spreadRadius: 10,
                                    blurRadius: 3,
                                    // changes position of shadow
                                  ),
                                ]),
                            child: Padding(
                              padding: const EdgeInsets.only(
                                  left: 20, right: 20, top: 25, bottom: 25),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        "bio",
                                        style: TextStyle(
                                            fontWeight: FontWeight.w500,
                                            fontSize: 12,
                                            color: primary),
                                      ),
                                      SizedBox(
                                        height: 5,
                                      ),
                                      Container(
                                        height: 30,
                                        width: size.width - 80,
                                        child: TextField(
                                          controller: bio,
                                          cursorColor: black,
                                          style: TextStyle(
                                              fontSize: 17,
                                              fontWeight: FontWeight.bold,
                                              color: black),
                                          decoration: InputDecoration(
                                              hintText: "bio",
                                              contentPadding: EdgeInsets.zero,
                                              border: InputBorder.none),
                                        ),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    )
                  ],
                ),
              ));
    });
  }
}
