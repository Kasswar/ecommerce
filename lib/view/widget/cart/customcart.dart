import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';
import '../../../controller/cart_controller.dart';
import '../../../core/constant/color.dart';
import '../../../core/constant/links.dart';
import '../../../core/functions/translatedatabase.dart';
import '../../../data/model/cartmodel.dart';
import 'package:get/get.dart';

class CustomCart extends StatelessWidget {
  final int index;
  final CartModel cartModel;

  const CustomCart({
    super.key,
    required this.cartModel,
    required this.index,
  });

  @override
  Widget build(BuildContext context) {
    return GetBuilder<CartControllerImp>(
        init: CartControllerImp(),
        builder: (controller) {
          //controller.itemsCount=cartModel.cartItemscount!;
          return Card(
            elevation: 15,
            shadowColor: AppColor.backgroundColor,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(25),
            ),
            child: Container(
              padding: const EdgeInsets.only(right: 10,left: 10),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(25),
                gradient:const LinearGradient(
                    colors: [AppColor.primaryColor,AppColor.black]
                ),
              ),
              height: 120,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  CachedNetworkImage(
                    imageUrl: "${AppLinks.itemsImage}/${cartModel.itemsImage}",
                    width: 120,
                    fit: BoxFit.contain,
                  ),
                  const VerticalDivider(
                    thickness: 1,
                    color: AppColor.primaryColor,
                  ),
                  SizedBox(
                    width: 162,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          translateDataBase(
                              cartModel.itemsNameAr!, cartModel.itemsName!),
                          style: const TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 13,
                            color: AppColor.white,
                            height: 0,
                          ),
                        ),
                        cartModel.itemsDiscount!>0?RichText(text: TextSpan(
                            children: [
                              TextSpan(
                                text:"${controller.priceForItem[index].toStringAsFixed(2)}\$",
                                style: const TextStyle(
                                  fontSize: 14,
                                  fontWeight: FontWeight.bold,
                                  fontFamily: "sans",
                                  height: 0,
                                  decoration: TextDecoration.lineThrough,
                                  color: AppColor.priceColor,
                                ),
                              ),
                            ]
                        ),textAlign: TextAlign.start,):const SizedBox(height: 0,),
                        Text(
                          "${controller.priceDiscountForItem[index].toStringAsFixed(2)}\$",
                          style: const TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 15,
                              color: AppColor.white,
                              height: 0,
                              fontFamily: "sans"),
                        ),
                        Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            ...List.generate(
                              5,
                              (index) => const Icon(
                                Icons.star_border_purple500_outlined,
                                color: AppColor.ratingColor,
                                size: 18,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      InkWell(
                        onTap: () async {
                          controller.increase(index);
                          controller.cartAdd(cartModel.itemsId.toString(),
                              (controller.itemsCount[index]).toString());
                          controller.countPrice(controller.itemsCount[index],
                              cartModel.itemsPrice!, index);
                          controller.countPriceDiscount(controller.itemsCount[index],
                              cartModel.itemsPricediscount!, index);
                        },
                        child: Container(
                          margin: const EdgeInsets.symmetric(vertical: 10),
                          alignment: Alignment.center,
                          width: 28,
                          height: 28,
                          decoration: BoxDecoration(
                            color: AppColor.primaryColor,
                            borderRadius: BorderRadius.circular(40),
                            border: Border.all(
                              color: AppColor.white,
                            ),
                          ),
                          child: const Icon(
                            Icons.add,
                            color: AppColor.backgroundColor,
                          ),
                        ),
                      ),
                      Text(
                        "${controller.itemsCount[index]}",
                        style: const TextStyle(
                          color: AppColor.white,
                            fontSize: 17,
                            fontWeight: FontWeight.bold,
                            fontFamily: "sans",
                            height: 0),
                      ),
                      InkWell(
                        onTap: () async {
                          controller.decrease(index);
                          controller.cartAdd(cartModel.itemsId.toString(),
                              (controller.itemsCount[index]).toString());
                          controller.itemsCount[index] == 0
                              ? controller.cartView()
                              : null;
                          controller.itemsCount.isNotEmpty?controller.countPrice(controller.itemsCount[index],
                              cartModel.itemsPrice!, index):null;
                          controller.itemsCount.isNotEmpty?controller.countPriceDiscount(controller.itemsCount[index],
                              cartModel.itemsPricediscount!, index):null;
                        },
                        child: Container(
                          margin: const EdgeInsets.symmetric(vertical: 10),
                          alignment: Alignment.center,
                          width: 28,
                          height: 28,
                          decoration: BoxDecoration(
                            color: AppColor.black,
                            borderRadius: BorderRadius.circular(40),
                            border: Border.all(
                              color: AppColor.white,
                            ),
                          ),
                          child: const Icon(
                            Icons.remove,
                            color: AppColor.backgroundColor,
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          );
        });
  }
}
