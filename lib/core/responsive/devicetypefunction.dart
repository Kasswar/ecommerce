import 'package:flutter/material.dart';

import 'devicetype.dart';

DeviceType getDeviceType(MediaQueryData mediaQueryData){
  double width=0;
  Orientation orientation=mediaQueryData.orientation;
  if(orientation ==Orientation.landscape){
    width=mediaQueryData.size.height;
  }else{
    width=mediaQueryData.size.width;
  }
  if(width>600){
    return DeviceType.Tablet;
  }
  return DeviceType.Mobile;
}