import 'package:wellness/dto/food_category_dto.dart';
import 'package:wellness/dto/food_item_dto.dart';
import 'package:wellness/dto/phase_item_dto.dart';
import 'package:wellness/model/Phase.dart';

import '../model/FoodCategory.dart';
import '../model/FoodItem.dart';

class PhaseMapper {
  Phase mapDTOToPhaseItem(PhaseItemDto dto) {
    return Phase(
      description: dto.description,
      backgroundColor: dto.backgroundColor,
      accentColor: dto.accentColor,
      name: dto.name
    );
  }
}
