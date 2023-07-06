import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:wellness/dto/food_category_dto.dart';
import 'package:wellness/dto/food_item_dto.dart';

class FoodRepository {
  Stream<List<FoodItemDTO>> getFoodsRecommendedForPhase(
          String phaseId, int categoryIndex) =>
      FirebaseFirestore.instance.collection("food").snapshots().map(
          (snapshot) => snapshot.docs
              .map((doc) => FoodItemDTO.fromJson(doc.data()))
              .where((element) => element.phaseId == phaseId)
              .where((element) => element.categoryIndex == categoryIndex)
              .toList());

  Stream<List<FoodCategoryDTO>> getFoodCategories() {
    var docs = FirebaseFirestore.instance
        .collection("food_category")
        .snapshots()
        .map((snapshot) => snapshot.docs
            .map((doc) => FoodCategoryDTO.fromJson(doc.data()))
            .toList());
    return docs;
  }
}
