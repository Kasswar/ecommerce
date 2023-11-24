import 'package:ecommerce/controller/favorite_controller.dart';
import 'package:ecommerce/controller/homecontroller/itemdetails_controller.dart';
import 'package:ecommerce/core/constant/color.dart';
import 'package:ecommerce/core/constant/links.dart';
import 'package:ecommerce/core/functions/translatedatabase.dart';
import 'package:ecommerce/view/widget/itemdetails/customgoaddtocart.dart';
import 'package:ecommerce/view/widget/itemdetails/customitemdesc.dart';
import 'package:ecommerce/view/widget/itemdetails/customitemnamerating.dart';
import 'package:ecommerce/view/widget/itemdetails/customitempricecount.dart';
import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:get/get.dart';

import '../../widget/itemdetails/customitemimage.dart';

class ItemDetails extends StatelessWidget {
  const ItemDetails({super.key});

  @override
  Widget build(BuildContext context) {
    FavoriteControllerImp controllerFav = Get.put(FavoriteControllerImp());
    return GetBuilder<ItemDetailsControllerImp>(
      init: ItemDetailsControllerImp(),
      builder: (controller) {
        return SafeArea(
          child: Scaffold(
            backgroundColor: AppColor.white,
            body: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                GetBuilder<FavoriteControllerImp>(builder: (controllerFav) {
                  return CustomItemImage(
                      itemsDiscount: controller.itemsModel!.itemsDiscount!,
                      goToItems: () {
                        Get.back();
                      },
                      favoriteFun: () {
                        if (controllerFav.favorite[
                                "${controller.itemsModel!.itemsId}"] ==
                            1) {
                          controllerFav.favoriteChange(
                              "${controller.itemsModel!.itemsId}", 0);
                          controllerFav.favoriteDelete(
                              "${controller.itemsModel!.itemsId}");
                        } else {
                          controllerFav.favoriteChange(
                              "${controller.itemsModel!.itemsId}", 1);
                          controllerFav
                              .favoriteAdd("${controller.itemsModel!.itemsId}");
                        }
                      },
                      iconType: controllerFav
                              .favorite["${controller.itemsModel!.itemsId}"] ??
                          0,
                      imageUrl:
                          "${AppLinks.itemsImage}/${controller.itemsModel!.itemsImage}");
                }),
                const SizedBox(
                  height: 80,
                ),
                Container(
                  height: 345,
                  padding: const EdgeInsets.all(15),
                  decoration: const BoxDecoration(
                    color: AppColor.backgroundColor,
                    borderRadius: BorderRadius.only(
                      topRight: Radius.circular(30),
                      topLeft: Radius.circular(30),
                    ),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      CustomItemNameRating(
                          itemName: translateDataBase(
                              "${controller.itemsModel!.itemsNameAr}",
                              "${controller.itemsModel!.itemsName}")),
                      CustomItemDesc(
                          itemDesc: translateDataBase(
                              "${controller.itemsModel!.itemsDescAr}",
                              "${controller.itemsModel!.itemsDesc}")),
                      CustomItemPriceCount(
                          itemPrice: controller.itemsModel!.itemsPrice!,
                          itemPriceDiscount:
                              controller.itemsModel!.itemsPricediscount!,
                          itemDiscount: controller.itemsModel!.itemsDiscount!,
                          itemCount: controller.itemsCount,
                          increaseFun: () {
                            controller.add();
                          },
                          decreaseFun: () {
                            controller.delete();
                          }),
                      const SizedBox(
                        height: 50,
                      ),
                      CustomGoAddToCart(
                        goToCart: () {
                          controller.refreshItemsCount();
                          controller.goToCart();
                        },
                        addToCart: () {
                          controller.cartAdd(
                              controller.itemsModel!.itemsId.toString(),
                              controller.itemsCount.toString());
                        },
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
