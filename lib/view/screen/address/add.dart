import 'package:ecommerce/controller/address/add_controller.dart';
import 'package:ecommerce/core/class/handlingdataview.dart';
import 'package:ecommerce/core/constant/color.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

import '../../widget/address/customaddressdetailsbutton.dart';
import '../../widget/address/customcurrentlocationbutton.dart';
import '../../widget/address/customdetailspageputton.dart';
import '../../widget/address/customgooglemap.dart';
import '../../widget/address/customsavedetailsbutton.dart';
import '../../widget/address/customtitletextform.dart';

class AddressAdd extends StatelessWidget {
  const AddressAdd({super.key});

  @override
  Widget build(BuildContext context) {
    AddControllerImp controller = Get.put(AddControllerImp());
    return GetBuilder<AddControllerImp>(builder: (controller) {
      return SafeArea(
        child: Scaffold(
          body: Stack(
            alignment: AlignmentDirectional.center,
            children: [
              HandlingDataView(
                statuesRequest: controller.statuesRequest,
                widget: controller.kGooglePlex != null
                    ? CustomGoogleMap(
                        onTap: (latLong) {
                          controller.addMarker(latLong);
                        },
                        onMapCreated: (GoogleMapController controllerMap) {
                          controller.completeController!
                              .complete(controllerMap);
                          controller.controllerMap = controllerMap;
                        },
                      )
                    : const CircularProgressIndicator(),
              ),
              //CustomAppBarAddress(title: "80".tr,),
              controller.kGooglePlex != null
                  ? Positioned(
                      bottom: 25,
                      left: 20,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          CustomCurrentLocationButton(
                            onTap: () async {
                              await controller.getCurrentLocation();
                              await controller.controllerMap!.animateCamera(
                                CameraUpdate.newLatLng(
                                  LatLng(
                                    controller.markerLat!,
                                    controller.markerLong!,
                                  ),
                                ),
                              );
                            },
                          ),
                          const SizedBox(
                            width: 20,
                          ),
                          CustomAddressDetailsButton(
                            onTap: () {
                              showModalBottomSheet(
                                  isScrollControlled: true,
                                  context: context,
                                  shape: const RoundedRectangleBorder(
                                    borderRadius: BorderRadius.vertical(
                                        top: Radius.circular(25)),
                                  ),
                                  builder: (context) {
                                    return const CustomDetailsPageButton();
                                  });
                            },
                          ),
                        ],
                      ),
                    )
                  : const SizedBox(
                      height: 0,
                    ),
              controller.kGooglePlex != null
                  ? Positioned(
                      left: 60,
                      top: 11,
                      child: Container(
                        alignment: Alignment.center,
                        height: 40,
                        width: 40,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(50),
                          border: Border.all(width: 1.5),
                          color: AppColor.black.withOpacity(0),
                        ),
                        child: IconButton(
                            onPressed: () {
                              Get.back();
                            },
                            icon: const Icon(
                              Icons.arrow_back,
                              color: AppColor.black,
                              size: 25,
                            )),
                      ),
                    )
                  : const SizedBox(
                      height: 0,
                    ),
            ],
          ),
        ),
      );
    });
  }
}
