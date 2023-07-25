import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

import '../services/database_services.dart';

class MemberCard extends StatefulWidget {
  final String memberName;
  final String adminName;
  const MemberCard({super.key, required this.memberName, required this.adminName});

  @override
  State<MemberCard> createState() => _MemberCardState();
}

class _MemberCardState extends State<MemberCard> {
  String email ='';
  String profilePic ='';
@override
  void initState() {
    super.initState();
  getUserData();
}

getUserData()async {
  QuerySnapshot snapshot =
      await DatabaseServices(uid: FirebaseAuth.instance.currentUser!.uid)
      .getUserProfilePic(getId(widget.memberName));
  if (snapshot.docs.isNotEmpty) {
    if(!mounted)return;
    setState(() {
      email = snapshot.docs[0]['email'];
      profilePic = snapshot.docs[0]['profilePic'];
    });
  } else {
    if (kDebugMode) {
      print('doesnt exists');
    }
  }
}

  @override
  Widget build(BuildContext context) {
    return ListTile(
      // tileColor: Colors.red.shade200,
      leading: CircleAvatar(
        radius: 25,
        backgroundColor: Theme.of(context).dividerColor,
        child: (profilePic == '')
            ? Image.asset('assets/images/user.png')
            : Image.network(
              profilePic,
              fit: BoxFit.cover,
              loadingBuilder: (BuildContext context,
                  Widget child,
                  ImageChunkEvent? loadingProgress) {
                if (loadingProgress == null) return child;
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
          color: Theme.of(context).colorScheme.secondary,
        ),
      ),
      subtitle:  Text(
        email,
        textAlign: TextAlign.start,
        maxLines: 1,
        style: TextStyle(
          fontSize: 12,
          height: 1.2,
          overflow: TextOverflow.ellipsis,
          fontFamily: 'Mulish-Reg',
          color: Theme.of(context).colorScheme.tertiary,
        ),
      ),
      trailing:(widget.adminName == widget.memberName)
          ?Container(
        decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.onSurface,
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
              color: Theme.of(context).colorScheme.primary,
            ),
          ),
        ),
      )
      :const SizedBox(),
    );
  }

  String getName(String str) => str.substring(str.indexOf("_") + 1);
  String getId(String str) => str.substring(0,str.indexOf("_"));
}
