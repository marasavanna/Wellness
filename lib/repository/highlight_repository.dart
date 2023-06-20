
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:wellness/dto/highlight_item_dto.dart';


class HighlightRepository {
  Stream<List<HighlightItemDto>> getHighlightItems() =>
      FirebaseFirestore.instance
          .collection("highlight")
          .snapshots()
          .map((snapshot) =>
          snapshot.docs.map((doc) => HighlightItemDto.fromJson(doc.data()))
              .toList());
}