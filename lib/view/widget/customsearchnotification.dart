import 'package:ecommerce/core/constant/color.dart';
import 'package:flutter/material.dart';

class CustomSearchNotification extends StatelessWidget {
  final String hintText;
  final void Function(String)? searchFun;
  final void Function()? notificationFun;
  const CustomSearchNotification({super.key, required this.hintText,required this.searchFun,required this.notificationFun});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        SizedBox(
            width: 300,
            //color: Colors.tealAccent,
            child: TextFormField(
              onChanged: searchFun,
              decoration: InputDecoration(
                  filled: true,
                  hintText: hintText,
                  hintStyle:const TextStyle(height: 0),
                  prefixIcon: const Icon(Icons.search,color: AppColor.primaryColor,),
                  contentPadding: EdgeInsets.zero,
                  border: OutlineInputBorder(
                      borderSide: BorderSide.none,
                      borderRadius: BorderRadius.circular(25),
                  )),
            )),
        Container(
          width: 60,
          decoration: BoxDecoration(
            color: Colors.grey[200],
            borderRadius: BorderRadius.circular(25),
          ),
          child: IconButton(
            icon: const Icon(
              Icons.notifications_active,
              color: AppColor.primaryColor,
              size: 25,
            ),
            onPressed: notificationFun,
          ),
        ),
      ],
    );
  }
}
