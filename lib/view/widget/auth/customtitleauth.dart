import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CustomTitleAuth extends StatelessWidget {
  final String title;
  const CustomTitleAuth({Key? key, required this.title}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(title.tr,style: Theme.of(context).textTheme.headline2,textAlign: TextAlign.center,);
  }
}
