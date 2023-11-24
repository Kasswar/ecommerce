import 'package:ecommerce/core/constant/routes.dart';
import 'package:ecommerce/core/services/sevices.dart';
import 'package:ecommerce/data/model/couponmodel.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:path/path.dart';

import '../core/class/statuesrequest.dart';
import '../core/constant/color.dart';
import '../core/functions/handlingdata.dart';
import '../data/datasourse/remote/AddressModel.dart';
import '../data/datasourse/remote/addressdata.dart';
import '../data/datasourse/remote/checkoutdata.dart';
import '../view/widget/auth/custombuttonauth.dart';
import '../view/widget/checkout/customcheckoutbutton.dart';
import '../view/widget/checkout/orderdetails.dart';

abstract class CheckoutController extends GetxController {
  initialData();
  getData();
  checkCoupon(String couponName);
  paymentMethodFun(String val, bool isActiveColor);
  deliveryTypeFun(String val, bool isActiveColor);
  shippingAddressFun(String val);
  addUsingCoupon();
  addOrder(String deliveryPrice, String orderPrice, String orderTotalPrice);
}

class CheckoutControllerImp extends CheckoutController {
  CouponModel? couponModel;
  CheckoutData checkoutData = CheckoutData(crud: Get.find());
  AddressData addressData = AddressData(crud: Get.find());
  StatuesRequest? statuesRequest;
  List<AddressModel> addressModelList = [];
  MyServices myServices = Get.find();
  TextEditingController? couponController;
  GlobalKey<FormState> key = GlobalKey<FormState>();
  String paymentMethod = "0";
  String deliveryType = "0";
  String addressId = "0";
  String couponId = "0";
  bool isActivePayment = true;
  bool isActiveDelivery = false;
  int couponDiscount = 10;
  late double subTotalDiscount;
  late double priceWithCoupon;
  List<String> orderDetails = [
    "Price:",
    "Price With Coupon:",
    "Payment Method:",
    "Delivery Type:",
    "Shipping Address:"
  ];

  @override
  void onInit() {
    initialData();
    super.onInit();
  }

  @override
  initialData() {
    couponController = TextEditingController();
    subTotalDiscount = Get.arguments["subTotalDiscount"];
    priceWithCoupon = Get.arguments["subTotalDiscount"];
    print(":::::::::::::::::::::::::::");
    print(subTotalDiscount);
    getData();
    update();
  }

  @override
  checkCoupon(String couponName) async {
    var response = await checkoutData.checkCoupon(couponName);
    print("-*-*-*-*-*-*-*-*-*-*-*");
    print(response['data']);
    if (response['statues'] == 'success') {
      Map<String, dynamic> data = response['data'];
      couponModel = CouponModel.fromJson(data);
      var response1 = await checkoutData.getUsingCoupon(
          couponModel!.couponId.toString(),
          myServices.sharedPreferences.getString("userId")!);
      statuesRequest = handlingData(response1);
      print("=*=*=*=*=*=*=*=*=*=*=*=*=*=*=*=*=*=");
      print(statuesRequest);
      if (response1['statues'] == "fail") {
        print(response['data']);
        couponDiscount = couponModel!.couponDiscount!;
        priceWithCoupon =
            subTotalDiscount - subTotalDiscount * couponDiscount / 100;
        Get.defaultDialog(
          title: "Order Details",
          radius: 0,
          titleStyle: const TextStyle(
            fontWeight: FontWeight.bold,
            color: AppColor.primaryColor,
          ),
          content: const OrderDetails(),
          actions: [
            CustomCheckoutButton(
              title: "Buy",
              color: AppColor.primaryColor,
              onTap: () async {
                addUsingCoupon();
                addOrder("20.12", subTotalDiscount.toString(),
                    priceWithCoupon.toString());
              },
            )
          ],
        );
        update();
      } else {
        Get.defaultDialog(
          title: "77".tr,
          middleText: "You have used this coupon before",
          cancel: CustomButtonAuth(
              height: 40,
              text: "87".tr,
              onPressed: () {
                Get.back();
              }),
        );
      }
    } else {
      Get.defaultDialog(
        title: "77".tr,
        middleText: "88".tr,
        cancel: CustomButtonAuth(
            height: 40,
            text: "87".tr,
            onPressed: () {
              Get.back();
            }),
      );
      //couponDiscount=0;
    }
    update();
  }

  @override
  paymentMethodFun(String val, bool isActiveColor) {
    paymentMethod = val;
    isActivePayment = isActiveColor;
    update();
  }

  @override
  deliveryTypeFun(String val, bool isActiveColor) {
    deliveryType = val;
    isActiveDelivery = isActiveColor;
    update();
  }

  @override
  @override
  getData() async {
    statuesRequest = StatuesRequest.loading;
    update();
    var response = await addressData
        .getData(myServices.sharedPreferences.getString("userId")!);
    statuesRequest = handlingData(response);
    print("--------*-*-*-*--------");
    print(response['data']);
    if (response['statues'] == 'success') {
      List data = response['data'];
      addressModelList.addAll(data.map((e) => AddressModel.fromJson(e)));
    } else {
      statuesRequest = StatuesRequest.fail;
    }
    update();
  }

  @override
  shippingAddressFun(String val) {
    addressId = val;
    update();
  }

  @override
  addOrder(
      String deliveryPrice, String orderPrice, String orderTotalPrice) async {
    var response = await checkoutData.addOrder(
        myServices.sharedPreferences.getString("userId").toString(),
        addressId,
        deliveryType,
        deliveryPrice,
        orderPrice,
        orderTotalPrice,
        paymentMethod,
        couponId);
    print("$response['statues']");
    update();
    Get.offAllNamed(AppRoutes.homeScreen);
  }

  @override
  addUsingCoupon() async {
    await checkoutData.addUsingCoupon(couponModel!.couponId.toString(),
        myServices.sharedPreferences.getString("userId")!);
  }
}
