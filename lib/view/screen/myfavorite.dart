import 'package:ecommerce/controller/myfavorite_controller.dart';
import 'package:ecommerce/core/class/statuesrequest.dart';
import 'package:ecommerce/data/model/myfavoritemodel.dart';
import 'package:ecommerce/view/screen/home/search.dart';
import 'package:ecommerce/view/widget/customsearchnotification.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../core/class/handlingdataview.dart';
import '../widget/myfavorite/customfavoriteitemcard.dart';

class MyFavorite extends StatelessWidget {
  const MyFavorite({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<MyFavoriteControllerImp>(
        init: MyFavoriteControllerImp(),
        builder: (controller) {
          return WillPopScope(
            onWillPop: () {
              return Future.value(true);
            },
            child: SafeArea(
              child: Scaffold(
                body: Container(
                  padding: const EdgeInsets.only(left: 10, right: 10, top: 20),
                  child: Column(
                    //physics: NeverScrollableScrollPhysics(),
                    children: [
                      CustomSearchNotification(
                        hintText: "59".tr,
                        searchFun: (value) {
                          controller.search(value);
                          controller.isSearch == false
                              ? controller.getData()
                              : null;
                        },
                        notificationFun: () {},
                      ),
                      SizedBox(
                        height: controller.statuesRequest == StatuesRequest.fail
                            ? 220
                            : 15,
                      ),
                      controller.isSearch == false
                          ? HandlingDataView(
                              statuesRequest: controller.statuesRequest,
                              widget: Expanded(
                                child: GridView.builder(
                                  itemCount: controller.data.length,
                                  itemBuilder: (context, index) {
                                    return CustomFavoriteItemCard(
                                      myFavoriteModel: controller.data[index],
                                    );
                                  },
                                  shrinkWrap: true,
                                  physics: const ScrollPhysics(),
                                  gridDelegate:
                                      SliverGridDelegateWithFixedCrossAxisCount(
                                    crossAxisCount: 2,
                                    mainAxisSpacing: 5,
                                    crossAxisSpacing: 3,
                                    childAspectRatio:
                                        controller.lang == "en" ? 0.716 : 0.679,
                                    //0.679 ar
                                  ),
                                ),
                              ))
                          : const Expanded(child: SearchScreen()),
                    ],
                  ),
                ),
              ),
            ),
          );
        });
  }
}
