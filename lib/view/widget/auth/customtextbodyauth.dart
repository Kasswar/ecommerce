import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CustomTextBodyAuth extends StatelessWidget {
  final String textBody;
  const CustomTextBodyAuth({Key? key, required this.textBody}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(textBody.tr,style: Theme.of(context).textTheme.bodyText2,textAlign: TextAlign.center,);
  }
}
