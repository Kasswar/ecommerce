import 'package:ecommerce/controller/homecontroller/search_controller.dart';
import 'package:ecommerce/core/services/sevices.dart';
import 'package:ecommerce/data/model/itemsmodel.dart';
import 'package:get/get.dart';

import '../../core/class/statuesrequest.dart';
import '../../core/constant/routes.dart';
import '../../core/functions/handlingdata.dart';
import '../../data/datasourse/remote/itemsdata.dart';
import 'itemdetails_controller.dart';

abstract class ItemsController extends GetxController {
  initialData();
  getData(String categoriesId, String userId);
  changeCat(int index, String categoryId);
  goToItemDetails(ItemsModel itemsModel);
  goToMyFavorite();
  search(String value);
}

class ItemsControllerImp extends ItemsController {
  SearchControllerImp searchControllerImp = Get.put(SearchControllerImp());
  MyServices myServices = Get.find();
  ItemsData itemsData = ItemsData(crud: Get.find());
  List categories = [];
  List items = [];
  int? selectedCat;
  String? categoriesId;
  bool isSearch = false;
  String? lang;
  String? userId;
  late StatuesRequest statuesRequest;

  @override
  void onInit() {
    initialData();
    super.onInit();
  }

  @override
  initialData() {
    categories = Get.arguments["categories"];
    selectedCat = Get.arguments["selectedCat"];
    categoriesId = Get.arguments["categoriesId"];
    lang = myServices.sharedPreferences.getString("lang");
    userId = myServices.sharedPreferences.getString("userId");
    getData(categoriesId!, userId!);
  }

  @override
  changeCat(index, categoryId) {
    selectedCat = index;
    categoriesId = categoryId;
    getData(categoryId, userId!);
    update();
  }

  @override
  getData(categoriesId, userId) async {
    items.clear();
    statuesRequest = StatuesRequest.loading;
    var response = await itemsData.getData(categoriesId, userId);
    statuesRequest = handlingData(response);
    if (statuesRequest == StatuesRequest.success) {
      if (response["statues"] == "fail") {
        statuesRequest = StatuesRequest.fail;
      } else {
        items.addAll(response["data"]);
      }
    }
    update();
  }

  @override
  search(String value) async {
    if (value.isNotEmpty) {
      isSearch = true;
      searchControllerImp.search(value);
    } else {
      isSearch = false;
    }
    update();
  }

  @override
  goToItemDetails(itemsModel) {
    Get.toNamed(AppRoutes.itemDetails, arguments: {"itemsModel": itemsModel});
  }

  @override
  goToMyFavorite() {
    Get.toNamed(AppRoutes.myFavorite);
  }
}
