import 'package:ecommerce/controller/setting_controller.dart';
import 'package:ecommerce/core/constant/color.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CustomListSetting extends GetView<SettingControllerImp> {
  const CustomListSetting({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          ...List.generate(controller.titlesList.length, (index) {
            return Column(
              children: [
                ListTile(
                  onTap:controller.functionList[index],
                  title: Text(controller.titlesList[index]),
                  trailing:Icon(controller.iconList[index],),
                ),
                const Divider(),
              ],
            );
          }),
        ],
      ),
    );
  }
}
