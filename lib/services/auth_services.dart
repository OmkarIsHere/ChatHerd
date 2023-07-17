import 'package:chat_herd/helper/helper_function.dart';
import 'package:chat_herd/services/database_services.dart';
import 'package:firebase_auth/firebase_auth.dart';

class AuthServices{
  final FirebaseAuth firebaseAuth = FirebaseAuth.instance;

  Future registerUserWithEmailAndPassword
      (String fullName, String email, String password ) async{
    try{
      User user = (await firebaseAuth.createUserWithEmailAndPassword(email: email, password: password)).user!;

      await DatabaseServices(uid: user.uid).saveUserData(fullName, email);
      return true;

    }on FirebaseAuthException catch(e){
      return e.message;
    }
  }

  Future loginUserWithEmailAndPassword
      (String email, String password ) async{
    try{
      UserCredential userCredential = await firebaseAuth.signInWithEmailAndPassword(email: email, password: password);//).user!;
      String idToken = await userCredential.user!.getIdToken();


      if(idToken.isNotEmpty){
        // print('login true');
        return true;
      }else{
        // print('login false');
        return false;
      }

    }on FirebaseAuthException catch(e){
      return e.message;
    }
  }

  Future signOut() async{
    try{
      await HelperFunction.saveUserLoginStatus(false);
      await HelperFunction.saveUserNameSF('');
      await HelperFunction.saveUserEmailSF('');
      firebaseAuth.signOut();
    }catch(e){
      return null;
    }
  }

}