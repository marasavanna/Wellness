import 'package:flutter/material.dart';
import 'package:wellness/dto/food_item_dto.dart';
import 'package:wellness/highlight/nutrition/item_food.dart';
import 'package:wellness/mapper/food_mapper.dart';
import 'package:wellness/repository/food_repository.dart';
import 'package:wellness/utils/extensions.dart';

import '../utils/colors.dart';

class HighlightPage extends StatelessWidget {
  HighlightPage({super.key, required this.currentPhaseId});

  final String currentPhaseId;
  final FoodRepository foodRepository = FoodRepository();
  final FoodMapper foodMapper = FoodMapper();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: backgroundColor.toColor(),
        body: Row(
          children: [
            Expanded(
                child: Padding(
                    padding:
                        const EdgeInsets.only(left: 16, right: 16, top: 24),
                    child: StreamBuilder<List<FoodItemDTO>>(
                        stream: foodRepository.getFoodsRecommendedForPhase(
                            currentPhaseId, 0),
                        builder: (context, snapshot) {
                          if (snapshot.hasError) {
                            return Text(
                                'Something went wrong ${snapshot.error}!');
                          } else if (snapshot.hasData) {
                            final foodItemsDTO = snapshot.data!;
                            final foodItems =
                                foodMapper.mapFoodItemsToUIItems(foodItemsDTO);
                            return ListView.builder(
                                shrinkWrap: true,
                                itemCount: foodItems.length,
                                itemBuilder: (context, index) =>
                                    FoodItemWidget(item: foodItems[index]));
                          } else {
                            return const Center(
                                child: CircularProgressIndicator());
                          }
                        }))),
          ],
        ));
  }
}
