import 'package:ecommerce/core/constant/color.dart';
import 'package:flutter/material.dart';

ThemeData englishTheme = ThemeData(
  fontFamily: "PlayFairDisplay",
  textTheme: const TextTheme(
    headline1: TextStyle(
        fontSize: 20, fontWeight: FontWeight.bold, color: AppColor.black),
    headline2: TextStyle(
        fontSize: 24, fontWeight: FontWeight.bold, color: AppColor.black),
    bodyText1: TextStyle(height: 2, color: AppColor.grey, fontSize: 17),
    bodyText2: TextStyle(
      height: 2,
      color: AppColor.grey,
      fontSize: 14,
    ),
  ),
);
ThemeData arabicTheme = ThemeData(
  fontFamily: "Cairo",
  textTheme: const TextTheme(
    headline1: TextStyle(
        fontSize: 20, fontWeight: FontWeight.bold, color: AppColor.black),
    headline2: TextStyle(
        fontSize: 24, fontWeight: FontWeight.bold, color: AppColor.black),
    bodyText1: TextStyle(height: 2, color: AppColor.grey, fontSize: 17),
    bodyText2: TextStyle(
      height: 2,
      color: AppColor.grey,
      fontSize: 14,
    ),
  ),
);
