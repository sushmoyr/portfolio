import 'package:flutter/material.dart';

const kPlaceHolderColor = Colors.grey;

Widget placeHolder(double width, double height) => Container(
      width: width,
      height: height,
      color: kPlaceHolderColor,
    );

Widget defaultVerticalSpace = SizedBox(
  height: 24,
);

const Duration kDefaultOpacityDuration = Duration(milliseconds: 1000);
