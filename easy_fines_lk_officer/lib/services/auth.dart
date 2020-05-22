import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:easy_fines_lk_officer/services/database.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:easy_fines_lk_officer/models/user.dart';
//import 'package:firebase_database/firebase_database.dart';

class AuthService {
  //final CollectionReference userr = Firestore.instance.collection('Users');
  final FirebaseAuth _auth = FirebaseAuth.instance;

//create user object based on firebaseuser

  User _userFromFirebaseUser(FirebaseUser user) {
    return user != null ? User(uid: user.uid) : null;
  }

//auth change user stream
  Stream<User> get user {
    return _auth.onAuthStateChanged
        //.map((FirebaseUser user)=> _userFromFirebaseUser(user));
        .map(_userFromFirebaseUser);
  }

//sign in anonymous
  Future signInAnony() async {
    try {
      AuthResult result = await _auth.signInAnonymously();
      FirebaseUser user = result.user;
      return _userFromFirebaseUser(user);
    } catch (e) {
      print(e.toString());
      return null;
    }
  }

//sign in with email and password
  Future signInWithEmailAndPass(String email, String password) async {
    try {
      AuthResult result = await _auth.signInWithEmailAndPassword(
          email: email, password: password);
      FirebaseUser user = result.user;
      return user;
    } catch (e) {
      print(e.toString());
      return null;
    }
  }

//register with email and password
  Future registerWithEmailAndPass(String email, String password) async {
    try {
      AuthResult result = await _auth.createUserWithEmailAndPassword(
          email: email, password: password);
      FirebaseUser user = result.user;
      //await userr.document(user.uid).setData({"name": null});
      // create a new document for the user with the uid
      await DatabaseService(uid: user.uid).updateUserData(null,null, null);
      return _userFromFirebaseUser(user);
    } catch (e) {
      print(e.toString());
      return null;
    }
  }

//sign out
  Future signOut() async {
    try {
      return await _auth.signOut();
    } catch (e) {
      print(e.toString());
      return null;
    }
  }
}
