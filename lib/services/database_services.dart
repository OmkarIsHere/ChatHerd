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
      "group":[],
      "profilePic": "",
      "uid": uid,
    });
  }

  Future getUserData(String email)async{
    QuerySnapshot snapshot = await userCollection.where('email', isEqualTo:email ).get();
    return snapshot;
  }
}