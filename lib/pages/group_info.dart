import 'package:chat_herd/widgets/member_card.dart';
import 'package:flutter/material.dart';

import '../shared/constants.dart';

class GroupInfoPage extends StatefulWidget {
  const GroupInfoPage({super.key});

  @override
  State<GroupInfoPage> createState() => _GroupInfoPageState();
}

class _GroupInfoPageState extends State<GroupInfoPage> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Constants.whiteColor,
        body: SingleChildScrollView(
          physics:const ClampingScrollPhysics(),
          child: Column(
            children: <Widget>[
              Align(
                alignment: Alignment.centerLeft,
                child: Padding(
                  padding:
                  const EdgeInsets.symmetric(vertical: 15, horizontal: 10),
                  child: InkWell(
                    onTap: () => Navigator.pop(context),
                    child: Icon(
                      Icons.arrow_back_ios_new_rounded,
                      size: 20,
                      color: Constants.blackColor,
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 6),
               Center(
                    child: CircleAvatar(
                      radius: 50,
                      backgroundColor: Constants.primaryLightColor,
                      child: Image.asset('assets/images/user-group.png'),
                    ),
                  ),
              const SizedBox(height:7),
              Text(
                'Group Name',
                style: TextStyle(
                    color: Constants.blackColor,
                    fontFamily: 'Mulish-Reg',
                    fontSize: 18,
                    fontWeight: FontWeight.w600),
              ),
              Padding(
                padding:
                const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                child: Divider(
                  thickness: 1,
                  color: Constants.dividerColor,
                ),
              ),
              Padding(
                padding:  const EdgeInsets.symmetric(horizontal: 16),
                child: Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    '32 participate',
                    style: TextStyle(
                        color: Constants.greyColor,
                        fontFamily: 'Mulish-Reg',
                        fontSize: 12,
                    fontWeight: FontWeight.w600),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 5.0),
                child: ListView.builder(
                  physics:const ClampingScrollPhysics(),
                  shrinkWrap: true,
                  itemCount:20,
                  itemBuilder: (context, index){
                  return const MemberCard();
                }),
              ),
              Padding(
                padding:
                const EdgeInsets.symmetric(horizontal: 16, vertical: 4),
                child: Divider(
                  height: 2,
                  thickness: 1,
                  color: Constants.dividerColor,
                ),
              ),
              Align(
                alignment: Alignment.centerLeft,
                child: Padding(
                  padding:
                  const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
                  child: InkWell(
                    onTap: () => popUpDialog(context),
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        SizedBox(
                          height: 24,
                          width: 24,
                          child:
                          Icon(Icons.logout, color: Constants.redColor),
                        ),
                        const SizedBox(width: 10),
                        Text(
                          'Exit Herd',
                          textAlign: TextAlign.start,
                          style: TextStyle(
                            color: Constants.redColor,
                            fontSize: 14,
                            fontFamily: 'Mulish-Reg',
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
  popUpDialog(BuildContext context) {
    showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            titlePadding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
            title: Text(
              'Exit Herd',
              style: TextStyle(
                color: Constants.blackColor,
                fontSize: 16,
                fontFamily: 'Mulish-Reg',
                fontWeight: FontWeight.w600,
              ),
            ),
            contentPadding:const EdgeInsets.symmetric(horizontal: 15),
            content: Text(
              'Are you sure you want to exit?',
              style: TextStyle(
                color: Constants.blackColor,
                fontSize: 14,
                fontFamily: 'Mulish-Reg',
              ),
            ),
            actionsPadding:const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
            actions: [
              ElevatedButton(
                onPressed: () => Navigator.pop(context),
                style: ElevatedButton.styleFrom(
                  elevation: 0,
                  backgroundColor: Constants.greyColor,
                  side:const BorderSide(width:50),
                  shape:RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(50),
                  ),
                ),
                child:Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10.0),
                  child: Text(
                    'No',
                    style: TextStyle(
                      color: Constants.whiteColor,
                      fontSize: 14,
                      fontFamily: 'Mulish-Reg',
                    ),
                  ),
                ), ),
              ElevatedButton(
                onPressed: () {},
                style: ElevatedButton.styleFrom(
                  elevation: 0,
                  backgroundColor: Constants.redColor,
                  side:const BorderSide(width:50),
                  shape:RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(50),
                  ),
                ),
                child:Text(
                  'Yes, Exit',
                  style: TextStyle(
                    color: Constants.whiteColor,
                    fontSize: 14,
                    fontFamily: 'Mulish-Reg',
                    fontWeight: FontWeight.w400,
                  ),
                ), ),
            ],
          );
        });
  }
}
