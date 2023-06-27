

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:wellness/dto/phase_item_dto.dart';

class PhaseRepository {
  Stream<List<PhaseItemDto>> getPhases() =>
      FirebaseFirestore.instance
          .collection("phase")
          .snapshots()
          .map((snapshot) =>
          snapshot.docs.map((doc) => PhaseItemDto.fromJson(doc.data()))
              .toList());
}