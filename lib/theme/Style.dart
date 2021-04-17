import 'package:flutter/material.dart';
import 'package:trackex/theme/colors.dart';

double mainMargin = 18;
double subMargin = 14;

double buttonRadius = 8;
double mainMarginHalf = 9;

class AppTitle extends StatelessWidget {
  String title;
  AppTitle({this.title});
  @override
  Widget build(BuildContext context) {
    return Text(
      title,
      style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: black),
    );
  }
}
