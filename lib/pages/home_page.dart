import 'package:chat_herd/helper/helper_function.dart';
import 'package:chat_herd/pages/search_page.dart';
import 'package:chat_herd/services/database_services.dart';
import 'package:chat_herd/widgets/group_card.dart';
import 'package:chat_herd/widgets/widgets.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../shared/constants.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  Stream? groups;
  Stream? groupsData;
  bool _isLoading = false;
  String? groupName;
  String? userName;
  final formKey = GlobalKey<FormState>();
  @override
  void initState() {
    super.initState();
    getUserData();
  }

  String getId(String str) {
    return str.substring(0, str.indexOf("_"));
  }

  String getName(String str) {
    return str.substring(str.indexOf("_") + 1);
  }

  getUserData() async {
    await DatabaseServices(uid: FirebaseAuth.instance.currentUser!.uid)
        .getUserGroups()
        .then((snapshot) {
      setState(() {
        groups = snapshot;
      });
    });

    await HelperFunction.getUserNameSF().then((value) {
      setState(() {
        userName = value;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Constants.whiteColor,
        body: SingleChildScrollView(
          child: Column(
            children: [
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Chats',
                      style: TextStyle(
                        fontSize: 18,
                        height: 1.5,
                        fontFamily: 'Mulish-Reg',
                        fontWeight: FontWeight.w600,
                        color: Constants.blackColor,
                      ),
                    ),
                    InkWell(
                        onTap: () => popUpDialog(context),
                        child:
                            SvgPicture.asset('assets/svg/ic_plus_black.svg')),
                  ],
                ),
              ),
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 20, vertical: 8),
                child: InkWell(
                  onTap: () {
                    nextPage(context, const SearchPage());
                  },
                  child: Container(
                    width: double.maxFinite,
                    height: 36,
                    decoration: BoxDecoration(
                      color: Constants.offWhiteColor,
                      borderRadius: BorderRadius.circular(5),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 8.0),
                      child: Align(
                        alignment: Alignment.centerLeft,
                        child: Icon(
                          Icons.search_rounded,
                          color: Constants.hintColor,
                        ),
                      ),
                    ),
                  ),
                ),
              ),
              groupList(),
            ],
          ),
        ),
      ),
    );
  }

  groupList() {
    return StreamBuilder(
        stream: groups,
        builder: (context, AsyncSnapshot snapshot) {
          if (snapshot.hasData) {
            if (snapshot.data['groups'] != null) {
              if (snapshot.data['groups'].length != 0) {
                return ListView.builder(
                    shrinkWrap: true,
                    physics: const ClampingScrollPhysics(),
                    itemCount: snapshot.data['groups'].length,
                    itemBuilder: (context, index) {
                            return GroupCard(
                              groupName: getName(snapshot
                                  .data['groups'][index]),
                              groupIcon: '',
                              groupId: getId(snapshot.data['groups'][index]),
                              userName: userName ?? 'null');
                    });
              } else {
                return noGroupWidget();
              }
            } else {
              return noGroupWidget();
            }
          } else {
            return Center(
              child: CircularProgressIndicator(
                color: Constants.primaryLightColor,
              ),
            );
          }
        });
  }

  noGroupWidget() {
    return Center(
      child: Column(
        children: [
          SizedBox(
            height: MediaQuery.of(context).size.height * 0.2,
          ),
          SizedBox(
            width: MediaQuery.of(context).size.width * 0.6,
            height: MediaQuery.of(context).size.width * 0.6,
            child: Image.asset('assets/images/empty_email.webp'),
          ),
          Text(
            'Create your own herd or join the existed herds',
            textAlign: TextAlign.center,
            style: TextStyle(
              overflow: TextOverflow.ellipsis,
              fontSize: 14,
              fontFamily: 'Mulish-Reg',
              color: Constants.blackColor,
            ),
          ),
        ],
      ),
    );
  }

  popUpDialog(BuildContext context)
  {
    showDialog(
        context: context,
        builder: (context) {
          return StatefulBuilder(builder: ((context, setState) {
            return AlertDialog(
              title: const Text('Create a new herd', textAlign: TextAlign.start),
              backgroundColor: Constants.whiteColor,
              content: Form(
                key: formKey,
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    _isLoading
                        ? Center(
                            child: CircularProgressIndicator(
                                color: Constants.primaryLightColor))
                        : SizedBox(
                            height: 60,
                            width: 60,
                            child: Stack(
                              children: [
                                Container(
                                  decoration: BoxDecoration(
                                    color: Constants.offWhiteColor,
                                    borderRadius: BorderRadius.circular(15),
                                  ),
                                  child: Image.asset('assets/images/user.png'),
                                ),
                                Align(
                                  alignment: Alignment.bottomRight,
                                  child: Container(
                                      decoration: BoxDecoration(
                                        color: Constants.whiteColor,
                                        borderRadius: BorderRadius.circular(50),
                                      ),
                                      child: SvgPicture.asset(
                                          'assets/svg/ic_plus_black.svg')),
                                )
                              ],
                            ),
                          ),
                    const SizedBox(height: 10),
                    TextFormField(
                      keyboardType: TextInputType.name,
                      maxLength: 30,
                      onChanged: (value) {
                        setState(() {
                          groupName = value.trim();
                        });
                      },
                      decoration: textInputDecoration.copyWith(
                        labelText: 'Herd Name',
                        prefixIcon: Icon(
                          Icons.groups,
                          color: Constants.hintColor,
                        ),
                      ),
                      validator: (value) {
                        return (value != "")
                            ? null
                            : "Please enter a herd name";
                      },
                    ),
                    const SizedBox(height: 6),
                    TextButton(
                      onPressed: () => createGroup(),
                      child: Container(
                        height: 40,
                        width: MediaQuery.of(context).size.width *
                            double.maxFinite,
                        padding: const EdgeInsets.symmetric(vertical: 9),
                        decoration: BoxDecoration(
                          color: Constants.primaryLightColor,
                          borderRadius: BorderRadius.circular(30),
                        ),
                        child: Text(
                          'Create Herd',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            color: Constants.whiteColor,
                            fontSize: 14,
                            fontFamily: 'Mulish-Reg',
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            );
          }));
        });
  }

  createGroup() {
    if (formKey.currentState!.validate()) {
      setState(() {
        _isLoading = true;
      });
      DatabaseServices(uid: FirebaseAuth.instance.currentUser!.uid)
          .createGroup(
              userName!, FirebaseAuth.instance.currentUser!.uid, groupName!)
          .whenComplete(() {
        _isLoading = false;
      });
      Navigator.of(context).pop();
      showSnackBar(context, Colors.green, 'Herd created Successfully', 3);
    }
  }
}
