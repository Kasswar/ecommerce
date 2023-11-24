import 'package:ecommerce/controller/order/orderdetails_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

import '../../../../core/constant/color.dart';

class CustomOrderAddress extends GetView<OrderDetailsControllerImp> {
  final String addressName;
  final String city;
  final String street;
  final double lat;
  final double lng;
  const CustomOrderAddress({
    super.key,
    required this.addressName,
    required this.city,
    required this.street,
    required this.lat,
    required this.lng,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ListTile(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20),
            side: const BorderSide(
              color: AppColor.black,
              width: 1.5,
            ),
          ),
          title: Text(
            addressName,
            style: const TextStyle(
                color: AppColor.black, fontWeight: FontWeight.bold),
          ),
          subtitle: RichText(
            text: TextSpan(children: [
              TextSpan(
                  text: "${"82".tr}:",
                  style: const TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      color: AppColor.primaryColor)),
              TextSpan(
                  text: city,
                  style: const TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      color: AppColor.grey)),
              const TextSpan(
                text: "   ",
              ),
              TextSpan(
                  text: "${"83".tr}:",
                  style: const TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      color: AppColor.primaryColor)),
              TextSpan(
                  text: street,
                  style: const TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      color: AppColor.grey)),
            ]),
          ),
        ),
        const SizedBox(
          height: 15,
        ),
        Card(
          elevation: 20,
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(20),
              side: const BorderSide(
                color: AppColor.black,
                width: 1.5,
              )),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(20),
            child: SizedBox(
              height: 400,
              child: GoogleMap(
                mapType: MapType.normal,
                markers: controller.markers.toSet(),
                initialCameraPosition: CameraPosition(
                  target: LatLng(lat, lng),
                  zoom: 13.4746,
                ),
                onMapCreated: (GoogleMapController controllerMap) {
                  controller.completeController!.complete(controllerMap);
                  controller.addMarker(LatLng(lat, lng));
                },
              ),
            ),
          ),
        ),
      ],
    );
  }
}
