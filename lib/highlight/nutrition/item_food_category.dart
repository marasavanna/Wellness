import 'package:flutter/material.dart';
import 'package:wellness/dto/food_item_dto.dart';
import 'package:wellness/highlight/nutrition/item_food.dart';
import 'package:wellness/mapper/food_mapper.dart';
import 'package:wellness/model/FoodCategory.dart';
import 'package:wellness/repository/food_repository.dart';
import 'package:wellness/utils/colors.dart';
import 'package:wellness/utils/extensions.dart';
import 'package:wellness/utils/list_utils.dart';

class FoodCategoryItem extends StatelessWidget {
  FoodCategoryItem(
      {super.key, required this.foodCategory, required this.phaseId});

  final FoodCategory foodCategory;
  final FoodRepository foodRepository = FoodRepository();
  final FoodMapper foodMapper = FoodMapper();
  final ListUtils<FoodItemDTO> listUtils = ListUtils<FoodItemDTO>();
  final String phaseId;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 12.0, left: 8.0, right: 8.0),
      child: Container(
          decoration: BoxDecoration(
              color: accentColor.toColor(),
              borderRadius: const BorderRadius.all(
                  Radius.circular(8))),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Row(children: [
                SizedBox(height: 12,)
              ]),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(foodCategory.name.capitalize(), style: const TextStyle(fontSize: 18, fontWeight: FontWeight.w500),),
                  ),
                ],
              ),
              const Row(children: [
                SizedBox(height: 12,)
              ]),
              Row(
                children: [
                  Expanded(
                    child: SizedBox(
                      height: 32,
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 8.0),
                        child: listUtils.createSimpleList(
                            foodRepository.getFoodsRecommendedForPhase(phaseId, foodCategory.index),
                            (dtoItems) =>
                                foodMapper.mapFoodItemsToUIItems(dtoItems),
                            (items, index) => FoodItemWidget(
                                  item: items[index],
                                ),
                            Axis.horizontal, true),
                      ),
                    ),
                  )
                ],
              ),
              const Row(children: [
                SizedBox(height: 12,)
              ]),
            ],
          )),
    );
  }
}
