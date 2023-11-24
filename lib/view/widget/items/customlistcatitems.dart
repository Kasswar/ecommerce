import 'package:ecommerce/controller/homecontroller/home_controller.dart';
import 'package:ecommerce/controller/homecontroller/items_controller.dart';
import 'package:ecommerce/core/functions/translatedatabase.dart';
import 'package:ecommerce/data/model/categoriesmodel.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../core/constant/color.dart';
import '../../../core/constant/links.dart';

class CustomListCatItems extends GetView<ItemsControllerImp> {
  const CustomListCatItems({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50,
      margin: const EdgeInsets.symmetric(vertical: 5),
      padding: const EdgeInsets.symmetric(vertical: 5),
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
              width: 7,
            );
          },
          itemCount: controller.categories.length),
    );
  }
}

class Categories extends StatelessWidget {
  final CategoriesModel categoriesModel;
  final int index;

  const Categories({super.key, required this.categoriesModel,required this.index});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<ItemsControllerImp>(
        builder:(controller){
          return InkWell(
            onTap: (){
              controller.changeCat(index,categoriesModel.categoriesId.toString());
            },
            child: Container(
              alignment: Alignment.center,
              width: 100,
              height: 35,
              decoration: BoxDecoration(
                gradient:LinearGradient(
                    colors: [controller.selectedCat==index?AppColor.backgroundColor:AppColor.primaryColor,controller.selectedCat==index?AppColor.backgroundColor:AppColor.black]
                ),
                borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(35),
                  bottomRight: Radius.circular(35),
                ),
                border: Border.all(
                  color: AppColor.primaryColor,
                  width: 1.5,
                ),
              ),
              child: Text(
                translateDataBase("${categoriesModel.categoriesNameAr}", "${categoriesModel.categoriesName}"),
                style:TextStyle(
                    height: 0,
                    color:controller.selectedCat==index?AppColor.secondColor.withOpacity(0.78): AppColor.backgroundColor,
                    fontWeight: FontWeight.bold),
              ),
            ),
          );
    });
  }
}
