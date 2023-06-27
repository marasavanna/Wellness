class FoodItemDTO {
  String name;
  int categoryIndex;
  String phaseId;
  FoodItemDTO({required this.name, required this.categoryIndex, required this.phaseId});

  static FoodItemDTO fromJson(Map<String, dynamic> json) => FoodItemDTO(
        name: json['name'],
        categoryIndex: json['category_index'],
        phaseId: json['phaseId']
      );
}
