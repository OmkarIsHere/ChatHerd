import 'package:chat_herd/helper/helper_function.dart';
import 'package:chat_herd/pages/onboarding_page.dart';
import 'package:chat_herd/services/auth_services.dart';
import 'package:chat_herd/widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../shared/constants.dart';

class MorePage extends StatefulWidget {
  const MorePage({super.key});

  @override
  State<MorePage> createState() => _MorePageState();
}

class _MorePageState extends State<MorePage> {
  String fullName = 'null';
  String emailAddress = 'null';
  AuthServices authServices = AuthServices();

  @override
  void initState() {
    super.initState();
    getUserData();
  }

  getUserData() {
    HelperFunction.getUserNameSF()
        .then((value) => setState(() => fullName = value!));
    HelperFunction.getUserEmailSF()
        .then((value) => setState(() => emailAddress = value!));
  }

  signOut() async {
    await authServices.signOut();
    if (!mounted) return;
    nextPageReplacement(context, const OnBoarding());
  }

  popUpDialog(BuildContext context) {
    showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            titlePadding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
            title: Text(
              'Logout',
              style: TextStyle(
                color: Constants.blackColor,
                fontSize: 16,
                fontFamily: 'Mulish-Reg',
                fontWeight: FontWeight.w600,
              ),
            ),
            contentPadding:const EdgeInsets.symmetric(horizontal: 15),
            content: Text(
              'Are you sure you want to logout?',
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
                child:Text(
                  'Cancel',
                  style: TextStyle(
                    color: Constants.whiteColor,
                    fontSize: 14,
                    fontFamily: 'Mulish-Reg',
                  ),
                ), ),
              ElevatedButton(
                  onPressed: ()=>signOut(),
                  style: ElevatedButton.styleFrom(
                    elevation: 0,
                    backgroundColor: Constants.redColor,
                    side:const BorderSide(width:50),
                    shape:RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(50),
                    ),
                  ),
                  child:Text(
                    'Logout',
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

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Constants.whiteColor,
        body: SingleChildScrollView(
          child: Column(
            children: <Widget>[
              Padding(
                padding:
                    const EdgeInsets.only(left: 22, top: 15, bottom: 12),
                child: Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    'More',
                    textAlign: TextAlign.start,
                    style: TextStyle(
                      color: Constants.blackColor,
                      fontSize: 18,
                      height: 1.5,
                      fontWeight: FontWeight.w600,
                      fontFamily: 'Mulish-Reg',
                    ),
                  ),
                ),
              ),
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        CircleAvatar(
                          radius: 25,
                          backgroundColor: Constants.greyColor,
                          child: Image.asset('assets/images/user.png'),
                        ),
                        const SizedBox(width: 15),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            Align(
                              alignment: Alignment.centerLeft,
                              child: Text(
                                fullName,
                                textAlign: TextAlign.start,
                                style: TextStyle(
                                  color: Constants.blackColor,
                                  fontSize: 14,
                                  fontWeight: FontWeight.w500,
                                  fontFamily: 'Mulish-Reg',
                                ),
                              ),
                            ),
                            Align(
                              alignment: Alignment.centerLeft,
                              child: Text(
                                emailAddress,
                                textAlign: TextAlign.start,
                                style: TextStyle(
                                  color: Constants.greyColor,
                                  fontSize: 12,
                                  fontFamily: 'Mulish-Reg',
                                ),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 24,
                      width: 24,
                      child:
                          SvgPicture.asset('assets/svg/ic_forward_black.svg'),
                    )
                  ],
                ),
              ),
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Row(
                      mainAxisSize: MainAxisSize.min,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        SizedBox(
                          height: 24,
                          width: 24,
                          child: SvgPicture.asset('assets/svg/ic_account.svg'),
                        ),
                        const SizedBox(width: 10),
                        Text(
                          'Account',
                          textAlign: TextAlign.start,
                          style: TextStyle(
                            color: Constants.blackColor,
                            fontSize: 14,
                            fontFamily: 'Mulish-Reg',
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 24,
                      width: 24,
                      child:
                          SvgPicture.asset('assets/svg/ic_forward_black.svg'),
                    ),
                  ],
                ),
              ),
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Row(
                      mainAxisSize: MainAxisSize.min,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        SizedBox(
                          height: 24,
                          width: 24,
                          child: SvgPicture.asset('assets/svg/ic_chats.svg'),
                        ),
                        const SizedBox(width: 10),
                        Text(
                          'Chats',
                          textAlign: TextAlign.start,
                          style: TextStyle(
                            color: Constants.blackColor,
                            fontSize: 14,
                            fontFamily: 'Mulish-Reg',
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 24,
                      width: 24,
                      child:
                          SvgPicture.asset('assets/svg/ic_forward_black.svg'),
                    ),
                  ],
                ),
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
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Row(
                      mainAxisSize: MainAxisSize.min,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        SizedBox(
                          height: 24,
                          width: 24,
                          child:
                              SvgPicture.asset('assets/svg/ic_appearance.svg'),
                        ),
                        const SizedBox(width: 10),
                        Text(
                          'Appearance',
                          textAlign: TextAlign.start,
                          style: TextStyle(
                            color: Constants.blackColor,
                            fontSize: 14,
                            fontFamily: 'Mulish-Reg',
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 24,
                      width: 24,
                      child:
                          SvgPicture.asset('assets/svg/ic_forward_black.svg'),
                    ),
                  ],
                ),
              ),
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Row(
                      mainAxisSize: MainAxisSize.min,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        SizedBox(
                          height: 24,
                          width: 24,
                          child: SvgPicture.asset(
                              'assets/svg/ic_notification.svg'),
                        ),
                        const SizedBox(width: 10),
                        Text(
                          'Notification',
                          textAlign: TextAlign.start,
                          style: TextStyle(
                            color: Constants.blackColor,
                            fontSize: 14,
                            fontFamily: 'Mulish-Reg',
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 24,
                      width: 24,
                      child:
                          SvgPicture.asset('assets/svg/ic_forward_black.svg'),
                    ),
                  ],
                ),
              ),
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Row(
                      mainAxisSize: MainAxisSize.min,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        SizedBox(
                          height: 24,
                          width: 24,
                          child: SvgPicture.asset('assets/svg/ic_privacy.svg'),
                        ),
                        const SizedBox(width: 10),
                        Text(
                          'Privacy',
                          textAlign: TextAlign.start,
                          style: TextStyle(
                            color: Constants.blackColor,
                            fontSize: 14,
                            fontFamily: 'Mulish-Reg',
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 24,
                      width: 24,
                      child:
                          SvgPicture.asset('assets/svg/ic_forward_black.svg'),
                    ),
                  ],
                ),
              ),
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Row(
                      mainAxisSize: MainAxisSize.min,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        SizedBox(
                          height: 24,
                          width: 24,
                          child:
                              SvgPicture.asset('assets/svg/ic_data-usage.svg'),
                        ),
                        const SizedBox(width: 10),
                        Text(
                          'Data Usage',
                          textAlign: TextAlign.start,
                          style: TextStyle(
                            color: Constants.blackColor,
                            fontSize: 14,
                            fontFamily: 'Mulish-Reg',
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 24,
                      width: 24,
                      child:
                          SvgPicture.asset('assets/svg/ic_forward_black.svg'),
                    ),
                  ],
                ),
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
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Row(
                      mainAxisSize: MainAxisSize.min,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        SizedBox(
                          height: 24,
                          width: 24,
                          child: SvgPicture.asset('assets/svg/ic_help.svg'),
                        ),
                        const SizedBox(width: 10),
                        Text(
                          'Help',
                          textAlign: TextAlign.start,
                          style: TextStyle(
                            color: Constants.blackColor,
                            fontSize: 14,
                            fontFamily: 'Mulish-Reg',
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 24,
                      width: 24,
                      child:
                          SvgPicture.asset('assets/svg/ic_forward_black.svg'),
                    ),
                  ],
                ),
              ),
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Row(
                      mainAxisSize: MainAxisSize.min,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        SizedBox(
                          height: 24,
                          width: 24,
                          child: SvgPicture.asset('assets/svg/ic_invite.svg'),
                        ),
                        const SizedBox(width: 10),
                        Text(
                          'Invite your friend',
                          textAlign: TextAlign.start,
                          style: TextStyle(
                            color: Constants.blackColor,
                            fontSize: 14,
                            fontFamily: 'Mulish-Reg',
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 24,
                      width: 24,
                      child:
                          SvgPicture.asset('assets/svg/ic_forward_black.svg'),
                    ),
                  ],
                ),
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
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
                child: InkWell(
                  onTap: () => popUpDialog(context),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Row(
                        mainAxisSize: MainAxisSize.min,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          SizedBox(
                            height: 24,
                            width: 24,
                            child:
                                Icon(Icons.logout, color: Constants.blackColor),
                          ),
                          const SizedBox(width: 10),
                          Text(
                            'Logout',
                            textAlign: TextAlign.start,
                            style: TextStyle(
                              color: Constants.blackColor,
                              fontSize: 14,
                              fontFamily: 'Mulish-Reg',
                            ),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 24,
                        width: 24,
                        child:
                            SvgPicture.asset('assets/svg/ic_forward_black.svg'),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
