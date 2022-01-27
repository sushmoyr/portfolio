import 'package:flutter/material.dart';

//color constants
const kPlaceHolderColor = Colors.grey;
const kDeppGradientColor = Color(0xFF8490ff);
const kLightGradientColor = Color(0xFF62bcfc);

Widget placeHolder(double width, double height) => Container(
      width: width,
      height: height,
      color: kPlaceHolderColor,
    );

Widget defaultVerticalSpace = SizedBox(
  height: 24,
);

const Duration kDefaultOpacityDuration = Duration(milliseconds: 1000);

// String Constants
const String welcomeCaption = 'THIS IS ME';
const String name = 'SUSHMOY ROY';
const String welcomeDescription =
    'You will begin to realise why this exercise is called the Dickens Pattern (with reference to the ghost showing Scrooge some different futures)';
const String hireMe = 'Hire Me';
const Widget home = Text('Home');
const Widget about = Text('About');
const Widget services = Text('Services');
const Widget blog = Text('Blog');
const Widget contact = Text('Contact');
