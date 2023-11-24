import 'package:ecommerce/controller/homecontroller/search_controller.dart';
import 'package:ecommerce/core/class/statuesrequest.dart';
import 'package:ecommerce/core/constant/routes.dart';
import 'package:ecommerce/core/functions/handlingdata.dart';
import 'package:ecommerce/core/services/sevices.dart';
import 'package:ecommerce/data/model/ordermodel.dart';
import 'package:get/get.dart';

import '../../data/datasourse/remote/orderdata.dart';

abstract class OrderController extends GetxController {
  initialData();
  deleteData(String orderId);
  getData();
  String printOrderStatus(int orderStatus);
  goToOrderDetails(String orderId);
  goToOrderArchive();
}

class OrderControllerImp extends OrderController {
  MyServices myServices = Get.find();
  OrderData orderData = OrderData(crud: Get.find());
  List<OrderModel> ordersList = [];
  late StatuesRequest statusRequest;

  @override
  getData() async {
    ordersList.clear();
    statusRequest = StatuesRequest.loading;
    update();
    var response = await orderData
        .getPendingOrders(myServices.sharedPreferences.getString("userId")!);
    statusRequest = handlingData(response);
    if (statusRequest == StatuesRequest.success) {
      if (response["statues"] == "fail") {
        statusRequest = StatuesRequest.fail;
      } else {
        List data = response['data'];
        // print(data);
        ordersList.addAll(data.map((e) => OrderModel.fromJson(e)));
        print(ordersList);
      }
    }
    update();
  }

  @override
  deleteData(String orderId) async {
    statusRequest = StatuesRequest.loading;
    update();
    var response = await orderData.deleteData(
        myServices.sharedPreferences.getString("userId")!, orderId);
    statusRequest = handlingData(response);
    if (statusRequest == StatuesRequest.success) {
      if (response["statues"] == "fail") {
        statusRequest = StatuesRequest.fail;
      }
    }
    update();
  }

  @override
  initialData() {
    getData();
  }

  @override
  void onInit() {
    initialData();
    super.onInit();
  }

  @override
  String printOrderStatus(int orderStatus) {
    if (orderStatus == 0) {
      return "116".tr;
    } else if (orderStatus == 1) {
      return "117".tr;
    } else if (orderStatus == 2) {
      return "118".tr;
    } else {
      return "125".tr;
    }
  }

  @override
  goToOrderDetails(String orderId) {
    Get.toNamed(AppRoutes.orderDetails, arguments: {"orderId": orderId});
  }

  @override
  goToOrderArchive() {
    Get.toNamed(
      AppRoutes.orderArchive,
    );
  }
}
