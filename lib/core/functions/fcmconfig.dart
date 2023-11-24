import 'package:ecommerce/controller/homecontroller/homescreen_controller.dart';
import 'package:ecommerce/controller/order/order_conroller.dart';
import 'package:ecommerce/core/constant/color.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter_ringtone_player/flutter_ringtone_player.dart';
import 'package:get/get.dart';

requestPermitionNotification() async {
  await FirebaseMessaging.instance.requestPermission(
    alert: true,
    announcement: false,
    badge: true,
    carPlay: false,
    criticalAlert: false,
    provisional: false,
    sound: true,
  );
}

fcmConfig() {
  FirebaseMessaging.onMessage.listen(
    (message) {
      print("==============Notification=================");
      print(message.notification!.title);
      print(message.notification!.body);
      FlutterRingtonePlayer.playNotification();
      Get.snackbar(
        message.notification!.title!,
        message.notification!.body!,
        colorText: AppColor.backgroundColor,
        backgroundColor: AppColor.black.withOpacity(0.5),
      );
      refreshPageNotifications(message.data);
    },
  );
}

refreshPageNotifications(data) async {
  HomeScreenControllerImp controller = Get.find();
  OrderControllerImp orderController = Get.find();
  if (controller.currentPage == 1 && data["pagename"] == "order") {
    await orderController.getData();
  }
}
