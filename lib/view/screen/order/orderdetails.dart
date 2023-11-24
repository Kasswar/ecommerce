import 'package:ecommerce/controller/order/orderdetails_controller.dart';
import 'package:ecommerce/core/class/handlingdataview.dart';
import 'package:ecommerce/view/widget/order/orderdetails/customorderaddress.dart';
import 'package:ecommerce/view/widget/order/orderdetails/customtotalprice.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

import '../../../core/constant/color.dart';
import '../../widget/order/orderdetails/customordertable.dart';

class OrderDetailsScreen extends StatelessWidget {
  const OrderDetailsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<OrderDetailsControllerImp>(
      init: OrderDetailsControllerImp(),
      builder: (controller) {
        return SafeArea(
          child: Scaffold(
            backgroundColor: AppColor.backgroundColor,
            appBar: AppBar(
              iconTheme: const IconThemeData(
                color: AppColor.black,
              ),
              title: Text(
                "120".tr,
                style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 22,
                    color: AppColor.black,
                    height: 1.4),
              ),
              centerTitle: true,
              backgroundColor: AppColor.backgroundColor,
              elevation: 0,
            ),
            body: HandlingDataView(
              statuesRequest: controller.statusRequest,
              widget: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10),
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      const CustomOrderTable(),
                      const SizedBox(
                        height: 15,
                      ),
                      controller.ordersDetalsList.isNotEmpty
                          ? Column(
                              children: [
                                CustomTotalPrice(
                                    orderPrice: controller.ordersDetalsList[0]
                                            .ordersTotalprice! +
                                        controller.ordersDetalsList[0]
                                            .ordersDeliveryprice!),
                                const SizedBox(
                                  height: 15,
                                ),
                                controller.ordersDetalsList[0].addressCity !=
                                        null
                                    ? CustomOrderAddress(
                                        addressName: controller
                                            .ordersDetalsList[0].addressName!,
                                        city: controller
                                            .ordersDetalsList[0].addressCity!,
                                        street: controller
                                            .ordersDetalsList[0].addressStreet!,
                                        lat: controller
                                            .ordersDetalsList[0].addressLat!,
                                        lng: controller
                                            .ordersDetalsList[0].addressLong!,
                                      )
                                    : const SizedBox(
                                        height: 0,
                                      ),
                              ],
                            )
                          : const SizedBox()
                    ],
                  ),
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
