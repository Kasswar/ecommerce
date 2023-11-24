import 'package:ecommerce/core/class/statuesrequest.dart';
import 'package:ecommerce/core/functions/handlingdata.dart';
import 'package:ecommerce/core/services/sevices.dart';
import 'package:get/get.dart';

import '../data/datasourse/remote/notificationdata.dart';

abstract class NotificationsController extends GetxController {
  initialData();
  getNotifications();
}

class NotificationsControllerImp extends NotificationsController {
  MyServices myServices = Get.find();
  NotificationData notificationData = NotificationData(crud: Get.find());
  List notificationsList = [];
  late StatuesRequest statusRequest;
  String? lang;

  @override
  void onInit() {
    initialData();
    super.onInit();
  }

  @override
  initialData() async {
    await getNotifications();
    lang = myServices.sharedPreferences.getString("lang");
  }

  @override
  getNotifications() async {
    notificationsList.clear();
    statusRequest = StatuesRequest.loading;
    update();
    var response = await notificationData
        .getNotifications(myServices.sharedPreferences.getString("userId")!);
    statusRequest = handlingData(response);
    if (statusRequest == StatuesRequest.success) {
      if (response["statues"] == "fail") {
        statusRequest = StatuesRequest.fail;
      } else {
        notificationsList = response['data'];
      }
    }
    update();
  }
}
