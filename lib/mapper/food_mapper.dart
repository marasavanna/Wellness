import 'package:wellness/dto/food_category_dto.dart';
import 'package:wellness/dto/food_item_dto.dart';

import '../model/FoodCategory.dart';
import '../model/FoodItem.dart';

class FoodMapper {
  FoodItem mapDTOToFoodItem(FoodItemDTO dto) {
    return FoodItem(
      name: dto.name,
    );
  }

  List<FoodItem> mapFoodItemsToUIItems(List<FoodItemDTO> itemsDTO) =>
      itemsDTO.map((e) => mapDTOToFoodItem(e)).toList();

  FoodCategory mapDTOToFoodCategory(FoodCategoryDTO dto) {
    return FoodCategory(name: dto.name, index: dto.index);
  }

  List<FoodCategory> mapFoodCategoryItemsToUIItems(
      List<FoodCategoryDTO> itemsDTO) {
    itemsDTO.sort((a, b) => a.index.compareTo(b.index));
    return itemsDTO.map((e) => mapDTOToFoodCategory(e)).toList();
  }
}
