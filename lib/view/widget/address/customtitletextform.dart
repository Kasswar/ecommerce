import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../controller/address/add_controller.dart';

class CustomTitleTextForm extends GetView<AddControllerImp> {
  const CustomTitleTextForm({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          "81".tr,
          style: Theme.of(context).textTheme.headline1!,
          textAlign: TextAlign.center,
        ),
        ...List.generate(
          controller.hintTextList.length,
              (index){
            return Padding(
              padding: const EdgeInsets.symmetric(vertical: 15),
              child: TextFormField(
                validator:(String? value){
                  if(value!.isEmpty){
                    return "49".tr;
                  }
                },
                controller: controller.textEditingControllerList[index],
                decoration: InputDecoration(
                  hintStyle:const TextStyle(fontSize: 14,fontWeight: FontWeight.bold),
                  hintText:controller.hintTextList[index],
                  contentPadding:const EdgeInsets.symmetric(horizontal: 30,vertical: 0),
                  suffixIcon: Icon(controller.iconsList[index]),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(35),
                  ),
                ),
              ),
            );
          },
        ),
      ],
    );
  }
}
