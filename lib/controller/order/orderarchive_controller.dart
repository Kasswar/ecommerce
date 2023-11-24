import 'package:get/get.dart';

import '../../core/class/statuesrequest.dart';
import '../../core/constant/routes.dart';
import '../../core/functions/handlingdata.dart';
import '../../core/services/sevices.dart';
import '../../data/datasourse/remote/orderarchivedata.dart';
import '../../data/model/ordermodel.dart';

abstract class OrderArchiveController extends GetxController {
  initialData();
  getData();
  String printOrderStatus(int orderStatus);
  goToOrderDetails(String orderId);
}

class OrderArchiveControllerImp extends OrderArchiveController {
  MyServices myServices = Get.find();
  OrderArchiveData orderData = OrderArchiveData(crud: Get.find());
  List<OrderModel> ordersList = [];
  late StatuesRequest statusRequest;

  @override
  void onInit() {
    initialData();
    super.onInit();
  }

  @override
  initialData() {
    getData();
  }

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
}
