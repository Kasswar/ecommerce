import 'package:ecommerce/controller/address/view_controller.dart';
import 'package:ecommerce/core/class/handlingdataview.dart';
import 'package:ecommerce/core/constant/color.dart';
import 'package:ecommerce/core/constant/routes.dart';
import 'package:ecommerce/view/widget/address/customappbar.dart';
import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:get/get.dart';

import '../../widget/address/customaddresscard.dart';

class AddressView extends StatelessWidget {
  const AddressView({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<ViewAddressControllerImp>(
      init: ViewAddressControllerImp(),
        builder: (controller) {
      return SafeArea(
        child: Scaffold(
          body: Container(
            padding: const EdgeInsets.only(top: 15),
            child: Column(
              children: [
                const CustomAppBar(),
                Expanded(
                  child:HandlingDataView(
                    statuesRequest: controller.statuesRequest,
                    widget:ListView.builder(
                      shrinkWrap: true,
                      // physics:const ScrollPhysics(),
                      itemCount: controller.addressModelList.length,
                      itemBuilder: (context, index) {
                        return CustomAddressCard(
                          dismissKey:controller.addressModelList[index].addressId.toString(),
                          onDismissed: (DismissDirection dismissDirection){
                            controller.deleteData(controller.addressModelList[index].addressId.toString());
                          },
                          addressName:"${controller.addressModelList[index].addressName}",
                          addressCity:"${controller.addressModelList[index].addressCity}",
                          addressStreet:"${controller.addressModelList[index].addressStreet}",
                        );
                      },
                    ),
                  ),
                ),
              ],
            ),
          ),
          floatingActionButton: FloatingActionButton(
            backgroundColor: AppColor.secondColor,
            onPressed: () async {
              bool serviceEnabled = await Geolocator.isLocationServiceEnabled();
              if (serviceEnabled) {
                Get.toNamed(AppRoutes.addressAdd);
              } else {
                Get.snackbar("warning", "Please able Location services.",
                    backgroundColor: Colors.white);
              }
            },
            child: const Icon(
              Icons.add_location_alt,
              color: AppColor.white,
            ),
          ),
        ),
      );
    });
  }
}
