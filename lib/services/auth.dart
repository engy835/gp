import 'package:firebase_auth/firebase_auth.dart';
import 'package:gp/models/users.dart';
import 'package:gp/anthenticate/Register.dart';
import 'package:gp/services/database.dart';


class AuthService {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  //create a user obj based on FirebaseUser
Users _userFromFirebaseUser( FirebaseUser user){
  return user != null? Users(uid: user.uid) :null;

}
//auth change user stream
  Stream<Users>get user  {
  return _auth.onAuthStateChanged
     .map(_userFromFirebaseUser );
                   }
  Future signInAnon() async {
    try {
      /*
      In the newest version of firebase_auth, the class FirebaseUser was changed to User,
      and the class AuthResult was changed to UserCredentail. Therefore change your code to the following
      * */
      AuthResult result = await _auth.signInAnonymously();
      FirebaseUser user = result.user;
      return _userFromFirebaseUser(user);
    } catch (e) {
      print(e.toString());
      return null;
    }
  }

  //Register with email & password
  Future  registerWithEmailAndPassword(String email, String password, String name ,String phone) async{
  try{
    AuthResult result = await _auth.createUserWithEmailAndPassword(email: email, password: password);
    FirebaseUser user = result.user;
//create new document For user with uid
   await DatabaseService(uid: user.uid).UpdateUserDate(name , phone);
    return _userFromFirebaseUser(user);
  }catch(e){
    print(e.toString());
    return null;
  }
  }
  //sign in with email and password
  Future  signInWithEmailAndPassword(String email, String password) async {
    try {
      AuthResult result = await _auth.signInWithEmailAndPassword(
          email: email, password: password);
      FirebaseUser user = result.user;
      return _userFromFirebaseUser(user);
    } catch (e) {
      print(e.toString());
      return null;
    }
  }
  //sign out
  Future signOut()async{
  try{
    return await _auth.signOut();
  }
  catch(e){
    print(e.toString());
  return null;
  }
  }
}