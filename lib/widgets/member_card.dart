import 'package:flutter/material.dart';

import '../shared/constants.dart';

class MemberCard extends StatefulWidget {
  final String memberName;
  final String adminName;
  const MemberCard({super.key, required this.memberName, required this.adminName});

  @override
  State<MemberCard> createState() => _MemberCardState();
}

class _MemberCardState extends State<MemberCard> {

  @override
  Widget build(BuildContext context) {
    return ListTile(
      // tileColor: Colors.red.shade200,
      leading: CircleAvatar(
        radius: 24,
        backgroundColor: Constants.dividerColor,
        child: Image.asset(
          // width:32,
          // height:32,
          'assets/images/user.png',
          fit: BoxFit.cover,
        ),
      ),
      title: Text(
        getName(widget.memberName),
        textAlign: TextAlign.start,
        maxLines: 1,
        style: TextStyle(
          fontSize: 14,
          height: 1.4,
          overflow: TextOverflow.ellipsis,
          fontFamily: 'Mulish-Reg',
          color: Constants.blackColor,
        ),
      ),
      subtitle:  Text(
        'example@email.com',
        textAlign: TextAlign.start,
        maxLines: 1,
        style: TextStyle(
          fontSize: 12,
          height: 1.2,
          overflow: TextOverflow.ellipsis,
          fontFamily: 'Mulish-Reg',
          color: Constants.greyColor,
        ),
      ),
      trailing:(widget.adminName == widget.memberName)
          ?Container(
        decoration: BoxDecoration(
        color: Constants.offWhiteColor,
          borderRadius: BorderRadius.circular(5)
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8,vertical: 4),
          child: Text(
            'Admin',
            textAlign: TextAlign.start,
            maxLines: 1,
            style: TextStyle(
              fontSize: 12,
              height: 1.2,
              fontFamily: 'Mulish-Reg',
              color: Constants.primaryLightColor,
            ),
          ),
        ),
      )
      :const SizedBox(),
    );
  }
  // String getId(String str) => str.substring(0, str.indexOf("_"));
  String getName(String str) => str.substring(str.indexOf("_") + 1);
}
