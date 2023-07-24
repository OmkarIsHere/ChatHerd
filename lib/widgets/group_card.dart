import 'package:chat_herd/pages/chat_page.dart';
import 'package:chat_herd/shared/constants.dart';
import 'package:chat_herd/widgets/widgets.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:encrypt/encrypt.dart' as encrypt;
import 'package:encrypt/encrypt.dart';
import '../services/database_services.dart';

class GroupCard extends StatefulWidget {
  final String groupName, groupIcon, groupId, userName;
  const GroupCard(
      {required this.groupName,
      required this.groupIcon,
      super.key,
      required this.groupId,
      required this.userName});

  @override
  State<GroupCard> createState() => _GroupCardState();
}

class _GroupCardState extends State<GroupCard> {
  String sender = '';
  String recentMessage = '';
  @override
  void initState() {
    super.initState();
    getGroupData();
  }

  getGroupData() async {
    QuerySnapshot snapshot =
        await DatabaseServices(uid: FirebaseAuth.instance.currentUser!.uid)
            .getGroupData(widget.groupId); //.then((snapshot){
    setState(() {
      if (snapshot.docs[0]['recentMessageSender'] != widget.userName) {
        sender = snapshot.docs[0]['recentMessageSender'];
      } else {
        sender = 'Me';
      }
      recentMessage = decryptString(snapshot.docs[0]['recentMessage']);
    });
  }

  decryptString(String encrypted) {
    if (encrypted.isNotEmpty) {
      final key = encrypt.Key.fromUtf8('my 32 length key................');
      final iv = encrypt.IV.fromLength(16);
      final encrypter = encrypt.Encrypter(AES(key));
      final decrypted = encrypter.decrypt(
          Encrypted.fromBase64(encrypted), iv: iv);
      return decrypted;
    } else {
      return '';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 5),
      child: Column(
        children: <Widget>[
          InkWell(
            onTap: () => nextPage(
                context,
                ChatPage(
                    groupName: widget.groupName,
                    groupId: widget.groupId,
                    userName: widget.userName,
                    groupIcon: widget.groupIcon)),
            child: Row(
              children: <Widget>[
                CircleAvatar(
                  radius: 20,
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
                    SizedBox(
                      width: MediaQuery.of(context).size.width * 0.65,
                      child: Text(
                        (recentMessage.isNotEmpty)
                            ? '$sender : $recentMessage'
                            : '',
                        textAlign: TextAlign.start,
                        maxLines: 1,
                        style: TextStyle(
                          fontSize: 12,
                          height: 1.1,
                          overflow: TextOverflow.ellipsis,
                          fontFamily: 'Mulish-Reg',
                          color: Colors.grey.shade700,
                        ),
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
