import 'package:ecommerce/controller/homecontroller/homescreen_controller.dart';
import 'package:ecommerce/view/widget/home/custombottomnavigationbar.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../core/constant/color.dart';
import 'home.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    HomeScreenControllerImp controller = Get.put(HomeScreenControllerImp());
    return GetBuilder<HomeScreenControllerImp>(
      builder: (controller) {
        return SafeArea(
          child: Scaffold(
            body: controller.pagesList.elementAt(controller.currentPage),
            bottomNavigationBar:const CustomBottomNavigationBar(),
          ),
        );
      },
    );
  }
}
