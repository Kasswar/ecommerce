import 'package:ecommerce/controller/address/add_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../core/constant/color.dart';
import 'customsavedetailsbutton.dart';
import 'customtitletextform.dart';

class CustomDetailsPageButton extends GetView<AddControllerImp> {
  const CustomDetailsPageButton({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 600,
      padding: const EdgeInsets.only(
          top: 30, left: 20, right: 20),
      decoration: const BoxDecoration(
        color: AppColor.backgroundColor,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(25),
          topRight: Radius.circular(25),
        ),
      ),
      child: Form(
        key: controller.key,
        child: Column(
          children: [
            const CustomTitleTextForm(),
            const SizedBox(
              height: 50,
            ),
            CustomSaveDetailsButton(
              onTap: () {
                controller.addData(
                  controller
                      .textEditingControllerList[
                  0]
                      .text
                      .toString(),
                  controller
                      .textEditingControllerList[
                  1]
                      .text
                      .toString(),
                  controller
                      .textEditingControllerList[
                  2]
                      .text
                      .toString(),
                  controller.markerLat
                      .toString(),
                  controller.markerLong
                      .toString(),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
