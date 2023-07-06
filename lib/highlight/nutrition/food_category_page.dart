import 'package:flutter/material.dart';
import 'package:wellness/dto/food_category_dto.dart';
import 'package:wellness/highlight/nutrition/item_food_category.dart';
import 'package:wellness/mapper/food_mapper.dart';
import 'package:wellness/repository/food_repository.dart';
import 'package:wellness/utils/colors.dart';
import 'package:wellness/utils/extensions.dart';

import '../../utils/list_utils.dart';

class FoodCategoryPage extends StatelessWidget {
  FoodCategoryPage({super.key, required this.currentPhaseId});

  final String currentPhaseId;
  final listUtils = ListUtils<FoodCategoryDTO>();
  final FoodRepository repository = FoodRepository();
  final FoodMapper mapper = FoodMapper();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: backgroundColor.toColor(),
        body: Padding(
            padding: const EdgeInsets.only(left: 16, right: 16, top: 24),
            child: SingleChildScrollView(
              child: Column(
                children: [
                  Row(
                    children: [Text("very important description about the phase")],
                  ),
                  Row(
                    children: [
                      Expanded(
                          child: listUtils.createSimpleList(
                              repository.getFoodCategories(),
                              (dtoItems) =>
                                  mapper.mapFoodCategoryItemsToUIItems(dtoItems),
                              (items, index) => FoodCategoryItem(
                                  foodCategory: items[index], phaseId: currentPhaseId),
                              Axis.vertical, false)),
                    ],
                  ),
                ],
              ),
            )));
  }
}
