import 'package:cloud_firestore/cloud_firestore.dart';

class FirestoreService {
  final CollectionReference users =
      FirebaseFirestore.instance.collection('users');

  final CollectionReference reports =
      FirebaseFirestore.instance.collection('reports');

  Future<void> createUser({
    required String uid,
    required String firstName,
    required String lastName,
    required String email,
    required String contactNumber,
  }) async {
    await users.add({
      'uid': uid,
      'firstName': firstName,
      'lastName': lastName,
      'email': email,
      'contactNumber': contactNumber,
    });
  }
}