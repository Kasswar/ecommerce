import 'package:ecommerce/controller/auth_controller/signup_controller.dart';
import 'package:ecommerce/core/class/handlingdataview.dart';
import 'package:ecommerce/core/class/statuesrequest.dart';
import 'package:ecommerce/core/localization/changelocal.dart';
import 'package:ecommerce/core/responsive/responsivewidget.dart';
import 'package:ecommerce/view/widget/auth/custombuttonauth.dart';
import 'package:ecommerce/view/widget/auth/customtextbodyauth.dart';
import 'package:ecommerce/view/widget/auth/customtextloginorsignup.dart';
import 'package:ecommerce/view/widget/auth/customtitleauth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../core/constant/color.dart';
import '../../../core/functions/validinput.dart';
import '../../widget/auth/custompasswordauth.dart';
import '../../widget/auth/customtextformauth.dart';

class SignUp extends GetView<LocaleController> {
  const SignUp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.backgroundColor,
      appBar: AppBar(
        title: Text(
          "11".tr,
        ),
        titleTextStyle: Theme.of(context)
            .textTheme
            .headline1!
            .copyWith(color: AppColor.grey),
        backgroundColor: AppColor.backgroundColor,
        elevation: 0,
        centerTitle: true,
      ),
      body: GetBuilder<SignUpControllerImp>(
        builder: (controllerImp)=>HandlingDataRequest(statuesRequest:controllerImp.statuesRequest, widget:ResponsiveWidget(
          builder: (context,deviceModel){
            return Form(
              key: controllerImp.key,
              child:controllerImp.statuesRequest==StatuesRequest.loading?const Center(child: Text("Loadind...")) :Padding(
                padding: const EdgeInsets.symmetric(horizontal: 30),
                child: ListView(
                  children: [
                    const CustomTitleAuth(title: "3"),
                    SizedBox(
                      height: deviceModel.localHeight/80,
                    ),
                    const CustomTextBodyAuth(textBody: "24"),
                    SizedBox(
                      height: deviceModel.localHeight/12,
                    ),
                    CustomTextFormAuth(
                      myHint: "19",
                      myLabel: "20",
                      myIcon: Icons.person_outline,
                      keyboard: TextInputType.name,
                      myController: controllerImp.username,
                      validInput: (String? value) {
                        return validInput(value!,2,30,"userName");
                      },
                    ),
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
                        return validInput(value!,15,50,"email");
                      },
                    ),
                    SizedBox(
                      height: deviceModel.localHeight/30,
                    ),
                    CustomTextFormAuth(
                      myHint: "21",
                      myLabel: "22",
                      myIcon: Icons.phone_android,
                      keyboard: TextInputType.phone,
                      myController: controllerImp.phoneNumber,
                      validInput: (String? value) {
                        return validInput(value!,10,12,"phoneNumber");
                      },
                    ),
                    SizedBox(
                      height: deviceModel.localHeight/30,
                    ),
                    CustomPasswordAuth(
                      myHint: "7",
                      myLabel: "8",
                      myController: controllerImp.password,validInput: (String? value) {
                      return validInput(value!,6,25,"password");
                    },),
                    SizedBox(
                      height: deviceModel.localHeight/16,
                    ),
                    CustomButtonAuth(
                      height: deviceModel.localHeight/17,
                      text: "11",
                      onPressed: () {
                        controllerImp.signUp();
                      },
                    ),
                    SizedBox(
                      height: deviceModel.localHeight/14,
                    ),
                    CustomTextLoginOrSignUp(
                        textOne: "10",
                        textTwo: "2",
                        onTap: () {
                          controllerImp.goToSignInPage();
                        }),
                  ],
                ),
              ),
            );
          },
        )),
      ),
    );
  }
}
