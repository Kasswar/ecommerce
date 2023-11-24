import 'package:ecommerce/controller/favorite_controller.dart';
import 'package:ecommerce/controller/homecontroller/items_controller.dart';
import 'package:ecommerce/core/class/handlingdataview.dart';
import 'package:ecommerce/core/constant/routes.dart';
import 'package:ecommerce/data/model/itemsmodel.dart';
import 'package:ecommerce/view/screen/home/search.dart';
import 'package:ecommerce/view/widget/customsearchnotification.dart';
import 'package:ecommerce/view/widget/items/customlistcatitems.dart';
import 'package:ecommerce/view/widget/items/customitemscard.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Items extends StatelessWidget {
  const Items({super.key});

  @override
  Widget build(BuildContext context) {
    Get.lazyPut(() => ItemsControllerImp(), fenix: true);
    return GetBuilder<ItemsControllerImp>(
        //init: ItemsControllerImp(),
        builder: (controller) {
      return SafeArea(
        child: Scaffold(
          body: Container(
            padding: const EdgeInsets.only(left: 10, right: 10, top: 20),
            child: Column(
              children: [
                CustomSearchNotification(
                    hintText: "59".tr,
                    searchFun: (value) {
                      controller.search(value);
                      controller.isSearch==false?controller.getData(controller.categoriesId!,controller.userId!):null;
                    },
                    notificationFun: () {}),
                Expanded(
                  child: controller.isSearch == false
                      ? Column(
                          children: [
                            const CustomListCatItems(),
                            HandlingDataView(
                                statuesRequest: controller.statuesRequest,
                                widget: Expanded(
                                  child: GridView.builder(
                                    itemCount: controller.items.length,
                                    itemBuilder: (context, index) {
                                      return CustomItemCard(
                                        itemsModel: ItemsModel.fromJson(
                                            controller.items[index]),
                                      );
                                    },
                                    shrinkWrap: true,
                                    physics: const ScrollPhysics(),
                                    gridDelegate:
                                        SliverGridDelegateWithFixedCrossAxisCount(
                                      crossAxisCount: 2,
                                      mainAxisSpacing: 5,
                                      crossAxisSpacing: 3,
                                      childAspectRatio: controller.lang == "en"
                                          ? 0.716
                                          : 0.679,
                                      //0.679 ar
                                    ),
                                  ),
                                )),
                          ],
                        )
                      : const SearchScreen(),
                ),
              ],
            ),
          ),
        ),
      );
    });
  }
}
