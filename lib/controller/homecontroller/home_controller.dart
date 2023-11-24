import 'package:ecommerce/controller/homecontroller/search_controller.dart';
import 'package:ecommerce/core/class/statuesrequest.dart';
import 'package:ecommerce/core/constant/routes.dart';
import 'package:ecommerce/core/functions/handlingdata.dart';
import 'package:ecommerce/core/services/sevices.dart';
import 'package:ecommerce/data/model/itemsmodel.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

import '../../data/datasourse/remote/homedata.dart';

abstract class HomeController extends GetxController {
  initialData();

  getData();

  goToItems(List categories, int selectedCat, String categoriesId);
  goToItemDetails(ItemsModel itemsModel);
  goToNotifications();
  search(String value);
}

class HomeControllerImp extends HomeController {
  SearchControllerImp searchControllerImp = Get.put(SearchControllerImp());
  MyServices myServices = Get.find();
  HomeData homeData = HomeData(crud: Get.find());
  List categories = [];
  List itemsDiscount = [];
  bool isSearch = false;
  late StatuesRequest statusRequest;
  String? lang;

  @override
  getData() async {
    statusRequest = StatuesRequest.loading;
    var response = await homeData.getData();
    statusRequest = handlingData(response);
    if (statusRequest == StatuesRequest.success) {
      if (response["statues"] == "fail") {
        statusRequest = StatuesRequest.fail;
      } else {
        categories.addAll(response["categories"]);
        itemsDiscount.addAll(response["itemsDiscount"]);
      }
    }
    update();
  }

  @override
  initialData() {
    //FirebaseMessaging.instance.subscribeToTopic("users");
    lang = myServices.sharedPreferences.getString("lang");
    getData();
  }

  @override
  void onInit() {
    initialData();
    super.onInit();
  }

  @override
  goToItems(categories, selectedCat, categoriesId) {
    Get.toNamed(AppRoutes.items, arguments: {
      "categories": categories,
      "selectedCat": selectedCat,
      "categoriesId": categoriesId
    });
  }

  @override
  search(String value) async {
    if (value.isNotEmpty) {
      isSearch = true;
      searchControllerImp.search(value);
    } else {
      isSearch = false;
    }
    update();
  }

  @override
  goToItemDetails(ItemsModel itemsModel) {
    Get.toNamed(AppRoutes.itemDetails, arguments: {"itemsModel": itemsModel});
  }

  @override
  goToNotifications() {
    Get.toNamed(AppRoutes.notifications);
  }
}
