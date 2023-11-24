import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../controller/homecontroller/itemdetails_controller.dart';
import '../../../core/constant/color.dart';
import '../../../core/constant/imageasset.dart';

class CustomItemImage extends GetView<ItemDetailsControllerImp> {
  final String imageUrl;
  final int iconType;
  final int itemsDiscount;
  final void Function()? goToItems;
  final void Function()? favoriteFun;

  const CustomItemImage(
      {required this.goToItems,
      required this.iconType,
      required this.favoriteFun,
      required this.imageUrl,
      required this.itemsDiscount,
      super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Stack(
        alignment: Alignment.center,
        children: [
          ClipPath(
            clipper: CustomClipPath(),
            child: Container(
              height: 350,
              width: double.infinity,
              decoration: const BoxDecoration(
                gradient: LinearGradient(
                    colors: [AppColor.primaryColor, AppColor.black]),
              ),
            ),
          ),
          Positioned(
            left: 10,
            top: 5,
            child: IconButton(
              onPressed: goToItems,
              icon: const Icon(
                Icons.arrow_back,
                color: AppColor.white,
                size: 35,
              ),
            ),
          ),
          Positioned(
            right: 10,
            top: 5,
            child: IconButton(
              onPressed: favoriteFun,
              icon: Icon(
                iconType == 1
                    ? Icons.favorite
                    : Icons.favorite_outline_outlined,
                color: AppColor.white,
                size: 35,
              ),
            ),
          ),
          Container(
            alignment: Alignment.center,
            height: 260,
            width: 260,
            decoration: BoxDecoration(
              color: AppColor.backgroundColor.withOpacity(0.8),
              borderRadius: BorderRadius.circular(140),
            ),
          ),
          Hero(
            tag: controller.itemsModel!.itemsId!,
            child: CachedNetworkImage(
                height: 200,
                width: 200,
                fit: BoxFit.contain,
                imageUrl: imageUrl),
          ),
        ],
      ),
    );
  }
}

class CustomClipPath extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    Path path_0 = Path();
    path_0.moveTo(size.width, size.height);
    path_0.lineTo(size.width, size.height * 0);
    path_0.lineTo(0, 0);
    path_0.lineTo(0, size.height * 0.6060000);
    path_0.quadraticBezierTo(size.width * 0.3080000, size.height,
        size.width * 0.5450000, size.height * 0.6660000);
    path_0.quadraticBezierTo(size.width * 0.7040000, size.height * 0.3925000,
        size.width, size.height * 0.6180000);
    path_0.close();

    return path_0;
  }

  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) {
    return true;
  }
}
