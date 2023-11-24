import 'package:ecommerce/controller/order/orderdetails_controller.dart';
import 'package:ecommerce/core/functions/translatedatabase.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../core/constant/color.dart';

class CustomOrderTable extends GetView<OrderDetailsControllerImp> {
  const CustomOrderTable({super.key});

  @override
  Widget build(BuildContext context) {
    return Table(
      border: TableBorder.all(
        color: AppColor.black,
        width: 1.5,
        borderRadius: BorderRadius.circular(
          20,
        ),
      ),
      children: [
        TableRow(
          decoration: BoxDecoration(
            color: AppColor.thirdColor.withOpacity(0.4),
            borderRadius: const BorderRadius.only(
              topLeft: Radius.circular(20),
              topRight: Radius.circular(20),
            ),
          ),
          children: [
            ...List.generate(
              controller.titleList.length,
              (index) => Text(
                controller.titleList[index],
                textAlign: TextAlign.center,
                style: const TextStyle(
                  fontSize: 15,
                  fontWeight: FontWeight.bold,
                  color: AppColor.secondColor,
                  height: 0,
                ),
              ),
            ),
          ],
        ),
        ...List.generate(
          controller.ordersDetalsList.length,
          (index) => TableRow(
            children: [
              Text(
                translateDataBase(
                    "${controller.ordersDetalsList[index].itemsNameAr}",
                    "${controller.ordersDetalsList[index].itemsName}"),
                textAlign: TextAlign.center,
                style: const TextStyle(
                  color: AppColor.black,
                  height: 0,
                ),
              ),
              Text(
                "${controller.ordersDetalsList[index].cartItemscount}",
                textAlign: TextAlign.center,
                style: const TextStyle(
                  color: AppColor.black,
                  height: 0,
                ),
              ),
              Text(
                "${((controller.ordersDetalsList[index].cartItemscount)! * (controller.ordersDetalsList[index].itemsPricediscount)!).toStringAsFixed(2)}\$",
                textAlign: TextAlign.center,
                style: const TextStyle(
                  color: AppColor.black,
                  height: 0,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
