import 'package:ecommerce/controller/test_controller.dart';
import 'package:ecommerce/core/class/handlingdataview.dart';
import 'package:ecommerce/core/class/statuesrequest.dart';
import 'package:ecommerce/core/constant/color.dart';
import 'package:ecommerce/view/widget/itemdetails/customitemimage.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'core/responsive/devicemodel.dart';
import 'core/responsive/responsivewidget.dart';

class Test extends StatelessWidget {
  const Test({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    MediaQueryData mediaQueryData = MediaQuery.of(context);
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    print("************************");
    print(height);
    print(width);
    return Scaffold(
      body: Column(
        children: [
          ClipPath(
            clipper: CustomClipPath(),
            child: Container(
              height: 500,
              width: double.infinity,
              color: AppColor.primaryColor,
            ),
          ),
        ],
      ),
    );
  }
}
