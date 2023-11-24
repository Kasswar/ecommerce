import 'package:flutter/material.dart';

import '../../../core/constant/color.dart';

class CustomAvatarImage extends StatelessWidget {
  const CustomAvatarImage({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Stack(
          alignment: Alignment.center,
          children: [
            ClipPath(
              clipper: CustomClipPath(),
              child: Container(
                height: 200,
                width: double.infinity,
                decoration:const BoxDecoration(
                  gradient:LinearGradient(
                      colors: [AppColor.primaryColor,AppColor.black]
                  ),
                ),
              ),
            ),
            Positioned(
              top:50,
              child: Container(
                alignment: Alignment.center,
                height: 150,
                width: 150,
                decoration: BoxDecoration(
                  color: AppColor.backgroundColor,
                  borderRadius: BorderRadius.circular(100),
                  border: Border.all(
                    color: AppColor.primaryColor,
                    width: 3,
                  ),
                ),
                child:const Icon(Icons.person,size: 70,color: AppColor.white,),
              ),
            ),
          ],
        ),
        Text("Kasswar Mazlom",style: Theme.of(context).textTheme.headline1,),
      ],
    );
  }
}



class CustomClipPath extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    Path path_0 = Path();
    path_0.moveTo(size.width,0);
    path_0.lineTo(size.width*0,size.height*0);
    path_0.quadraticBezierTo(size.width*0.1995000,size.height*0.7920000,size.width*0.5000000,size.height*0.7960000);
    path_0.quadraticBezierTo(size.width*0.8000000,size.height*0.7920000,size.width*1.0020000,0);
    path_0.close();

    return path_0;
  }

  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) {
    return true;
  }
}