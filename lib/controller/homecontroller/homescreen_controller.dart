import 'package:ecommerce/view/screen/home/home.dart';
import 'package:ecommerce/view/screen/home/settings.dart';
import 'package:ecommerce/view/screen/myfavorite.dart';
import 'package:ecommerce/view/screen/order/order.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../core/services/sevices.dart';
import '../../view/screen/cart.dart';

abstract class HomeScreenController extends GetxController {
  changePage(int index);
}

class HomeScreenControllerImp extends HomeScreenController {
  MyServices myServices = Get.find();
  int currentPage = 2;
  List<Widget> pagesList = const [
    Settings(),
    OrdersScreen(),
    Home(),
    Cart(),
    MyFavorite(),
  ];
  List<IconData> iconList = [
    Icons.settings_outlined,
    Icons.card_travel,
    Icons.home_outlined,
    Icons.shopping_basket_outlined,
    Icons.favorite_outline_outlined,
  ];

  List<String> titleList = [
    "72".tr,
    "100".tr,
    "74".tr,
    "75".tr,
    "76".tr,
  ];

  @override
  void onInit() {
    super.onInit();
  }

  @override
  changePage(int index) {
    currentPage = index;
    print("+++++++++++++++++++++++");
    print(currentPage);
    update();
  }
}
