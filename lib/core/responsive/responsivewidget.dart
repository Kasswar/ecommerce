import 'devicetypefunction.dart';
import 'package:flutter/material.dart';
import 'devicemodel.dart';

class ResponsiveWidget extends StatelessWidget {
  final Widget Function(BuildContext context, DeviceModel deviceModel) builder;

  const ResponsiveWidget({super.key, required this.builder});

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (context, constraint) {
      MediaQueryData mediaQueryData = MediaQuery.of(context);
      DeviceModel deviceModel = DeviceModel(
          orientation: mediaQueryData.orientation,
          deviceType: getDeviceType(mediaQueryData),
          height: mediaQueryData.size.height,
          width: mediaQueryData.size.width,
          localHeight: constraint.maxHeight,
          localWidth: constraint.maxWidth);
      return builder(context,deviceModel);
    });
  }
}
