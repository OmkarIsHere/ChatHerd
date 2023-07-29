import 'package:chat_herd/helper/helper_function.dart';
import 'package:chat_herd/services/database_services.dart';
import 'package:firebase_auth/firebase_auth.dart';

class AuthServices {
  final FirebaseAuth firebaseAuth = FirebaseAuth.instance;

  Future registerUserWithEmailAndPassword(
      String fullName, String email, String password) async {
    try {
      User user = (await firebaseAuth.createUserWithEmailAndPassword(
              email: email, password: password))
          .user!;

      await DatabaseServices(uid: user.uid).saveUserData(fullName, email);
      return true;
    } on FirebaseAuthException catch (e) {
      return e.message;
    }
  }

  Future loginUserWithEmailAndPassword(String email, String password) async {
    // print('loginUserWithEmailAndPassword $email-$password');
    try {
      // User user = (await firebaseAuth.signInWithEmailAndPassword(email: email, password: password)).user!;
      UserCredential userCredential = await firebaseAuth.signInWithEmailAndPassword(email: email, password: password);//).user!;
      String idToken = await userCredential.user!.getIdToken();
      // print('user: $user');
      // print('usercredentials: $userCredential');
      // print('idToken: $idToken');
      // if (idToken != null) {
        if (idToken.isNotEmpty){
        return true;
      } else {
        return false;
      }
    } on FirebaseAuthException catch (e) {
      return e.message;
    }
  }

  Future signOut() async {
    try {
      await HelperFunction.saveUserLoginStatus(false);
      await HelperFunction.saveUserNameSF('');
      await HelperFunction.saveUserEmailSF('');
      firebaseAuth.signOut();
    } catch (e) {
      return null;
    }
  }
}
