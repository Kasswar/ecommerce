import 'package:flutter/material.dart';

import '../../../core/constant/color.dart';

class CustomItemNameRating extends StatelessWidget {
  final String itemName;
  const CustomItemNameRating({required this.itemName,super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Text(
          itemName,
          style: Theme.of(context)
              .textTheme
              .headline1!
              .copyWith(height: 0.9),
        ),
        Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            ...List.generate(
              5,
                  (index) =>const Icon(
                Icons.star_border_purple500_outlined,
                color: AppColor.ratingColor,
                size: 24,
              ),
            ),
          ],
        ),
      ],
    );
  }
}
