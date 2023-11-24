import 'package:ecommerce/controller/address/add_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class CustomGoogleMap extends GetView<AddControllerImp> {

  final void Function(LatLng)? onTap;
  final void Function(GoogleMapController)? onMapCreated;
  const CustomGoogleMap({required this.onTap,required this.onMapCreated,super.key});

  @override
  Widget build(BuildContext context) {
    return GoogleMap(
      mapType: MapType.normal,
      markers: controller.markers.toSet(),
      onTap: onTap,
      initialCameraPosition: controller.kGooglePlex!,
      onMapCreated: onMapCreated,
    );
  }
}
