import 'package:ecommerce/controller/cart_controller.dart';
import 'package:ecommerce/controller/homecontroller/items_controller.dart';
import 'package:ecommerce/data/model/itemsmodel.dart';
import 'package:get/get.dart';

import '../../core/class/statuesrequest.dart';
import '../../core/constant/routes.dart';
import '../../core/functions/handlingdata.dart';
import '../../core/services/sevices.dart';
import '../../data/datasourse/remote/cartdata.dart';

abstract class ItemDetailsController extends GetxController {
  initialData();
  void add();
  void delete();
  goToCart();
  refreshItemsCount();
  cartGetCount(String itemsId);
  cartAdd(String itemsId, String itemsCount);
}

class ItemDetailsControllerImp extends ItemDetailsController {
  CartData cartData = CartData(crud: Get.find());
  MyServices myServices = Get.find();
  late StatuesRequest statuesRequest;
  ItemsModel? itemsModel;
  //String? userId;
  int itemsCount = 0;

  @override
  void onInit() {
    initialData();
    super.onInit();
    update();
  }

  @override
  initialData() async {
    print("=========================1====================");
    itemsModel = Get.arguments["itemsModel"];
    print(
        "=========================2${itemsModel!.itemsName}====================");
    itemsCount = await cartGetCount(itemsModel!.itemsId.toString());
    print("=========================$itemsCount====================");
    update();
  }

  @override
  add() {
    itemsCount++;
    update();
  }

  @override
  delete() {
    if (itemsCount > 0) {
      itemsCount--;
      update();
    }
  }

  @override
  cartGetCount(String itemsId) async {
    statuesRequest = StatuesRequest.loading;
    var response = await cartData.cartGetCount(
        myServices.sharedPreferences.getString("userId")!, itemsId);
    statuesRequest = handlingData(response);
    if (statuesRequest == StatuesRequest.success) {
      if (response["statues"] == "fail") {
        return 0;
      } else {
        return response["data"]["cart_itemscount"];
      }
    }
    update();
  }

  @override
  cartAdd(String itemsId, String itemsCount) async {
    var response = await cartData.cartAdd(
        myServices.sharedPreferences.getString("userId")!, itemsId, itemsCount);
    statuesRequest = handlingData(response);
    print(response);
    if (statuesRequest == StatuesRequest.success) {
      if (response["statues"] == "fail") {
      } else {}
    }
    update();
  }

  @override
  goToCart() {
    Get.toNamed(AppRoutes.cart);
  }

  @override
  refreshItemsCount() async {
    itemsCount = await cartGetCount(itemsModel!.itemsId.toString());
    update();
  }
}
