import 'package:flutter/material.dart';
import 'package:wellness/enum/enum_food_category.dart';

class FoodCategoryPage extends StatelessWidget {
  const FoodCategoryPage({super.key, required this.currentPhaseId});

  final String currentPhaseId;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Padding(
            padding: const EdgeInsets.only(left: 16, right: 16, bottom: 24),
            child: Expanded(
              child: GridView.builder(
                shrinkWrap: true,
                itemCount: FoodCategoryEnum.values.length,
                physics: const NeverScrollableScrollPhysics(),
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    mainAxisSpacing: 16,
                    crossAxisSpacing: 16,
                    crossAxisCount: 2),
                itemBuilder: (context, index) =>
                    Text(FoodCategoryEnum.values[index].name),
              ),
            )));
  }
}
