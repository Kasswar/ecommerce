import 'package:cached_network_image/cached_network_image.dart';
import 'package:ecommerce/controller/homecontroller/home_controller.dart';
import 'package:ecommerce/data/model/itemsmodel.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../core/constant/color.dart';
import '../../../core/constant/imageasset.dart';
import '../../../core/constant/links.dart';
import '../../../core/functions/translatedatabase.dart';

class CustomListItems extends GetView<HomeControllerImp> {
  const CustomListItems({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 210,
      margin: const EdgeInsets.symmetric(vertical: 10),
      padding: const EdgeInsets.symmetric(vertical: 15),
      alignment: Alignment.center,
      child: ListView.separated(
        itemCount: controller.itemsDiscount.length,
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index) {
          return InkWell(
            onTap: () {
              print(controller.itemsDiscount[0]);
              controller.goToItemDetails(ItemsModel.fromJson(
                controller.itemsDiscount[index],
              ));
            },
            child: Items(
              itemsModel: ItemsModel.fromJson(
                controller.itemsDiscount[index],
              ),
            ),
          );
        },
        separatorBuilder: (context, index) {
          return const SizedBox(
            width: 15,
          );
        },
      ),
    );
  }
}

class Items extends StatelessWidget {
  final ItemsModel itemsModel;

  const Items({super.key, required this.itemsModel});

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.center,
      children: [
        Container(
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(35),
          ),
          child: CachedNetworkImage(
            imageUrl: "${AppLinks.itemsImage}/${itemsModel.itemsImage}",
            height: 180,
            width: 240,
            fit: BoxFit.contain,
          ),
        ),
        Container(
          alignment: Alignment.center,
          width: 240,
          height: 180,
          decoration: BoxDecoration(
            color: AppColor.grey.withOpacity(0.5),
            borderRadius: BorderRadius.circular(35),
          ),
        ),
        Text(
          translateDataBase(
              "${itemsModel.itemsNameAr}", "${itemsModel.itemsName}"),
          style: const TextStyle(
              height: 0,
              color: AppColor.white,
              fontSize: 16,
              fontWeight: FontWeight.bold),
        ),
        Positioned(
            left: 0,
            top: 0,
            child: Image.asset(
              AppImageAsset.sale2,
              height: 70,
              width: 70,
            )),
        Positioned(
          right: 0,
          top: 0,
          child: Container(
            alignment: Alignment.center,
            height: 40,
            width: 40,
            decoration: const BoxDecoration(
              color: AppColor.discountColor,
              borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(25),
                  topRight: Radius.circular(25)),
            ),
            child: Text(
              "${itemsModel.itemsDiscount!}%",
              style: const TextStyle(
                  color: AppColor.backgroundColor,
                  height: 0,
                  fontWeight: FontWeight.bold,
                  fontFamily: "sans",
                  fontSize: 14),
            ),
          ),
        ),
      ],
    );
  }
}
