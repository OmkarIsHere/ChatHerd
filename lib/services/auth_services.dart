import 'package:chat_herd/services/database_services.dart';
import 'package:firebase_auth/firebase_auth.dart';

class AuthServices{
  final FirebaseAuth firebaseAuth = FirebaseAuth.instance;

  Future registerUserWithEmailAndPassword
      (String fullName, String email, String password ) async{
    try{
      User user = (await firebaseAuth.createUserWithEmailAndPassword(email: email, password: password)).user!;

      if(user != null){
        await DatabaseServices(uid: user.uid).updateUserData(fullName, email);
        return true;
      }

    }on FirebaseAuthException catch(e){
      return e.message;
    }
  }
}