import 'package:chat_herd/shared/constants.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class ChatCard extends StatefulWidget {
  final String message;
  final String sender;
  final String time;
  final bool sendByMe;
  const ChatCard({super.key, required this.message, required this.sender, required this.sendByMe, required this.time});

  @override
  State<ChatCard> createState() => _ChatCardState();
}

class _ChatCardState extends State<ChatCard> {
  getTime(int time){
    DateTime dateTime = DateTime.fromMillisecondsSinceEpoch(time);
    return DateFormat('MMM d, h:mm a').format(dateTime);
  }
  @override
  Widget build(BuildContext context) {
    return Align(
      alignment:(widget.sendByMe)?Alignment.centerRight:Alignment.centerLeft,
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 10.0),
        child: Container(
          constraints: BoxConstraints(
              minWidth:MediaQuery.of(context).size.width*0.3,
              maxWidth: MediaQuery.of(context).size.width*0.8),
          decoration: BoxDecoration(
          color: (widget.sendByMe)?Constants.primaryLightColor:Constants.whiteColor,
            borderRadius: (widget.sendByMe)?const BorderRadius.only(topLeft: Radius.circular(15), topRight:  Radius.circular(15), bottomLeft:  Radius.circular(15))
            :const BorderRadius.only(bottomRight: Radius.circular(15), topRight:  Radius.circular(15), bottomLeft:  Radius.circular(15)),
          ),
          child: Padding(
            padding:(widget.sendByMe)?const EdgeInsets.only(left: 10, right: 10, top: 5, bottom: 8):const EdgeInsets.all(10),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                (widget.sendByMe)
                    ?const SizedBox()
                :Text(
                  widget.sender,
                  textAlign: TextAlign.start,
                  softWrap: true,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(
                    color: Constants.primaryLightColor,
                    fontSize: 12,
                    height: 1.5,
                    fontWeight: FontWeight.w600,
                    fontFamily: 'Mulish-Reg',
                  ),
                ),
                const SizedBox(height: 2),
                Text(
                  widget.message,
                  textAlign: TextAlign.start,
                  softWrap: true,
                  maxLines: null,
                  overflow: TextOverflow.clip,
                  style: TextStyle(
                    color:(widget.sendByMe)?Constants.whiteColor :Constants.blackColor,
                    fontSize: 14,
                    fontFamily: 'Mulish-Reg',
                  ),
                ),
                const SizedBox(height: 2),
                Align(
                  alignment: Alignment.centerRight,
                  child: Text(
                    getTime(int.parse(widget.time)),
                    textAlign: TextAlign.start,
                    softWrap: true,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(
                      color:(widget.sendByMe)?Constants.whiteColor :Constants.greyColor,
                      fontSize: 10,
                      fontFamily: 'Mulish-Reg',
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
