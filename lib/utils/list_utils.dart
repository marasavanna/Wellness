import 'package:flutter/material.dart';

typedef TypedItemBuilder<T> = Widget? Function(List<T> items, int index);
typedef DtoMapper<T, R> = List<R> Function(List<T> dtoItems);

class ListUtils<T> {
  StreamBuilder<List<T>> createGridList<M>(
      Stream<List<T>> stream,
      DtoMapper<T, M> mapper,
      TypedItemBuilder<M> itemBuilder,
      int numberOfColumns) {
    return StreamBuilder<List<T>>(
        stream: stream,
        builder: (context, snapshot) {
          if (snapshot.hasError) {
            return Text('Something went wrong ${snapshot.error}!');
          } else if (snapshot.hasData && snapshot.data != null) {
            final itemsDto = snapshot.data!;
            final mappedItems = mapper(itemsDto);
            return GridView.builder(
                shrinkWrap: true,
                itemCount: mappedItems.length,
                physics: const NeverScrollableScrollPhysics(),
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    mainAxisSpacing: 16,
                    crossAxisSpacing: 16,
                    crossAxisCount: numberOfColumns),
                itemBuilder: (context, index) =>
                    itemBuilder(mappedItems, index));
          } else {
            return const Center(child: CircularProgressIndicator());
          }
        });
  }

  StreamBuilder<List<T>> createSimpleList<M>(
      Stream<List<T>> stream,
      DtoMapper<T, M> mapper,
      TypedItemBuilder<M> itemBuilder,
      Axis scrollDirection,
      bool canScroll) {
    return StreamBuilder<List<T>>(
        stream: stream,
        builder: (context, snapshot) {
          if (snapshot.hasError) {
            return Text('Something went wrong ${snapshot.error}!');
          } else if (snapshot.hasData && snapshot.data != null) {
            final itemsDto = snapshot.data!;
            final mappedItems = mapper(itemsDto);
            return ListView.builder(
                shrinkWrap: true,
                physics: getScrollPhysics(canScroll),
                scrollDirection: scrollDirection,
                itemCount: mappedItems.length,
                itemBuilder: (context, index) =>
                    itemBuilder(mappedItems, index));
          } else {
            return const Center(child: CircularProgressIndicator());
          }
        });
  }

  ScrollPhysics getScrollPhysics(bool canScroll) {
    if (canScroll) {
      return const ScrollPhysics();
    } else {
      return const NeverScrollableScrollPhysics();
    }
  }
}
