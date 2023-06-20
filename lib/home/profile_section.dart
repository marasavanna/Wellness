import 'package:flutter/material.dart';
import 'package:wellness/colors.dart';
import 'package:wellness/extensions.dart';

class ProfileSection extends StatelessWidget {
  const ProfileSection({super.key});

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
        child: const Padding(
            padding: EdgeInsets.only(left: 32),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                CircleAvatar(
                    radius: 52,
                    backgroundColor: Colors.white,
                    child: CircleAvatar(
                        radius: 48,
                        backgroundImage: NetworkImage(
                            'https://i.pinimg.com/564x/8e/00/71/8e0071559e6f78380b64d7b6a95195c2.jpg'))),
                Expanded(
                  child: Padding(
                      padding: EdgeInsets.symmetric(horizontal: 16),
                      child: Text(
                        'Good evening, Mara!\nYou are currently in the follicular phase',
                        style: TextStyle(
                            fontSize: 18,
                            color: Colors.black,
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
