import 'package:cached_network_image/cached_network_image.dart';
import 'package:ecommerce/controller/favorite_controller.dart';
import 'package:ecommerce/controller/homecontroller/items_controller.dart';
import 'package:ecommerce/core/constant/imageasset.dart';
import 'package:ecommerce/core/functions/translatedatabase.dart';

import 'package:ecommerce/data/model/itemsmodel.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../controller/homecontroller/search_controller.dart';
import '../../../core/constant/color.dart';
import '../../../core/constant/links.dart';

class CustomItemCard extends StatelessWidget {
  final ItemsModel itemsModel;
  const CustomItemCard({required this.itemsModel, super.key});

  @override
  Widget build(BuildContext context) {
    FavoriteControllerImp controllerFav = Get.put(FavoriteControllerImp());
    return GetBuilder<SearchControllerImp>(
        init: SearchControllerImp(),
        builder: (controller) {
          controllerFav.favorite["${itemsModel.itemsId}"] = itemsModel.favorite;
          return InkWell(
            onTap: () {
              controller.goToItemDetails(itemsModel);
            },
            child: Card(
              elevation: 7,
              shadowColor: AppColor.primaryColor,
              child: Stack(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Hero(
                          tag: itemsModel.itemsId!,
                          child: CachedNetworkImage(
                            imageUrl:
                                "${AppLinks.itemsImage}/${itemsModel.itemsImage}",
                            height: 110,
                            fit: BoxFit.fill,
                          ),
                        ),
                        Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            ...List.generate(
                              5,
                              (index) => Icon(
                                Icons.star_border_purple500_outlined,
                                color: AppColor.ratingColor,
                                size: 17,
                              ),
                            ),
                          ],
                        ),
                        Text(
                          translateDataBase("${itemsModel.itemsNameAr}",
                              "${itemsModel.itemsName}"),
                          textAlign: TextAlign.center,
                          style: const TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 14,
                              color: AppColor.black,
                              height: 1.3),
                          maxLines: 1,
                        ),
                        Text(
                          translateDataBase("${itemsModel.itemsDescAr}",
                              "${itemsModel.itemsDesc}"),
                          textAlign: TextAlign.center,
                          style: const TextStyle(height: 0, fontSize: 12),
                          maxLines: 2,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Column(
                              children: [
                                itemsModel.itemsDiscount! > 0
                                    ? RichText(
                                        text: TextSpan(children: [
                                          TextSpan(
                                            text: "${itemsModel.itemsPrice}\$",
                                            style: const TextStyle(
                                              fontSize: 14,
                                              fontWeight: FontWeight.bold,
                                              fontFamily: "sans",
                                              height: 0,
                                              decoration:
                                                  TextDecoration.lineThrough,
                                              color:
                                                  AppColor.priceDiscountColor,
                                            ),
                                          ),
                                        ]),
                                        textAlign: TextAlign.start,
                                      )
                                    : const SizedBox(
                                        height: 12,
                                      ),
                                Text(
                                  "${(itemsModel.itemsPricediscount!).toStringAsFixed(2)}\$",
                                  style: const TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.bold,
                                    fontFamily: "sans",
                                    height: 0,
                                    color: AppColor.priceColor,
                                  ),
                                ),
                              ],
                            ),
                            GetBuilder<FavoriteControllerImp>(
                                builder: (controllerFav) {
                              return IconButton(
                                  onPressed: () {
                                    if (controllerFav.favorite[
                                            "${itemsModel.itemsId}"] ==
                                        1) {
                                      controllerFav.favoriteChange(
                                          "${itemsModel.itemsId}", 0);
                                      controllerFav.favoriteDelete(
                                          "${itemsModel.itemsId}");
                                    } else {
                                      controllerFav.favoriteChange(
                                          "${itemsModel.itemsId}", 1);
                                      controllerFav
                                          .favoriteAdd("${itemsModel.itemsId}");
                                    }
                                  },
                                  icon: Icon(
                                    controllerFav.favorite[
                                                "${itemsModel.itemsId}"] ==
                                            1
                                        ? Icons.favorite
                                        : Icons.favorite_outline_outlined,
                                    color: AppColor.primaryColor,
                                  ));
                            }),
                          ],
                        ),
                      ],
                    ),
                  ),
                  itemsModel.itemsDiscount! > 0
                      ? Positioned(
                          left: -5,
                          top: -7,
                          child: Image.asset(
                            AppImageAsset.sale2,
                            height: 50,
                            width: 50,
                          ))
                      : const SizedBox(
                          height: 0,
                        ),
                  itemsModel.itemsDiscount! > 0
                      ? Positioned(
                          right: 0,
                          child: Container(
                            alignment: Alignment.center,
                            height: 40,
                            width: 40,
                            decoration: const BoxDecoration(
                              color: AppColor.discountColor,
                              borderRadius: BorderRadius.only(
                                  bottomLeft: Radius.circular(25)),
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
                        )
                      : const SizedBox(
                          height: 0,
                        ),
                ],
              ),
            ),
          );
        });
  }
}
