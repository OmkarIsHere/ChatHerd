import 'package:chat_herd/services/database_services.dart';
import 'package:chat_herd/widgets/member_card.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import '../helper/helper_function.dart';
import '../shared/constants.dart';
import '../widgets/widgets.dart';

class GroupInfoPage extends StatefulWidget {
  final String groupId;
  final String groupName;
  final String groupIcon;
  final String adminName;
  const GroupInfoPage(
      {super.key,
      required this.groupId,
      required this.groupName,
      required this.adminName,
      required this.groupIcon});

  @override
  State<GroupInfoPage> createState() => _GroupInfoPageState();
}

class _GroupInfoPageState extends State<GroupInfoPage> {
  Stream? members;
  String? participates;
  bool _visibility = true;
  var temp = 0;
  String? userName;

  @override
  void initState() {
    super.initState();
    getGroupMembers();
    getUserNameAndUserId();

  }

  getUserNameAndUserId() async{
    await HelperFunction.getUserNameSF()
        .then((value) => setState(() => userName = value!));
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Theme.of(context).colorScheme.background,
        body: SingleChildScrollView(
                physics: const ClampingScrollPhysics(),
                child: Column(
                  children: <Widget>[
                    Align(
                      alignment: Alignment.centerLeft,
                      child: Padding(
                        padding: const EdgeInsets.symmetric(
                            vertical: 15, horizontal: 10),
                        child: InkWell(
                          onTap: () => Navigator.pop(context),
                          child: Icon(
                            Icons.arrow_back_ios_new_rounded,
                            size: 20,
                            color: Theme.of(context).colorScheme.secondary,
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(height: 6),
                    Center(
                      child: CircleAvatar(
                        radius: 50,
                        backgroundColor: Theme.of(context).colorScheme.primary,
                        child: ((widget.groupIcon).isEmpty)
                            ? Image.asset('assets/images/user-group.png')
                            : Image.network(widget.groupIcon),
                      ),
                    ),
                    const SizedBox(height: 7),
                    Text(
                      widget.groupName,
                      style: TextStyle(
                          color:Theme.of(context).colorScheme.secondary,
                          fontFamily: 'Mulish-Reg',
                          fontSize: 18,
                          fontWeight: FontWeight.w400),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 16, vertical: 8),
                      child: Divider(
                        thickness: 2,
                        color: Theme.of(context).dividerColor,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 16),
                      child: Align(
                        alignment: Alignment.centerLeft,
                        child: Text(
                          '${participates ?? '0'} participate',
                          style: TextStyle(
                              color: Theme.of(context).colorScheme.tertiary,
                              fontFamily: 'Mulish-Reg',
                              fontSize: 12,
                              fontWeight: FontWeight.w400),
                        ),
                      ),
                    ),
                    memberList(),
                    Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 16, vertical: 4),
                      child: Divider(
                        height: 2,
                        thickness: 2,
                        color: Theme.of(context).dividerColor,
                      ),
                    ),
                    Align(
                      alignment: Alignment.centerLeft,
                      child: Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 16, vertical: 12),
                        child: InkWell(
                          onTap: () => (widget.adminName ==  '${FirebaseAuth.instance.currentUser!.uid}_$userName')
                              ?showSnackBar(context, Constants.redColor, 'Admin can\'t exit from their own group', 3)
                              :popUpDialog(context),
                          child: Row(
                            mainAxisSize: MainAxisSize.min,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              SizedBox(
                                height: 24,
                                width: 24,
                                child: Icon(Icons.logout,
                                    color: Constants.redColor),
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
            backgroundColor: Theme.of(context).colorScheme.background,
            titlePadding:
                const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
            title: Text(
              'Exit Herd',
              style: TextStyle(
                color: Theme.of(context).colorScheme.secondary,
                fontSize: 16,
                fontFamily: 'Mulish-Reg',
                fontWeight: FontWeight.w400,
              ),
            ),
            contentPadding: const EdgeInsets.symmetric(horizontal: 15),
            content: Text(
              'Are you sure you want to exit?',
              style: TextStyle(
                color: Theme.of(context).colorScheme.secondary,
                fontSize: 14,
                fontFamily: 'Mulish-Reg',
              ),
            ),
            actionsPadding:
                const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
            actions: (_visibility == true)
                ? [
                    ElevatedButton(
                      onPressed: () => Navigator.pop(context),
                      style: ElevatedButton.styleFrom(
                        elevation: 0,
                        backgroundColor: Constants.greyColor,
                        side: const BorderSide(width: 50),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(50),
                        ),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 10.0),
                        child: Text(
                          'No',
                          style: TextStyle(
                            color: Constants.whiteColor,
                            fontSize: 14,
                            fontFamily: 'Mulish-Reg',
                          ),
                        ),
                      ),
                    ),
                    ElevatedButton(
                      onPressed: () async {
                        setState(() {});
                        _visibility = false;
                        await DatabaseServices(
                                uid: FirebaseAuth.instance.currentUser!.uid)
                            .exitGroup(widget.groupName, widget.groupId,
                                userName ?? 'null');

                        if (!mounted) return;
                        Navigator.of(context)..pop()..pop()..pop();
                      },
                      style: ElevatedButton.styleFrom(
                        elevation: 0,
                        backgroundColor: Constants.redColor,
                        side: const BorderSide(width: 50),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(50),
                        ),
                      ),
                      child: Text(
                        'Yes, Exit',
                        style: TextStyle(
                          color: Constants.whiteColor,
                          fontSize: 14,
                          fontFamily: 'Mulish-Reg',
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                    ),
                  ]
                : [
                    Center(
                        child: SizedBox(
                          height: 20,width: 20,
                          child: CircularProgressIndicator(
                              color: Constants.primaryLightColor),
                        )),
                  ],
          );
        });
  }

  memberList() {
    return StreamBuilder(
        stream: members,
        builder: (context, AsyncSnapshot snapShot) {
          if (snapShot.hasData) {
            if (snapShot.data['members'] != null) {
              return Padding(
                padding: const EdgeInsets.symmetric(vertical: 5.0),
                child: ListView.builder(
                    physics: const ClampingScrollPhysics(),
                    shrinkWrap: true,
                    itemCount: snapShot.data['members'].length,
                    itemBuilder: (context, index) {
                      participates =
                          (snapShot.data['members'].length).toString();
                      if (temp < 2) {
                        Future.delayed(Duration.zero, () async {
                          setState(() => temp++);
                        });
                      }
                      return MemberCard(
                          memberName: snapShot.data['members'][index],
                          adminName: widget.adminName);
                    }),
              );
            } else {
              return const SizedBox(height: 50);
            }
          } else {
            return const SizedBox(height: 50);
          }
        });
  }

  void getGroupMembers() {
    DatabaseServices(uid: FirebaseAuth.instance.currentUser!.uid)
        .getGroupMembers(widget.groupId)
        .then((value) {
      setState(() {
        members = value;
      });
    });
  }

  @override
  void dispose() {
    super.dispose();
    members;
    memberList();
  }
}
