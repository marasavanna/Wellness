import 'package:wellness/enum/enum_food_category.dart';

class FoodCategoryDTO {
  int index;
  String name;

  FoodCategoryDTO({required this.index, required this.name});

  static FoodCategoryDTO fromJson(Map<String, dynamic> json) =>
      FoodCategoryDTO(index: json['index'], name: json['name']);

  FoodCategoryEnum getFoodCategory() {
    return FoodCategoryEnum.values.elementAt(index);
  }
}
