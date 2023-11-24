import 'dart:async';

import 'package:ecommerce/core/class/statuesrequest.dart';
import 'package:ecommerce/core/constant/routes.dart';
import 'package:ecommerce/core/services/sevices.dart';
import 'package:ecommerce/data/datasourse/remote/addressdata.dart';
import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

import '../../core/functions/handlingdata.dart';

abstract class AddController extends GetxController{
  initialData();
  getCurrentLocation();
  addMarker(LatLng latLong);
  addData(String city, String street, String addressName, String lat,
      String long);

}

class AddControllerImp extends AddController{
  GlobalKey<FormState> key=GlobalKey<FormState>();
  StatuesRequest statuesRequest =StatuesRequest.loading;
  AddressData addressData=AddressData(crud:Get.find());
  MyServices myServices=Get.find();
  Position? position;
  List<Marker> markers=[];
  double? markerLat;
  double? markerLong;
  List<String> hintTextList=["82".tr,"83".tr,"84".tr];
  List<IconData> iconsList=[Icons.location_city,Icons.streetview,Icons.place];
  List<TextEditingController> textEditingControllerList=[
    TextEditingController(),
    TextEditingController(),
    TextEditingController(),
  ];
  Completer<GoogleMapController>? completeController;
  GoogleMapController? controllerMap;

  CameraPosition? kGooglePlex;

  @override
  void onInit() {
    initialData();
    super.onInit();
  }

  @override
  initialData()async{
    completeController=Completer<GoogleMapController>();
    await getCurrentLocation();
    update();
  }

  @override
  getCurrentLocation()async{
    position =await Geolocator.getCurrentPosition();
    print("----------********--------------");
    print("${position!.latitude}, ${position!.longitude}");
    kGooglePlex=CameraPosition(
      target: LatLng(position!.latitude, position!.longitude),
      zoom: 14.4746,
    );
    markers.clear();
    markers.add(Marker(markerId:const MarkerId("1"),position:LatLng(position!.latitude,position!.longitude,),draggable: true));
    markerLat=position!.latitude;
    markerLong=position!.longitude;
    statuesRequest=StatuesRequest.success;
    update();
  }

  @override
  addMarker(LatLng latLong) {
    markers.clear();
    markers.add(Marker(markerId:const MarkerId("1"),position: latLong,draggable: true),);
    markerLat=latLong.latitude;
    markerLong=latLong.longitude;
    update();
  }

  @override
  addData(String city, String street, String addressName, String lat, String long)async {
    var formState=key.currentState;
    if(formState!.validate()){
      var response = await addressData.addData(city, street, addressName, lat, long, myServices.sharedPreferences.getString("userId")!);
      statuesRequest = handlingData(response);
      if (statuesRequest == StatuesRequest.success) {
        if (response["statues"] == "fail") {} else {}
      }
      print("===============AddressAdd================");
      print("$city, $street, $addressName, $lat, $long,");
      update();
      Get.offAllNamed(AppRoutes.homeScreen);
    }else{
      print("not valid");
    }
  }
}