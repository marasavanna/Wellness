import 'package:flutter/material.dart';
import 'package:wellness/utils/colors.dart';
import 'package:wellness/utils/date_utils.dart';
import 'package:wellness/utils/extensions.dart';

class ProfileSection extends StatelessWidget {
  const ProfileSection({super.key, required this.currentPhase});

  final String currentPhase;

  @override
  Widget build(BuildContext context) {
    return FractionallySizedBox(
      widthFactor: 1.0,
      child: Container(
        height: 220,
        decoration: BoxDecoration(
            color: accentColor.toColor(),
            borderRadius: const BorderRadius.only(
                bottomLeft: Radius.circular(40.0),
                bottomRight: Radius.circular(40.0))),
        child: Padding(
            padding: const EdgeInsets.only(left: 32),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                const CircleAvatar(
                    radius: 52,
                    backgroundColor: Colors.white,
                    child: CircleAvatar(
                        radius: 48,
                        backgroundImage: NetworkImage(
                            'https://i.pinimg.com/564x/8e/00/71/8e0071559e6f78380b64d7b6a95195c2.jpg'))),
                Expanded(
                  child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 16),
                      child: Text(
                        'Good ${getCurrentTodName()}, Mara!\nYou are currently in the $currentPhase phase',
                        style: const TextStyle(
                            fontSize: 18,
                            color: Colors.white,
                            fontWeight: FontWeight.bold),
                        softWrap: true,
                        maxLines: 3,
                      )),
                )
              ],
            )),
      ),
    );
  }
}
