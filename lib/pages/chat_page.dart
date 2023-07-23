import 'package:chat_herd/pages/group_info.dart';
import 'package:chat_herd/services/database_services.dart';
import 'package:chat_herd/widgets/chat_card.dart';
import 'package:chat_herd/widgets/widgets.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../shared/constants.dart';

class ChatPage extends StatefulWidget {
  final String groupId;
  final String groupName;
  final String userName;
  final String groupIcon;
  const ChatPage(
      {super.key,
      required this.groupName,
      required this.groupId,
      required this.userName,
      required this.groupIcon});

  @override
  State<ChatPage> createState() => _ChatPageState();
}

class _ChatPageState extends State<ChatPage> {
  Stream<QuerySnapshot>? chats;
  TextEditingController messageController = TextEditingController();
  String admin = "";
  String _message = "";
  @override
  void initState() {
    super.initState();
    getChatAndAdmin();
  }

  getChatAndAdmin() {
    DatabaseServices().getChats(widget.groupId).then((value) {
      setState(() => chats = value);
    });
    DatabaseServices().getGroupAdmin(widget.groupId).then((value) {
      setState(() => admin = value);
    });

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Constants.offWhiteColor,
      appBar: AppBar(
        elevation: 1,
        // centerTitle: true,
        leading: IconButton(
            onPressed: () => Navigator.pop(context),
            icon: Icon(
              Icons.arrow_back_ios_new_rounded,
              size: 20,
              color: Constants.blackColor,
            )),
        title: Text(
          widget.groupName,
          style: TextStyle(
              color: Constants.blackColor,
              fontFamily: 'Mulish-Reg',
              fontSize: 18,
              fontWeight: FontWeight.w600),
        ),
        backgroundColor: Constants.whiteColor,
        actions: [
          IconButton(
              onPressed: () => nextPage(
                  context,
                  GroupInfoPage(
                    groupId: widget.groupId,
                    groupName: widget.groupName,
                    groupIcon: widget.groupIcon,
                    adminName: admin,
                  )),
              icon: Icon(
                Icons.info_rounded,
                color: Constants.greyColor,
              )),
        ],
      ),
      body: Column(
        children: <Widget>[
          Expanded(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: messages(),
            ),
          ), // Align(
          //   alignment: Alignment.bottomCenter,
          //   child:
          Container(
            height: 56,
            width: MediaQuery.of(context).size.width,
            decoration: BoxDecoration(
              color: Constants.whiteColor,
              // color: Colors.red.shade200,
            ),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SizedBox(
                    height: 36,
                    width: 36,
                    child: Icon(
                      Icons.add,
                      color: Constants.hintColor,
                    )),
                Expanded(
                  child: SizedBox(
                    height: 36,
                    child: TextField(
                      onChanged: (value){
                        setState(() {
                          _message = value.trim();
                        });
                      },
                      controller: messageController,
                      keyboardType: TextInputType.multiline,
                      autofocus: true,
                      showCursor: true,
                      maxLines: 100,
                      textAlignVertical: TextAlignVertical.center,
                      scrollPhysics: const ClampingScrollPhysics(),
                      style: TextStyle(
                        color: Constants.blackColor,
                        fontFamily: 'Mulish-Reg',
                        fontSize: 14,
                        height: 1.4,
                      ),
                      decoration: InputDecoration(
                        filled: true,
                        // fillColor: Colors.yellow.shade200,
                        fillColor: Constants.offWhiteColor,
                        contentPadding: const EdgeInsets.symmetric(
                            vertical: 4, horizontal: 5),
                        border: OutlineInputBorder(
                          borderSide: BorderSide.none,
                          borderRadius: BorderRadius.circular(5),
                        ),
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10),
                  child: (_message.isNotEmpty)
                      ? InkWell(
                          onTap: () => sendMessage(),
                          child: SvgPicture.asset(
                              height: 24, width: 24, 'assets/svg/ic_send.svg'),
                        )
                      : Icon(
                          Icons.mic,
                          color: Constants.greyColor,
                        ),
                ),
              ],
            ),
          ),
          // ),
        ],
      ),
    );
  }

  messages() {
    return StreamBuilder(
        stream: chats,
        builder: (context, AsyncSnapshot snapshot) {
          return snapshot.hasData
              ? ListView.builder(
                  shrinkWrap: true,
                  reverse: true,
                  itemCount: snapshot.data.docs.length,
                  itemBuilder: (context, index) {
                    return ChatCard(
                        message: snapshot.data.docs[index]['message'],
                        sender: snapshot.data.docs[index]['sender'],
                        sendByMe: widget.userName ==
                            snapshot.data.docs[index]['sender'],
                    time:snapshot.data.docs[index]['time'].toString());
                  })
              : const SizedBox();
        });
  }

  sendMessage() {
    if (messageController.text.isNotEmpty) {
      Map<String, dynamic>chatMessageMap={
        'message': messageController.text.trim(),
        'sender':widget.userName,
        'time':DateTime.now().millisecondsSinceEpoch
      };

      DatabaseServices().sendMessage(widget.groupId, chatMessageMap);
      setState(() {
        messageController.clear();
        _message='';
      } );

    }
  }

}
