import 'package:flutter/material.dart';

const kTextFieldDecoration = InputDecoration(
  hintText: 'Enter the text',
  hintStyle: TextStyle(color: Colors.grey),
  focusedBorder: UnderlineInputBorder(
    borderSide: BorderSide(
      width: 3,
      color:  Color(0xff00d4ff),
    ),
  ),
);

const kOuterBoxDecoration =  BoxDecoration(
  gradient: LinearGradient(
    begin: Alignment.topCenter,
    colors: [
      Color(0xff090979),
      Color(0xff00d4ff),
    ],
  ),
);
const kInnerBoxDecoration =  BoxDecoration(
  color: Colors.white,
  borderRadius: BorderRadius.only(
    topLeft: Radius.circular(20),
    topRight: Radius.circular(20),
    bottomLeft: Radius.circular(20),
    bottomRight: Radius.circular(20),
  ),
);

const kLBottomTextStyle = TextStyle(
    color: Colors.white,
    fontSize: 20,
    fontWeight: FontWeight.w500);

const colorizeColors = [
  Colors.white,
  Colors.purple,
  Colors.blue,
  Colors.yellow,
  Colors.red,
];