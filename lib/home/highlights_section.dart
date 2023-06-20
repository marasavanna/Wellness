import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:wellness/dto/highlight_item_dto.dart';
import 'package:wellness/home/item_highlight.dart';
import 'package:wellness/mapper/highlight_mapper.dart';
import 'package:wellness/repository/highlight_repository.dart';


class HighlightsSection extends StatelessWidget {
  HighlightsSection({super.key});

  final highlightRepository = HighlightRepository();
  final highlightMapper = HighlightMapper();

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
            child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: StreamBuilder<List<HighlightItemDto>>(
                    stream: highlightRepository.getHighlightItems(),
                    builder: (context, snapshot) {
                      if (snapshot.hasError) {
                        return Text('Something went wrong ${snapshot.error}!');
                      } else if (snapshot.hasData) {
                        final highlightItemsDTO = snapshot.data!;
                        final highlightItems = highlightMapper
                            .mapTodoItemsToUIItems(highlightItemsDTO.toList());
                        return GridView.builder(
                            shrinkWrap: true,
                            itemCount: highlightItems.length,
                            physics: const NeverScrollableScrollPhysics(),
                            gridDelegate:
                                const SliverGridDelegateWithFixedCrossAxisCount(
                                    mainAxisSpacing: 16,
                                    crossAxisSpacing: 16,
                                    crossAxisCount: 2),
                            itemBuilder: (context, index) => ItemHighlight(
                                highlightItem: highlightItems[index]));
                      } else {
                        return const Center(child: CircularProgressIndicator());
                      }
                    }))),
      ],
    );
  }
}
