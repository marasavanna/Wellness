import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:wellness/home/calendar_section.dart';
import 'package:wellness/home/highlights_section.dart';
import 'package:wellness/home/profile_section.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          const ProfileSection(),
          const CalendarSection(),
          HighlightsSection()
        ],
      ),
    );
  }
}
