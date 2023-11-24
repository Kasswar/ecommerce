import 'package:ecommerce/controller/homecontroller/home_controller.dart';
import 'package:ecommerce/core/functions/translatedatabase.dart';
import 'package:ecommerce/data/model/categoriesmodel.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../core/constant/color.dart';
import '../../../core/constant/links.dart';
import 'package:cached_network_image/cached_network_image.dart';

class CustomListCategories extends StatelessWidget {
  const CustomListCategories({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<HomeControllerImp>(builder:(controller){
      return Container(
        height: 140,
        margin: const EdgeInsets.symmetric(vertical: 10),
        padding: const EdgeInsets.symmetric(vertical: 15),
        alignment: Alignment.center,
        child: ListView.separated(
            scrollDirection: Axis.horizontal,
            itemBuilder: (context, index) {
              return Categories(
                categoriesModel: CategoriesModel.fromJson(
                  controller.categories[index],
                ),
                index: index,
              );
            },
            separatorBuilder: (context, index) {
              return const SizedBox(
                width: 15,
              );
            },
            itemCount: controller.categories.length),
      );
    });
  }
}

class Categories extends StatelessWidget{
  final CategoriesModel categoriesModel;
  final int index;
  const Categories({super.key, required this.categoriesModel, required this.index});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<HomeControllerImp>(builder:(controller){
      return InkWell(
        onTap: (){
          controller.goToItems(controller.categories, index, categoriesModel.categoriesId.toString());
        },
        child: Stack(
          children: [
            Container(
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(35),
                border: Border.all(color: AppColor.secondColor),
              ),
              child: CachedNetworkImage(
               imageUrl: "${AppLinks.categoriesImage}/${categoriesModel.categoriesImage}",
                height: 120,
                width: 160,
                fit: BoxFit.contain,
              ),
            ),
            Positioned(
              bottom: 0,
              child: Container(
                alignment: Alignment.center,
                width: 160,
                height: 35,
                decoration: BoxDecoration(
                  gradient:LinearGradient(
                      colors: [AppColor.primaryColor.withOpacity(0.78),AppColor.black.withOpacity(0.78)]
                  ),
                  borderRadius: const BorderRadius.only(
                    bottomLeft: Radius.circular(35),
                    bottomRight: Radius.circular(35),
                  ),
                ),
                child: Text(
                  translateDataBase("${categoriesModel.categoriesNameAr}","${categoriesModel.categoriesName}"),
                  style: const TextStyle(
                      height: 0,
                      color: AppColor.white,
                      fontWeight: FontWeight.bold),
                ),
              ),
            ),
          ],
        ),
      );
    });
  }
}
