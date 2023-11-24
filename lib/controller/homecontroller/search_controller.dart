import 'package:ecommerce/core/class/statuesrequest.dart';
import 'package:ecommerce/core/constant/routes.dart';
import 'package:ecommerce/core/functions/handlingdata.dart';
import 'package:ecommerce/core/services/sevices.dart';
import 'package:ecommerce/data/model/itemsmodel.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import '../../data/datasourse/remote/searchdata.dart';
import 'itemdetails_controller.dart';

abstract class SearchController extends GetxController {
  initialData();
  goToItemDetails(itemsModel);
  search(String value);
}

class SearchControllerImp extends SearchController {
  MyServices myServices = Get.find();
  SearchData searchData = SearchData(crud: Get.find());
  List<ItemsModel> searchResult= [];
  TextEditingController? searchController;
  String? lang;
  late StatuesRequest statusRequest;

  @override
  initialData() {
    searchController=TextEditingController();
    lang=myServices.sharedPreferences.getString("lang");
    update();
  }

  @override
  void onInit() {
    initialData();
    super.onInit();
  }

  @override
  search(String value) async{
    searchResult.clear();
    statusRequest = StatuesRequest.loading;
    var response = await searchData.search(myServices.sharedPreferences.getString("userId")!, value);
    print("--------------------------------");
    print(response['data']);
    statusRequest = handlingData(response);
    if (statusRequest == StatuesRequest.success) {
      if (response["statues"] == "fail") {
        statusRequest = StatuesRequest.fail;
      } else {
        List data=response["data"];
        searchResult.addAll(data.map((e) => ItemsModel.fromJson(e)));
      }
    }
    update();
  }

  @override
  goToItemDetails(itemsModel) {
    Get.delete<ItemDetailsControllerImp>();
    Get.toNamed(AppRoutes.itemDetails,arguments:{"itemsModel":itemsModel});
  }
}
