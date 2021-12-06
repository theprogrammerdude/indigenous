import 'package:cloud_firestore/cloud_firestore.dart';

class DbMethods {
  final FirebaseFirestore _db = FirebaseFirestore.instance;

  Future addUser(String firstName, String lastName, String username,
      String email, String uid) {
    Map<String, dynamic> userData = {
      'firstName': firstName,
      'lastName': lastName,
      'username': username,
      'email': email,
      'uid': uid,
      'job': '',
      'about': '',
      'location': '',
      'createdAt': DateTime.now().millisecondsSinceEpoch
    };

    return _db.doc('users/$uid').set(userData);
  }

  Stream<DocumentSnapshot> getUserData(String uid) {
    return _db.doc('users/$uid').snapshots();
  }

  Future updateAbout(String about, String uid) {
    return _db.doc('users/$uid').update({'about': about});
  }
}
