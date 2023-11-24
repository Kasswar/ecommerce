import 'package:flutter/material.dart';
class CustomItemDesc extends StatelessWidget {
  final String itemDesc;
  const CustomItemDesc({required this.itemDesc,super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 150,
      child: Text(
        itemDesc,
        maxLines: 4,
        style: Theme.of(context).textTheme.bodyText2,
      ),
    );
  }
}
