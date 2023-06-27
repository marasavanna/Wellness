import 'package:wellness/enum/enum_food_category.dart';

class FoodCategoryDTO {
  int index;

  FoodCategoryDTO({required this.index});

  static FoodCategoryDTO fromJson(Map<String, dynamic> json) => FoodCategoryDTO(
        index: json['index'],
      );

  FoodCategoryEnum getFoodCategory() {
    return FoodCategoryEnum.values.elementAt(index);
  }
}
