import 'package:ecommerce/controller/homecontroller/homescreen_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../core/constant/color.dart';
class CustomBottomNavigationBar extends StatelessWidget {
  const CustomBottomNavigationBar({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<HomeScreenControllerImp>(builder:(controller){
      return BottomNavigationBar(
        elevation: 10,
        selectedItemColor: AppColor.primaryColor,
        unselectedItemColor: AppColor.backgroundColor,
        selectedLabelStyle: const TextStyle(
            height: 0, fontSize: 14, fontWeight: FontWeight.bold,color: AppColor.primaryColor),
        selectedIconTheme: const IconThemeData(size: 30),
        type: BottomNavigationBarType.shifting,
        currentIndex: controller.currentPage,
        onTap: (int index) {
          controller.changePage(index);
        },
        items: [
          ...List.generate(controller.pagesList.length, (index) {
            return BottomNavigationBarItem(
                icon: Icon(controller.iconList[index]),
                label: controller.titleList[index],
              backgroundColor: AppColor.black,
            );
          })
        ],
      );
    });
  }
}
