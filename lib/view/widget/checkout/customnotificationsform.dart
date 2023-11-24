import 'package:ecommerce/controller/notification_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:jiffy/jiffy.dart';

import '../../../core/constant/color.dart';

class CustomNotificationsForm extends GetView<NotificationsControllerImp> {
  final String title;
  final String body;
  final String dateTime;
  const CustomNotificationsForm(
      {super.key,
      required this.title,
      required this.body,
      required this.dateTime});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
      child: Stack(
        children: [
          ListTile(
            title: Text(
              title,
              style: const TextStyle(height: 0, fontWeight: FontWeight.bold),
            ),
            subtitle: Text(
              body,
              overflow: TextOverflow.ellipsis,
              maxLines: 1,
            ),
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20),
                side: const BorderSide(
                  width: 1.5,
                  color: AppColor.thirdColor,
                )),
          ),
          Positioned(
            right: controller.lang == "en" ? 15 : 270,
            top: controller.lang == "en" ? 10 : 8,
            child: Text(
              Jiffy.parse(dateTime).fromNow(),
              style: const TextStyle(height: 0, color: AppColor.primaryColor),
            ),
          ),
        ],
      ),
    );
  }
}
