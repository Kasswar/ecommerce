import 'package:ecommerce/controller/homecontroller/search_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../core/class/handlingdataview.dart';
import '../../widget/items/customitemscard.dart';

class SearchScreen extends StatelessWidget {
  const SearchScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<SearchControllerImp>(builder:(controller){
      return Padding(
        padding: const EdgeInsets.only(top: 15),
        child: HandlingDataView(
            statuesRequest: controller.statusRequest,
            widget: GridView.builder(
              itemCount: controller.searchResult.length,
              itemBuilder: (context, index) {
                return CustomItemCard(
                  itemsModel:controller.searchResult[index],
                );
              },
              shrinkWrap: true,
              physics: const ScrollPhysics(),
              gridDelegate:
              SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                mainAxisSpacing: 5,
                crossAxisSpacing: 3,
                childAspectRatio:
                controller.lang == "en" ? 0.716 : 0.679,
                //0.679 ar
              ),
            )),
      );
    });
  }
}
