
import 'package:cached_network_image/cached_network_image.dart';
import 'package:ecommerce/controller/favorite_controller.dart';
import 'package:ecommerce/controller/homecontroller/items_controller.dart';
import 'package:ecommerce/controller/myfavorite_controller.dart';
import 'package:ecommerce/core/functions/translatedatabase.dart';

import 'package:ecommerce/data/model/itemsmodel.dart';
import 'package:ecommerce/data/model/myfavoritemodel.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../core/constant/color.dart';
import '../../../core/constant/imageasset.dart';
import '../../../core/constant/links.dart';

class CustomFavoriteItemCard extends StatelessWidget {
  final MyFavoriteModel myFavoriteModel;
  const CustomFavoriteItemCard({required this.myFavoriteModel,super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<MyFavoriteControllerImp>(
      init: MyFavoriteControllerImp(),
        builder:(controller){
      return Card(
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
                    tag: myFavoriteModel.itemsId!,
                    child: CachedNetworkImage(
                      imageUrl: "${AppLinks.itemsImage}/${myFavoriteModel.itemsImage}",
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
                    translateDataBase("${myFavoriteModel.itemsNameAr}","${myFavoriteModel.itemsName}"),
                    textAlign: TextAlign.center,
                    style: const TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 14,
                        color: AppColor.black,
                        height: 1.3),
                    maxLines: 1,
                  ),
                  Text(
                    translateDataBase("${myFavoriteModel.itemsDescAr}","${myFavoriteModel.itemsDesc}"),
                    textAlign: TextAlign.center,
                    style:const TextStyle(height: 0,fontSize: 12),
                    maxLines: 2,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Column(
                        children: [
                          myFavoriteModel.itemsDiscount!>0?RichText(text: TextSpan(
                              children: [
                                TextSpan(
                                  text:"${myFavoriteModel.itemsPrice}\$",
                                  style: const TextStyle(
                                    fontSize: 14,
                                    fontWeight: FontWeight.bold,
                                    fontFamily: "sans",
                                    height: 0,
                                    decoration: TextDecoration.lineThrough,
                                    color: AppColor.priceDiscountColor,
                                  ),
                                ),
                              ]
                          ),textAlign: TextAlign.start,):const SizedBox(height: 12,),
                          Text(
                            "${(myFavoriteModel.itemsPricediscount!).toStringAsFixed(2)}\$",
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
                      IconButton(
                          onPressed: (){
                            controller.deleteFromFavorite(myFavoriteModel.favoriteId.toString());
                          },
                          icon:const Icon(
                            Icons.favorite,
                            color: AppColor.primaryColor,
                          )),
                    ],
                  ),
                ],
              ),
            ),
            myFavoriteModel.itemsDiscount!>0?Positioned(
                left: -11,
                top: -14,
                child: Image.asset(AppImageAsset.sale2,height: 100,width: 100,)):const SizedBox(height: 0,),
            myFavoriteModel.itemsDiscount!>0?Positioned(
              right: 0,
              child: Container(
                alignment: Alignment.center,
                height: 40,
                width: 40,
                decoration:const BoxDecoration(
                  color: AppColor.discountColor,
                  borderRadius: BorderRadius.only(bottomLeft: Radius.circular(25)),
                ),
                child: Text("${myFavoriteModel.itemsDiscount!}%",style:const TextStyle(color: AppColor.backgroundColor,height: 0,fontWeight: FontWeight.bold,fontFamily: "sans",fontSize: 14),),
              ),
            ):const SizedBox(height: 0,),
          ],
        )
      );
    });
  }
}
