import 'package:flutter/material.dart';

import '../../../core/constant/color.dart';
class CustomItemPriceCount extends StatelessWidget {
  final double itemPrice;
  final double itemPriceDiscount;
  final int itemDiscount;
  final int itemCount;
  final void Function()? increaseFun;
  final void Function()? decreaseFun;
  const CustomItemPriceCount({super.key, required this.itemPrice, required this.itemCount,required this.increaseFun,required this.decreaseFun, required this.itemPriceDiscount, required this.itemDiscount});
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Column(
          children: [
            itemDiscount>0?RichText(text: TextSpan(
                children: [
                  TextSpan(
                    text:"$itemPrice\$",
                    style: const TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.bold,
                      fontFamily: "sans",
                      height: 0,
                      decoration: TextDecoration.lineThrough,
                      color: AppColor.priceDiscountColor,
                    ),
                  ),
                ]
            ),textAlign: TextAlign.start,):const SizedBox(height: 0,),
            Text("${itemPriceDiscount.toStringAsFixed(2)}\$",
              style:const TextStyle(
                color: AppColor.priceColor,
                fontSize: 18,
                fontWeight: FontWeight.bold,
                fontFamily: "sans",
                height: 0,
              ),
            ),
          ],
        ),
        Container(
          height: 40,
          alignment: Alignment.center,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(15),
            border: Border.all(color: AppColor.grey),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              IconButton(onPressed:decreaseFun, icon:const Icon(Icons.remove)),
              Text("$itemCount",style:const TextStyle(fontWeight: FontWeight.bold,fontSize: 15,height: 0,fontFamily: "sans"),),
              IconButton(onPressed:increaseFun, icon:const Icon(Icons.add)),
            ],
          ),
        ),
      ],
    );
  }
}
