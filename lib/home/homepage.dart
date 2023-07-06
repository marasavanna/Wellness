import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:wellness/home/calendar_section.dart';
import 'package:wellness/home/highlights_section.dart';
import 'package:wellness/home/profile_section.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key, required this.currentPhaseId});

  final String currentPhaseId;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          ProfileSection(
            currentPhase: currentPhaseId
          ),
          const CalendarSection(),
          HighlightsSection(phaseId: currentPhaseId)
        ],
      ),
    );
  }
}
