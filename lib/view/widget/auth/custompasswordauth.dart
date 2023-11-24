import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CustomPasswordAuth extends GetView {
  final String myHint;
  final String myLabel;
  final String? Function(String?)? validInput;
  final TextEditingController? myController;

  const CustomPasswordAuth({
    Key? key,
    required this.myHint,
    required this.myLabel,
    required this.validInput,
    required this.myController,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    RxBool isPasswordHidden = true.obs;
    return Obx(
      () => TextFormField(
        validator: validInput,
        obscureText: isPasswordHidden.value,
        controller: myController,
        decoration: InputDecoration(
            hintStyle: const TextStyle(fontSize: 14),
            hintText: myHint.tr,
            contentPadding:
                const EdgeInsets.symmetric(horizontal: 30, vertical: 0),
            floatingLabelBehavior: FloatingLabelBehavior.always,
            suffixIcon: IconButton(
              icon: Icon(isPasswordHidden.value
                  ? Icons.visibility
                  : Icons.visibility_off),
              onPressed: () {
                isPasswordHidden.value = !isPasswordHidden.value;
              },
            ),
            label: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: Text(myLabel.tr),
            ),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(35),
            )),
      ),
    );
  }
}
