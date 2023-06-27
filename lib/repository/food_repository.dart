import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:wellness/dto/food_item_dto.dart';

class FoodRepository {
  Stream<List<FoodItemDTO>> getFoodsRecommendedForPhase(String phaseId) =>
      FirebaseFirestore.instance.collection("food").snapshots().map(
          (snapshot) => snapshot.docs
              .map((doc) => FoodItemDTO.fromJson(doc.data()))
              .where((element) => element.phaseId == phaseId)
              .toList());
}
