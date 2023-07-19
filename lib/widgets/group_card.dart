import 'package:chat_herd/pages/chat_page.dart';
import 'package:chat_herd/shared/constants.dart';
import 'package:chat_herd/widgets/widgets.dart';
import 'package:flutter/material.dart';

class GroupCard extends StatefulWidget {
  final String groupName, groupIcon;
  const GroupCard(
      {required this.groupName, required this.groupIcon, super.key});

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
          InkWell(
            onTap: ()=>nextPage(context, ChatPage(groupName:widget.groupName,)),
            child: Row(
              children: <Widget>[
                   CircleAvatar(
                    radius: 24,
                    backgroundColor: Constants.dividerColor,
                    child: Image.asset(
                      'assets/images/user-group.png',
                      fit: BoxFit.contain,
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
                        maxLines: 1,
                        style: TextStyle(
                          fontSize: 14,
                          height: 1.3,
                          overflow: TextOverflow.ellipsis,
                          fontFamily: 'Mulish-Reg',
                          color: Constants.blackColor,
                        ),
                      ),
                      const SizedBox(height: 4),
                      Text(
                          'Last seen yesterday',
                          textAlign: TextAlign.start,
                          maxLines: 1,
                          style: TextStyle(
                            fontSize: 12,
                            height: 1.1,
                            overflow: TextOverflow.ellipsis,
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

