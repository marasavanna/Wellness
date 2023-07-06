import 'package:flutter/material.dart';

import '../../model/FoodItem.dart';

class FoodItemWidget extends StatelessWidget {
  const FoodItemWidget({super.key, required this.item});

  final FoodItem item;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 7.0),
      child: Container(
          height: 24,
          decoration: const BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.all(Radius.circular(10.0))),
          child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Center(
                    child: Column(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 8),
                          child: Text(item.name, style: const TextStyle(color: Colors.black, fontWeight: FontWeight.w400, fontSize: 13),),
                        )]))
              ])),
    );
  }
}
