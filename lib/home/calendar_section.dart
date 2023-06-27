import 'package:flutter/material.dart';
import 'package:wellness/utils/date_utils.dart';

class CalendarSection extends StatelessWidget {
  const CalendarSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Column(
            children: [
              IconButton(
                  onPressed: () => {},
                  icon: const Icon(Icons.arrow_back_ios,
                      color: Colors.black, size: 18))
            ],
          ),
          Column(
            children: [
              Row(
                children: [
                  IconButton(
                    icon: const Icon(Icons.calendar_month_outlined,
                        color: Colors.black, size: 22),
                    onPressed: () => {},
                  ),
                  Text('Today, ' + formattedDay().toUpperCase(),
                      style: const TextStyle(fontWeight: FontWeight.w600))
                ],
              )
            ],
          ),
          Column(children: [
            IconButton(
                onPressed: () => {},
                icon: const Icon(Icons.arrow_forward_ios,
                    color: Colors.black, size: 18))
          ])
        ],
      ),
    );
  }
}
