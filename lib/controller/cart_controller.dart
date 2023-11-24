import 'package:ecommerce/core/class/statuesrequest.dart';
import 'package:ecommerce/core/constant/routes.dart';
import 'package:ecommerce/core/services/sevices.dart';
import 'package:ecommerce/data/datasourse/remote/cartdata.dart';
import 'package:ecommerce/data/model/couponmodel.dart';
import 'package:ecommerce/data/model/itemsmodel.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

import '../core/functions/handlingdata.dart';
import '../data/model/cartmodel.dart';
import '../view/widget/auth/custombuttonauth.dart';
import 'homecontroller/itemdetails_controller.dart';

abstract class CartController extends GetxController {
  initialData();

  cartAdd(String itemsId, String itemsCount);

  cartView();

  cartGetCount(String itemsId);

  countPrice(int count, double price, int index);
  countPriceDiscount(int count, double price, index);

  increase(int index);
  decrease(int index);
  //checkCoupon(String couponName);
  goToCheckout();
}

class CartControllerImp extends CartController {
  ItemDetailsControllerImp detailsController =
      Get.put(ItemDetailsControllerImp());
  CartData cartData = CartData(crud: Get.find());
  MyServices myServices = Get.find();
  List<CartModel> cart = [];
  late StatuesRequest statuesRequest;
  List itemsCount = [];
  List priceForItem = [];
  List priceDiscountForItem = [];
  double subTotal = 0;
  double subTotalDiscount = 0;
  //---coupon----------------
  CouponModel? couponModel;
  //TextEditingController? couponController;
  int couponDiscount = 0;

  @override
  void onInit() {
    initialData();
    super.onInit();
  }

  @override
  initialData() {
    cartView();
  }

  @override
  cartAdd(String itemsId, String itemsCount) async {
    var response = await cartData.cartAdd(
        myServices.sharedPreferences.getString("userId")!, itemsId, itemsCount);
    statuesRequest = handlingData(response);
    if (statuesRequest == StatuesRequest.success) {
      if (response["statues"] == "fail") {
      } else {}
    }
    update();
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
  cartView() async {
    statuesRequest = StatuesRequest.loading;
    cart.clear();
    itemsCount.clear();
    priceForItem.clear();
    priceDiscountForItem.clear();
    subTotal = 0;
    subTotalDiscount = 0;
    update();
    var response = await cartData
        .cartView(myServices.sharedPreferences.getString("userId")!);
    statuesRequest = handlingData(response);
    if (statuesRequest == StatuesRequest.success) {
      if (response["statues"] == "fail") {
        statuesRequest = StatuesRequest.fail;
      } else {
        List data = response['data'];
        cart.addAll(data.map((e) => CartModel.fromJson(e)));
        for (int i = 0; i < cart.length; i++) {
          itemsCount.add(cart[i].cartItemscount);
          priceForItem.add(cart[i].itemsPrice! * cart[i].cartItemscount!);
          priceDiscountForItem
              .add(cart[i].itemsPricediscount! * cart[i].cartItemscount!);
          subTotal += priceForItem[i];
          subTotalDiscount += priceDiscountForItem[i];
        }
        print("++++++++++++++++++++++++++++++++");
        print(priceForItem);
      }
    }
    update();
  }

  @override
  countPrice(int count, double price, index) {
    priceForItem[index] = double.parse((count * price).toStringAsFixed(2));
    update();
  }

  @override
  countPriceDiscount(int count, double price, index) {
    priceDiscountForItem[index] =
        double.parse((count * price).toStringAsFixed(2));
    update();
  }

  @override
  decrease(index) {
    if (itemsCount[index] > 0) {
      itemsCount[index]--;
      subTotal -= cart[index].itemsPrice!;
      subTotalDiscount -= cart[index].itemsPricediscount!;
      if (detailsController.itemsModel != null) {
        if (detailsController.itemsModel!.itemsId == cart[index].itemsId) {
          detailsController.delete();
        }
      }
      update();
    }
  }

  @override
  increase(index) {
    itemsCount[index]++;
    subTotal += cart[index].itemsPrice!;
    subTotalDiscount += cart[index].itemsPricediscount!;
    if (detailsController.itemsModel != null) {
      if (detailsController.itemsModel!.itemsId == cart[index].itemsId) {
        detailsController.add();
      }
      update();
    }
  }

  @override
  goToCheckout() {
    Get.toNamed(AppRoutes.checkout,
        arguments: {"subTotalDiscount": subTotalDiscount});
  }
}
