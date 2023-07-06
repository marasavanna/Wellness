
import 'package:wellness/dto/highlight_item_dto.dart';
import 'package:wellness/model/HighlightItem.dart';

class HighlightMapper {

  HighlightItem mapDTOToHighlightItem(HighlightItemDto dto) {
    return HighlightItem(
        name: dto.name,
        icon: 'assets/images/' + dto.iconPath +".svg",
        category: '');
  }

  List<HighlightItem> mapTodoItemsToUIItems(List<HighlightItemDto> itemsDTO) =>
      itemsDTO.map((e) => mapDTOToHighlightItem(e)).toList();
}