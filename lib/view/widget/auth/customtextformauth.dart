import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CustomTextFormAuth extends StatelessWidget {
  final String myHint;
  final String myLabel;
  final IconData myIcon;
  final TextInputType? keyboard;
  final String? Function(String?)? validInput;
  final TextEditingController? myController;
  const CustomTextFormAuth({Key? key, required this.myHint, required this.myLabel, required this.myIcon,required this.keyboard,required this.validInput,required this.myController,}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      keyboardType: keyboard,
      validator: validInput,
      controller: myController,
      decoration: InputDecoration(
          hintStyle:const TextStyle(fontSize: 14),
          hintText:myHint.tr,
          contentPadding:const EdgeInsets.symmetric(horizontal: 30,vertical: 0),
          floatingLabelBehavior: FloatingLabelBehavior.always,
          suffixIcon: Icon(myIcon),
          label: Padding(
            padding:const EdgeInsets.symmetric(horizontal: 10),
            child: Text(myLabel.tr),
          ),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(35),
          )
      ),
    );
  }
}
