import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../shared/constants.dart';
class MorePage extends StatelessWidget {
  const MorePage({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Constants.whiteColor,
        body: SingleChildScrollView(
          child: Column(
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
                child: Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    'More',
                    textAlign: TextAlign.start,
                    style: TextStyle(
                      color: Constants.blackColor,
                      fontSize: 18,
                      fontWeight: FontWeight.w700,
                      fontFamily: 'Mulish-Reg',
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
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
                          child:Image.asset('assets/images/user.png'),
                        ),
                        const SizedBox(width: 15),
                        Column(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            Text(
                              'Omkar Pendkalkar',
                              textAlign: TextAlign.start,
                              style: TextStyle(
                                color: Constants.blackColor,
                                fontSize: 14,
                                fontWeight: FontWeight.w500,
                                fontFamily: 'Mulish-Reg',
                              ),
                            ),
                            Text(
                              'example@gmail.com',
                              textAlign: TextAlign.start,
                              style: TextStyle(
                                color: Constants.greyColor,
                                fontSize: 12,
                                fontFamily: 'Mulish-Reg',
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                    SizedBox(
                      height:24 ,
                      width: 24,
                      child: SvgPicture.asset('assets/svg/ic_forward_black.svg'),
                    )
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Row(
                      mainAxisSize: MainAxisSize.min,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        SizedBox(
                          height:24 ,
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
                      height:24 ,
                      width: 24,
                      child: SvgPicture.asset('assets/svg/ic_forward_black.svg'),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Row(
                      mainAxisSize: MainAxisSize.min,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        SizedBox(
                          height:24 ,
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
                      height:24 ,
                      width: 24,
                      child: SvgPicture.asset('assets/svg/ic_forward_black.svg'),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 4),
                child: Divider(
                  height: 2,
                  thickness: 1,
                  color: Constants.dividerColor,
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Row(
                      mainAxisSize: MainAxisSize.min,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        SizedBox(
                          height:24 ,
                          width: 24,
                          child: SvgPicture.asset('assets/svg/ic_appearance.svg'),
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
                      height:24 ,
                      width: 24,
                      child: SvgPicture.asset('assets/svg/ic_forward_black.svg'),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Row(
                      mainAxisSize: MainAxisSize.min,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        SizedBox(
                          height:24 ,
                          width: 24,
                          child: SvgPicture.asset('assets/svg/ic_notification.svg'),
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
                      height:24 ,
                      width: 24,
                      child: SvgPicture.asset('assets/svg/ic_forward_black.svg'),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Row(
                      mainAxisSize: MainAxisSize.min,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        SizedBox(
                          height:24 ,
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
                      height:24 ,
                      width: 24,
                      child: SvgPicture.asset('assets/svg/ic_forward_black.svg'),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Row(
                      mainAxisSize: MainAxisSize.min,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        SizedBox(
                          height:24 ,
                          width: 24,
                          child: SvgPicture.asset('assets/svg/ic_data-usage.svg'),
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
                      height:24 ,
                      width: 24,
                      child: SvgPicture.asset('assets/svg/ic_forward_black.svg'),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 4),
                child: Divider(
                  height: 2,
                  thickness: 1,
                  color: Constants.dividerColor,
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Row(
                      mainAxisSize: MainAxisSize.min,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        SizedBox(
                          height:24 ,
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
                      height:24 ,
                      width: 24,
                      child: SvgPicture.asset('assets/svg/ic_forward_black.svg'),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Row(
                      mainAxisSize: MainAxisSize.min,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        SizedBox(
                          height:24 ,
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
                      height:24 ,
                      width: 24,
                      child: SvgPicture.asset('assets/svg/ic_forward_black.svg'),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 4),
                child: Divider(
                  height: 2,
                  thickness: 1,
                  color: Constants.dividerColor,
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Row(
                      mainAxisSize: MainAxisSize.min,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        SizedBox(
                          height:24 ,
                          width: 24,
                          child: Icon(Icons.logout, color: Constants.blackColor),
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
                      height:24 ,
                      width: 24,
                      child: SvgPicture.asset('assets/svg/ic_forward_black.svg'),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
