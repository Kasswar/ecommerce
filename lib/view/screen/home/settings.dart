import 'package:ecommerce/controller/setting_controller.dart';
import 'package:ecommerce/view/widget/settings/customavatarimage.dart';
import 'package:ecommerce/view/widget/settings/customlistsetting.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Settings extends StatelessWidget {
  const Settings({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<SettingControllerImp>(
      init: SettingControllerImp(),
        builder:(controller){
      return SafeArea(
        child:Scaffold(
          body: Container(
            child: Column(
              children: [
                CustomAvatarImage(),
                SizedBox(height: 60,),
                CustomListSetting(),
              ],
            ),
          ),
        ),
      );
    });
  }
}
