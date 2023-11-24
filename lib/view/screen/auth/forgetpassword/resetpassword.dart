import 'package:ecommerce/core/class/handlingdataview.dart';
import 'package:ecommerce/core/responsive/responsivewidget.dart';
import 'package:ecommerce/view/widget/auth/custombuttonauth.dart';
import 'package:ecommerce/view/widget/auth/customtextbodyauth.dart';
import 'package:ecommerce/view/widget/auth/customtitleauth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../controller/forgetpassword_controller/resetpassword_controller.dart';
import '../../../../core/constant/color.dart';
import '../../../../core/functions/validinput.dart';
import '../../../widget/auth/custompasswordauth.dart';

class ResetPassword extends StatelessWidget {
  const ResetPassword({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Get.put(ResetPasswordControllerImp());
    return Scaffold(
        backgroundColor: AppColor.backgroundColor,
        appBar: AppBar(
          title: Text(
            "31".tr,
          ),
          titleTextStyle: Theme.of(context)
              .textTheme
              .headline1!
              .copyWith(color: AppColor.grey),
          backgroundColor: AppColor.backgroundColor,
          elevation: 0,
          centerTitle: true,
        ),
        body: GetBuilder<ResetPasswordControllerImp>(
          builder: (controllerImp) => HandlingDataRequest(
            statuesRequest: controllerImp.statuesRequest,
            widget: ResponsiveWidget(
                builder:(context,deviceModel){
                  return Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 30),
                    child: ListView(
                      children: [
                        SizedBox(
                          height: deviceModel.localHeight/30,
                        ),
                        const CustomTitleAuth(title: "32"),
                        SizedBox(
                          height: deviceModel.localHeight/70,
                        ),
                        const CustomTextBodyAuth(textBody: "33"),
                        SizedBox(
                          height: deviceModel.localHeight/30,
                        ),
                        CustomPasswordAuth(
                          myHint: "34",
                          myLabel: "32",
                          myController: controllerImp.password,
                          validInput: (String? value) {
                            return validInput(value!, 6, 25, "password");
                          },
                        ),
                        SizedBox(
                          height: deviceModel.localHeight/30,
                        ),
                        CustomPasswordAuth(
                          myHint: "35",
                          myLabel: "32",
                          myController: controllerImp.rePassword,
                          validInput: (String? value) {
                            return validInput(value!, 6, 25, "password");
                          },
                        ),
                        SizedBox(
                          height: deviceModel.localHeight/30,
                        ),
                        CustomButtonAuth(
                          height: deviceModel.localHeight/17,
                          text: "36",
                          onPressed: () {
                            controllerImp.goToSuccessResetPassword();
                          },
                        ),
                      ],
                    ),
                  );
                } ),
          ),
        ));
  }
}
