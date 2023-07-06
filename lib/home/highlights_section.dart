import 'package:flutter/material.dart';
import 'package:wellness/dto/highlight_item_dto.dart';
import 'package:wellness/home/item_highlight.dart';
import 'package:wellness/mapper/highlight_mapper.dart';
import 'package:wellness/model/HighlightItem.dart';
import 'package:wellness/repository/highlight_repository.dart';
import 'package:wellness/utils/list_utils.dart';

class HighlightsSection extends StatelessWidget {
  HighlightsSection({super.key, required this.phaseId});

  final String phaseId;
  final highlightRepository = HighlightRepository();
  final highlightMapper = HighlightMapper();
  final listUtils = ListUtils<HighlightItemDto>();

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
            child: Padding(
                padding: const EdgeInsets.only(left: 16, right: 16, bottom: 24),
                child: listUtils.createGridList<HighlightItem>(
                    highlightRepository.getHighlightItems(),
                    highlightMapper.mapTodoItemsToUIItems,
                    (items, index) => ItemHighlight(
                          highlightItem: items[index],
                          phaseId: phaseId,
                        ), 2))),
      ],
    );
  }
}
