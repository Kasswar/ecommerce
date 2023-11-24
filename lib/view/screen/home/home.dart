import 'package:ecommerce/controller/homecontroller/home_controller.dart';
import 'package:ecommerce/core/class/handlingdataview.dart';
import 'package:ecommerce/core/constant/color.dart';
import 'package:ecommerce/core/constant/links.dart';
import 'package:ecommerce/view/screen/home/search.dart';
import 'package:ecommerce/view/widget/home/customcategoriestitle.dart';
import 'package:ecommerce/view/widget/home/customlistcategories.dart';
import 'package:ecommerce/view/widget/home/customlistitems.dart';
import 'package:ecommerce/view/widget/home/customproducttitle.dart';
import 'package:ecommerce/view/widget/home/custompromotion.dart';
import 'package:ecommerce/view/widget/customsearchnotification.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Home extends StatelessWidget {
  const Home({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    HomeControllerImp controller = Get.put(HomeControllerImp());
    return SafeArea(
      child: GetBuilder<HomeControllerImp>(
        builder: (controller) => HandlingDataRequest(
            statuesRequest: controller.statusRequest,
            widget: Container(
              padding: const EdgeInsets.only(left: 10, right: 10, top: 20),
              child: Column(
                //physics: controller.isSearch==false?const ScrollPhysics():const NeverScrollableScrollPhysics(),
                children: [
                  CustomSearchNotification(
                    hintText: "59".tr,
                    searchFun: (value) {
                      controller.search(value);
                    },
                    notificationFun: () {
                      controller.goToNotifications();
                    },
                  ),
                  controller.isSearch == false
                      ? Expanded(
                          child: ListView(
                            shrinkWrap: true,
                            children: const [
                              CustomPromotion(
                                  title: "Summer Surprice",
                                  body: "Cachback 20%"),
                              CustomCategoriesTitle(),
                              CustomListCategories(),
                              CustomProductsTitle(),
                              CustomListItems(),
                            ],
                          ),
                        )
                      : const Expanded(child: SearchScreen()),
                ],
              ),
            )),
      ),
    );
  }
}
