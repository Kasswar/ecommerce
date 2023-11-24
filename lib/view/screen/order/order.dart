import 'package:ecommerce/controller/order/order_conroller.dart';
import 'package:ecommerce/core/class/handlingdataview.dart';
import 'package:ecommerce/view/widget/order/customordercart.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../core/constant/color.dart';

class OrdersScreen extends StatelessWidget {
  const OrdersScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<OrderControllerImp>(
        init: OrderControllerImp(),
        builder: (controller) {
          return SafeArea(
              child: Scaffold(
                  backgroundColor: AppColor.backgroundColor,
                  appBar: AppBar(
                    leading: IconButton(
                      icon: const Icon(Icons.archive),
                      onPressed: () {
                        controller.goToOrderArchive();
                      },
                    ),
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
                                .ordersList[index].ordersTotalprice!
                                .toStringAsFixed(2),
                            deliveryPrice: controller
                                .ordersList[index].ordersDeliveryprice!,
                            orderStatus: controller.printOrderStatus(
                                controller.ordersList[index].ordersStatus!),
                            paymentMethod: controller
                                .ordersList[index].ordersPaymentmethod!,
                            totalPrice: (controller
                                        .ordersList[index].ordersTotalprice! +
                                    controller
                                        .ordersList[index].ordersDeliveryprice!)
                                .toStringAsFixed(2),
                            detailsFun: () {
                              controller.goToOrderDetails(controller
                                  .ordersList[index].ordersId
                                  .toString());
                            },
                            deleteFun: () {
                              controller.deleteData(controller
                                  .ordersList[index].ordersId
                                  .toString());
                              controller.getData();
                            },
                          );
                        },
                      ),
                    ),
                  )));
        });
  }
}
