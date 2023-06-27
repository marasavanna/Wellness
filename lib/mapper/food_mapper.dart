import 'package:wellness/dto/food_item_dto.dart';

import '../model/FoodItem.dart';

class FoodMapper {
  mapDTOToFoodItem(FoodItemDTO dto) {
    return FoodItem(
      name: dto.name,
    );
  }

  mapTodoItemsToUIItems(List<FoodItemDTO> itemsDTO) =>
      itemsDTO.map((e) => mapDTOToFoodItem(e)).toList();
}
