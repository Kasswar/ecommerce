import 'package:ecommerce/controller/forgetpassword_controller/forgetpassword_controller.dart';
import 'package:ecommerce/core/class/handlingdataview.dart';
import 'package:ecommerce/core/responsive/responsivewidget.dart';
import 'package:ecommerce/view/widget/auth/custombuttonauth.dart';
import 'package:ecommerce/view/widget/auth/customtextbodyauth.dart';
import 'package:ecommerce/view/widget/auth/customtitleauth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../core/constant/color.dart';
import '../../../../core/functions/validinput.dart';
import '../../../widget/auth/customtextformauth.dart';

class ForgetPassword extends StatelessWidget {
  const ForgetPassword({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.backgroundColor,
      appBar: AppBar(
        title: Text(
          "9".tr,
        ),
        titleTextStyle: Theme.of(context)
            .textTheme
            .headline1!
            .copyWith(color: AppColor.grey),
        backgroundColor: AppColor.backgroundColor,
        elevation: 0,
        centerTitle: true,
      ),
      body: GetBuilder<ForgetPasswordControllerImp>(
        builder: (controllerImp) {
          return Form(
            key: controllerImp.key,
            child:HandlingDataRequest(statuesRequest: controllerImp.statuesRequest,widget:ResponsiveWidget(
              builder: (context,deviceModel){
                return Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 30),
                  child: ListView(
                    children: [
                      SizedBox(
                        height: deviceModel.localHeight/30,
                      ),
                      const CustomTitleAuth(title: "25"),
                      SizedBox(
                        height: deviceModel.localHeight/70,
                      ),
                      const CustomTextBodyAuth(textBody: "27"),
                      SizedBox(
                        height: deviceModel.localHeight/30,
                      ),
                      CustomTextFormAuth(
                        myHint: "5",
                        myLabel: "6",
                        myIcon: Icons.email_outlined,
                        keyboard: TextInputType.emailAddress,
                        myController: controllerImp.email,
                        validInput: (String? value) {
                          return validInput(value!, 15, 50, "email");
                        },
                      ),
                      SizedBox(
                        height: deviceModel.localHeight/30,
                      ),
                      CustomButtonAuth(
                        height: deviceModel.localHeight/17,
                        text: "26",
                        onPressed: () {
                          controllerImp.goToVerifyCodePage();
                        },
                      ),
                    ],
                  ),
                );
              },
            ),),
          );
        },
      ),
    );
  }
}
