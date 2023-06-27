import 'package:flutter/material.dart';

import '../../model/FoodItem.dart';

class FoodItemWidget extends StatelessWidget {
  const FoodItemWidget({super.key, required this.item});

  final FoodItem item;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
          height: 84,
          decoration: const BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.all(Radius.circular(8.0))),
          child: Row(mainAxisAlignment: MainAxisAlignment.start, crossAxisAlignment: CrossAxisAlignment.center, children: [
            const Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Padding(
                  padding: EdgeInsets.all(4.0),
                  child: Image(
                    image: NetworkImage(
                        'https://cdn.shopify.com/s/files/1/0371/3368/0772/products/Spinach_2048x.jpg'),
                    width: 76,
                    height: 76,
                  ),
                )
              ],
            ),
            Center(child: Column(crossAxisAlignment: CrossAxisAlignment.end,mainAxisAlignment: MainAxisAlignment.center, children: [Text(item.name)]))
          ])),
    );
  }
}
