import 'package:cloud_firestore/cloud_firestore.dart';

class DatabaseServices{
  final String? uid;
  DatabaseServices({this.uid});

  final CollectionReference userCollection = FirebaseFirestore.instance.collection("users");
  final CollectionReference groupCollection = FirebaseFirestore.instance.collection("groups");

  Future saveUserData(String fullName, String email)async{
    return await userCollection.doc(uid).set({
      "fullName": fullName,
      "email":email,
      "groups":[],
      "profilePic": "",
      "uid": uid,
    });
  }

  Future getUserData(String email)async{
    QuerySnapshot snapshot = await userCollection.where('email', isEqualTo:email ).get();
    return snapshot;
  }

  Future getUserProfilePic(String userId)async{
    return await userCollection.where('uid', isEqualTo:userId).get();
  }
  Future getGroupData(String groupId)async{
    return await groupCollection.where('groupId', isEqualTo:groupId).get();
  }

  getUserGroups() async {
    return userCollection.doc(uid).snapshots();
  }

  Future createGroup(String userName, String id, String groupName)async{
    DocumentReference groupDocumentReference = await groupCollection.add({
      'groupName':groupName,
      'groupIcon':'',
      'admin': '${id}_$userName',
      'members': [],
      'groupId': '',
      'recentMessage': '',
      'recentMessageSender':'',
    });

  await groupDocumentReference.update({
    'members': FieldValue.arrayUnion(['${uid}_$userName']),
    'groupId': groupDocumentReference.id,
  });

  DocumentReference userDocumentReference = userCollection.doc(uid);
  return await userDocumentReference.update({
      'groups': FieldValue.arrayUnion(["${groupDocumentReference.id}_$groupName"])
    });

  }

  getChats(String groupId)async{
    return groupCollection.doc(groupId).collection('message').orderBy('time', descending: true).snapshots();
    }

  Future getGroupAdmin(String groupId)async{
    DocumentReference documentReference = groupCollection.doc(groupId);
    DocumentSnapshot documentSnapshot = await documentReference.get();
    return documentSnapshot['admin'];
  }

  getGroupMembers(String groupId)async{
    return groupCollection.doc(groupId).snapshots();
  }

  getSearchResult(String groupName){
    return groupCollection.where('groupName',isEqualTo:groupName).get();
  }

  Future<bool>isUserJoined(String groupName, String groupId, String userName)async{
    DocumentReference userDocumentReference = userCollection.doc(uid);
    DocumentSnapshot documentSnapshot = await userDocumentReference.get();
    List<dynamic>groups=await documentSnapshot['groups'];
    if(groups.contains("${groupId}_$groupName")){
      return true;
    }else{
      return false;
    }
  }

  Future joinGroup(String groupName, String groupId, String userName)async{
    DocumentReference userDocumentReference = userCollection.doc(uid);
    DocumentReference groupDocumentReference = groupCollection.doc(groupId);

    await userDocumentReference.update({'groups':FieldValue.arrayUnion(['${groupId}_$groupName'])});
    await groupDocumentReference.update({'members':FieldValue.arrayUnion(['${uid}_$userName'])});
  }

  Future exitGroup(String groupName, String groupId, String userName)async{
    DocumentReference userDocumentReference = userCollection.doc(uid);
    DocumentReference groupDocumentReference = groupCollection.doc(groupId);

    await userDocumentReference.update({'groups':FieldValue.arrayRemove(['${groupId}_$groupName'])});
    await groupDocumentReference.update({'members':FieldValue.arrayRemove(['${uid}_$userName'])});
  }

  sendMessage(String groupId, Map<String, dynamic>chatMessage)async{
    groupCollection.doc(groupId).collection('message').add(chatMessage);
    groupCollection.doc(groupId).update({
      'recentMessage':chatMessage['message'],
      'recentMessageSender':chatMessage['sender'],
      'recentMessageTime':chatMessage['time'].toString(),
    });
  }

  updateUserProfilePic(String img)async{
    userCollection.doc(uid).update({'profilePic':img});
  }

}