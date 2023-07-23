import 'package:chat_herd/helper/helper_function.dart';
import 'package:chat_herd/pages/onboarding_page.dart';
import 'package:chat_herd/services/auth_services.dart';
import 'package:chat_herd/services/database_services.dart';
import 'package:chat_herd/widgets/widgets.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';
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
  String profilePic = '';
  AuthServices authServices = AuthServices();

  @override
  void initState() {
    super.initState();
    getUserData();
    getProfilePic();
  }

  getUserData() {
    HelperFunction.getUserNameSF()
        .then((value) => setState(() => fullName = value!));
    HelperFunction.getUserEmailSF()
        .then((value) => setState(() => emailAddress = value!));
  }

  getProfilePic() async {
    QuerySnapshot snapshot =
        await DatabaseServices(uid: FirebaseAuth.instance.currentUser!.uid)
            .getUserProfilePic(FirebaseAuth.instance.currentUser!.uid);
    if (snapshot.docs.isNotEmpty) {
      setState(() => profilePic = snapshot.docs[0]['profilePic']);
    } else {
      if (kDebugMode) {
        print('doesnt exists');
      }
    }
  }

  updateProfilePic(String profilePicture) async {
    profilePic = profilePicture;
    await DatabaseServices(uid: FirebaseAuth.instance.currentUser!.uid)
        .updateUserProfilePic(profilePicture);
    if (!mounted) return;
    Navigator.pop(context);
    setState(() {});
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
            titlePadding:
                const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
            title: Text(
              'Logout',
              style: TextStyle(
                color: Constants.blackColor,
                fontSize: 16,
                fontFamily: 'Mulish-Reg',
                fontWeight: FontWeight.w600,
              ),
            ),
            contentPadding: const EdgeInsets.symmetric(horizontal: 15),
            content: Text(
              'Are you sure you want to logout?',
              style: TextStyle(
                color: Constants.blackColor,
                fontSize: 14,
                fontFamily: 'Mulish-Reg',
              ),
            ),
            actionsPadding:
                const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
            actions: [
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
                child: Text(
                  'Cancel',
                  style: TextStyle(
                    color: Constants.whiteColor,
                    fontSize: 14,
                    fontFamily: 'Mulish-Reg',
                  ),
                ),
              ),
              ElevatedButton(
                onPressed: () => signOut(),
                style: ElevatedButton.styleFrom(
                  elevation: 0,
                  backgroundColor: Constants.redColor,
                  side: const BorderSide(width: 50),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(50),
                  ),
                ),
                child: Text(
                  'Logout',
                  style: TextStyle(
                    color: Constants.whiteColor,
                    fontSize: 14,
                    fontFamily: 'Mulish-Reg',
                    fontWeight: FontWeight.w400,
                  ),
                ),
              ),
            ],
          );
        });
  }

  popUpAvatarDialog(BuildContext context) {
    showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            titlePadding:
                const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
            title: Text(
              'Select Avatar',
              style: TextStyle(
                color: Constants.blackColor,
                fontSize: 16,
                fontFamily: 'Mulish-Reg',
                fontWeight: FontWeight.w600,
              ),
            ),
            content: AspectRatio(
              aspectRatio: 4 / 2,
              child: GridView.count(
                crossAxisCount: 4,
                shrinkWrap: true,
                mainAxisSpacing: 10,
                crossAxisSpacing: 10,
                children: <Widget>[
                  InkWell(
                    onTap: () => updateProfilePic(
                        'https://dl.dropboxusercontent.com/s/k5r5b2l6xbjyv0v/m1.png?dl=0'),
                    child: CircleAvatar(
                      radius: 25,
                      backgroundColor: Constants.greyColor,
                      child: Image.asset('assets/images/m1.png'),
                    ),
                  ),
                  InkWell(
                    onTap: () => updateProfilePic(
                        'https://dl.dropboxusercontent.com/s/5k028tudqz7p39c/m2.png?dl=0'),
                    child: CircleAvatar(
                      radius: 25,
                      backgroundColor: Constants.greyColor,
                      child: Image.asset('assets/images/m2.png'),
                    ),
                  ),
                  InkWell(
                    onTap: () => updateProfilePic(
                        'https://dl.dropboxusercontent.com/s/h9dqfxpom5zh2ko/m3.png?dl=0'),
                    child: CircleAvatar(
                      radius: 25,
                      backgroundColor: Constants.greyColor,
                      child: Image.asset('assets/images/m3.png'),
                    ),
                  ),
                  InkWell(
                    onTap: () => updateProfilePic(
                        'https://dl.dropboxusercontent.com/s/htyzll5kc4bnx32/m4.png?dl=0'),
                    child: CircleAvatar(
                      radius: 25,
                      backgroundColor: Constants.greyColor,
                      child: Image.asset('assets/images/m4.png'),
                    ),
                  ),
                  InkWell(
                    onTap: () => updateProfilePic(
                        'https://dl.dropboxusercontent.com/s/7ze2z964o5y7i83/w1.png?dl=0'),
                    child: CircleAvatar(
                      radius: 25,
                      backgroundColor: Constants.greyColor,
                      child: Image.asset('assets/images/w1.png'),
                    ),
                  ),
                  InkWell(
                    onTap: () => updateProfilePic(
                        'https://dl.dropboxusercontent.com/s/tavueqmubgh5qj8/w2.png?dl=0'),
                    child: CircleAvatar(
                      radius: 25,
                      backgroundColor: Constants.greyColor,
                      child: Image.asset('assets/images/w2.png'),
                    ),
                  ),
                  InkWell(
                    onTap: () => updateProfilePic(
                        'https://dl.dropboxusercontent.com/s/ci57dtq7nl43fx7/w3.png?dl=0'),
                    child: CircleAvatar(
                      radius: 25,
                      backgroundColor: Constants.greyColor,
                      child: Image.asset('assets/images/w3.png'),
                    ),
                  ),
                  InkWell(
                    onTap: () => updateProfilePic(
                        'https://dl.dropboxusercontent.com/s/9enfsgflwsqpyyi/w4.png?dl=0'),
                    child: CircleAvatar(
                      radius: 25,
                      backgroundColor: Constants.greyColor,
                      child: Image.asset('assets/images/w4.png'),
                    ),
                  ),
                ],
              ),
            ),
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
                padding: const EdgeInsets.only(left: 22, top: 15, bottom: 12),
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
                        InkWell(
                          onTap: () => popUpAvatarDialog(context),
                          child: CircleAvatar(
                            radius: 25,
                            backgroundColor: Constants.greyColor,
                            child: (profilePic == '')
                                ? Image.asset('assets/images/user.png')
                                : Stack(
                                    children: [
                                      Image.network(
                                        profilePic,
                                        fit: BoxFit.cover,
                                        loadingBuilder: (BuildContext context,
                                            Widget child,
                                            ImageChunkEvent? loadingProgress) {
                                          if (loadingProgress == null)
                                            return child;
                                          return Center(
                                            child: CircularProgressIndicator(
                                              value: loadingProgress
                                                          .expectedTotalBytes !=
                                                      null
                                                  ? loadingProgress
                                                          .cumulativeBytesLoaded /
                                                      loadingProgress
                                                          .expectedTotalBytes!
                                                  : null,
                                            ),
                                          );
                                        },
                                      ),
                                      Positioned(
                                        right: 0,
                                          bottom: 0,
                                          child: Container(
                                            padding:const EdgeInsets.all(2),
                                            decoration: BoxDecoration(
                                              color: Constants.hintColor,
                                              borderRadius: BorderRadius.circular(50),
                                            ),
                                              child: Icon(Icons.edit, color: Constants.blackColor,size: 12))),
                                    ],
                                  ),
                          ),
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
                                  fontSize: 13,
                                  fontFamily: 'Mulish-Reg',
                                ),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                    const SizedBox()
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
