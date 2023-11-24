import 'package:ecommerce/controller/order/order_conroller.dart';
import 'package:ecommerce/core/class/handlingdataview.dart';
import 'package:ecommerce/view/widget/order/customordercart.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../controller/order/orderarchive_controller.dart';
import '../../../core/constant/color.dart';

class OrdersArchiveScreen extends StatelessWidget {
  const OrdersArchiveScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<OrderArchiveControllerImp>(
        init: OrderArchiveControllerImp(),
        builder: (controller) {
          return SafeArea(
              child: Scaffold(
                  backgroundColor: AppColor.backgroundColor,
                  appBar: AppBar(
                    iconTheme: const IconThemeData(
                      color: AppColor.black,
                    ),
                    title: Text(
                      "126".tr,
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
                  body: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 10),
                    child: HandlingDataView(
                      statuesRequest: controller.statusRequest,
                      widget: ListView.builder(
                        itemCount: controller.ordersList.length,
                        itemBuilder: (context, index) {
                          return CustomOrderCard(
                            orderNumber: controller.ordersList[index].ordersId!,
                            orderDate:
                                controller.ordersList[index].ordersDatetime!,
                            orderPrice: controller
                                .ordersList[index].ordersPrice!
                                .toStringAsFixed(2),
                            deliveryPrice: controller
                                .ordersList[index].ordersDeliveryprice!,
                            orderStatus: controller.printOrderStatus(
                                controller.ordersList[index].ordersStatus!),
                            paymentMethod: controller
                                .ordersList[index].ordersPaymentmethod!,
                            totalPrice: controller
                                .ordersList[index].ordersTotalprice!
                                .toStringAsFixed(2),
                            detailsFun: () {
                              controller.goToOrderDetails(controller
                                  .ordersList[index].ordersId
                                  .toString());
                            },
                            deleteFun: null,
                          );
                        },
                      ),
                    ),
                  )));
        });
  }
}
