import 'package:cloud_firestore/cloud_firestore.dart';

class UserService {

  final _db = FirebaseFirestore.instance;

  Future<bool> userExists(String uid) async {

    final doc = await _db
        .collection("users")
        .doc(uid)
        .get();

    return doc.exists;
  }

}