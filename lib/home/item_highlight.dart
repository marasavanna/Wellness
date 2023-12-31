import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:wellness/highlight/nutrition/food_category_page.dart';
import 'package:wellness/model/HighlightItem.dart';
import 'package:wellness/utils/colors.dart';
import 'package:wellness/utils/extensions.dart';

class ItemHighlight extends StatelessWidget {
  final HighlightItem highlightItem;
  final String phaseId;

  const ItemHighlight(
      {super.key, required this.highlightItem, required this.phaseId});

  @override
  Widget build(BuildContext context) {
    return Material(
      child: InkWell(
        onTap: () => {navigateToDetails(context)},
        child: Container(
          decoration: BoxDecoration(
              color: accentColor.toColor(),
              borderRadius: const BorderRadius.all(Radius.circular(8.0))),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SvgPicture.asset(
                    highlightItem.icon,
                    width: 30,
                    height: 30,
                    alignment: Alignment.topCenter,
                    color: Colors.white,
                    placeholderBuilder: (BuildContext context) =>
                        const Center(child: CircularProgressIndicator()),
                  ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      highlightItem.name,
                      textAlign: TextAlign.center,
                      style: const TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.w600,
                          fontSize: 20),
                    ),
                  )
                ],
              )
            ],
          ),
        ),
      ),
    );
  }

  void navigateToDetails(BuildContext context) {
    Navigator.push(
      context,
      MaterialPageRoute(
          builder: (context) => FoodCategoryPage(currentPhaseId: phaseId)),
    );
  }
}
