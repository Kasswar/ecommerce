import 'package:flutter/material.dart';

import '../../../core/constant/imageasset.dart';
class CustomLogoAuth extends StatelessWidget {
  final double width;
  final double height;
  const CustomLogoAuth({Key? key, required this.width, required this.height}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Image.asset(AppImageAsset.logo,width: 250,height: 220,);
  }
}
