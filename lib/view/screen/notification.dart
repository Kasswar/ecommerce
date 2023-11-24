import 'package:ecommerce/controller/notification_controller.dart';
import 'package:ecommerce/core/constant/color.dart';
import 'package:ecommerce/view/widget/checkout/customnotificationsform.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:jiffy/jiffy.dart';

class NotificationsScreen extends StatelessWidget {
  const NotificationsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<NotificationsControllerImp>(
      init: NotificationsControllerImp(),
      builder: (controller) {
        return SafeArea(
          child: Scaffold(
            backgroundColor: AppColor.backgroundColor,
            appBar: AppBar(
              iconTheme: const IconThemeData(
                color: AppColor.black,
              ),
              title: const Text(
                "Notifications",
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 22,
                    color: AppColor.black,
                    height: 1.4),
              ),
              centerTitle: true,
              backgroundColor: AppColor.backgroundColor,
              elevation: 0,
            ),
            body: ListView.builder(
              itemCount: controller.notificationsList.length,
              itemBuilder: (context, index) {
                return CustomNotificationsForm(
                  title:
                      "${controller.notificationsList[index]['notifications_title']}",
                  body:
                      "${controller.notificationsList[index]['notifications_body']}",
                  dateTime:
                      '${controller.notificationsList[index]['notifications_datetime']}',
                );
              },
            ),
          ),
        );
      },
    );
  }
}
