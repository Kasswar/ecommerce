import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../core/constant/color.dart';

class CustomAddressCheckout extends StatelessWidget {
  final String addressName;
  final String addressCity;
  final String addressStreet;
  final bool isActive;
  final int index;
  final void Function()? shippingAddressFun;
  const CustomAddressCheckout(
      {super.key,
      required this.addressName,
      required this.addressCity,
      required this.addressStreet,
      required this.shippingAddressFun,
      required this.isActive,
      required this.index});

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 10,
      child: ListTile(
        trailing: Text(
          "${index + 1}",
          style: TextStyle(
              color: isActive ? AppColor.backgroundColor : AppColor.black,
              fontWeight: FontWeight.bold,
              fontFamily: "sans"),
        ),
        tileColor: isActive ? AppColor.secondColor : AppColor.backgroundColor,
        onTap: shippingAddressFun,
        title: Text(
          addressName,
          style: TextStyle(
              color: isActive ? AppColor.backgroundColor : AppColor.black,
              fontWeight: FontWeight.bold),
        ),
        subtitle: RichText(
          text: TextSpan(children: [
            TextSpan(
                text: "${"82".tr}:",
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                  color: isActive
                      ? AppColor.backgroundColor
                      : AppColor.primaryColor,
                )),
            TextSpan(
                text: addressCity,
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                  color: isActive ? AppColor.backgroundColor : AppColor.black,
                )),
            const TextSpan(
              text: "   ",
            ),
            TextSpan(
                text: "${"83".tr}:",
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                  color: isActive
                      ? AppColor.backgroundColor
                      : AppColor.primaryColor,
                )),
            TextSpan(
                text: addressStreet,
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                  color: isActive ? AppColor.backgroundColor : AppColor.black,
                )),
          ]),
        ),
        //Text("City:${controller.addressModelList[index].addressCity}-Street:${controller.addressModelList[index].addressStreet}"),
      ),
    );
  }
}
