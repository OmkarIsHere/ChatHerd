import 'package:chat_herd/shared/constants.dart';
import 'package:flutter/material.dart';

class GroupCard extends StatefulWidget {
  final String groupName, groupIcon;
   const GroupCard({required this.groupName, required this.groupIcon, super.key});

  @override
  State<GroupCard> createState() => _GroupCardState();
}

class _GroupCardState extends State<GroupCard> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 5),
      child: Column(
        children: <Widget>[
          SizedBox(
            child: Row(
              children: <Widget>[
                SizedBox(
                  height: 48,
                  width: 48,
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(10),
                    child: Image.asset(
                      'assets/images/no-image.png',
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                const SizedBox(width: 12),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: <Widget>[
                    Text(
                      widget.groupName,
                      textAlign: TextAlign.start,
                      style: TextStyle(
                        fontSize: 14,
                        height: 1.3,
                        // backgroundColor: Colors.yellow,
                        fontFamily: 'Mulish-Reg',
                        color: Constants.blackColor,
                      ),
                    ),
                    const SizedBox(height: 4),
                    Text(
                      'Last seen yesterday',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 12,
                        height: 1.1,
                        // backgroundColor: Colors.red,
                        fontFamily: 'Mulish-Reg',
                        color: Constants.greyColor,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
          const SizedBox(height: 10),
          Divider(
            height: 2,
            thickness: 1,
            color: Constants.offWhiteColor,
          )
        ],
      ),
    );

  }
}
