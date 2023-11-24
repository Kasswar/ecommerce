import 'dart:async';

import 'package:ecommerce/core/class/statuesrequest.dart';
import 'package:ecommerce/core/functions/handlingdata.dart';
import 'package:ecommerce/core/services/sevices.dart';
import 'package:ecommerce/data/datasourse/remote/orderdata.dart';
import 'package:ecommerce/data/datasourse/remote/orderdetailsdata.dart';
import 'package:ecommerce/data/model/orderdetailsmodel.dart';
import 'package:ecommerce/data/model/ordermodel.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

abstract class OrderDetailsController extends GetxController {
  initialData();
  getData();
  addMarker(LatLng latLong);
}

class OrderDetailsControllerImp extends OrderDetailsController {
  String? orderId;
  List<String> titleList = ["122".tr, "123".tr, "124".tr];
  Completer<GoogleMapController>? completeController;
  List<Marker> markers = [];
  CameraPosition? kGooglePlex;
  MyServices myServices = Get.find();
  OrderDetailsData orderDetailsData = OrderDetailsData(crud: Get.find());
  List<OrderDetailsModel> ordersDetalsList = [];
  late StatuesRequest statusRequest;
  double lat = 0;
  double lng = 0;

  @override
  void onInit() {
    initialData();
    super.onInit();
  }

  @override
  initialData() {
    orderId = Get.arguments['orderId'];
    completeController = Completer<GoogleMapController>();
    getData();
  }

  @override
  getData() async {
    ordersDetalsList.clear();
    statusRequest = StatuesRequest.loading;
    update();
    var response = await orderDetailsData.getData(
        myServices.sharedPreferences.getString("userId")!, orderId!);
    statusRequest = handlingData(response);
    if (statusRequest == StatuesRequest.success) {
      if (response["statues"] == "fail") {
        statusRequest = StatuesRequest.fail;
      } else {
        List data = response['data'];
        print("=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-");
        print(data);
        ordersDetalsList.addAll(data.map((e) => OrderDetailsModel.fromJson(e)));
        print(ordersDetalsList);
      }
    }
    update();
  }

  @override
  addMarker(LatLng latLong) {
    markers.clear();
    markers.add(
      Marker(markerId: const MarkerId("1"), position: latLong, draggable: true),
    );
    //markerLat=latLong.latitude;
    //markerLong=latLong.longitude;
    update();
  }
}
