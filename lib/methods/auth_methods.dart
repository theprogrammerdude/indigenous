import 'package:firebase_auth/firebase_auth.dart';

class AuthMethods {
  final FirebaseAuth _auth = FirebaseAuth.instance;

  Future<UserCredential> createAccount(String email, String password) {
    return _auth.createUserWithEmailAndPassword(
        email: email, password: password);
  }

  Future<UserCredential> signin(String email, String password) {
    return _auth.signInWithEmailAndPassword(email: email, password: password);
  }

  Future signout() {
    return _auth.signOut();
  }

  User? currentUser() {
    return _auth.currentUser;
  }
}
