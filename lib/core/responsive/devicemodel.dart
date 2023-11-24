import 'package:ecommerce/core/responsive/devicetype.dart';
import 'package:flutter/material.dart';
class DeviceModel{
  final Orientation orientation;
  final DeviceType deviceType;
  final double height;
  final double width;
  final double localHeight;
  final double localWidth;

  DeviceModel(
      {required this.orientation,
      required this.deviceType,
      required this.height,
      required this.width,
      required this.localHeight,
      required this.localWidth});
}