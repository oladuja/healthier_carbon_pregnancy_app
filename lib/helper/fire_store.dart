import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:healthier_carbon_pregnancy_app/main.dart';

class FireStore {
  FirebaseFirestore store = FirebaseFirestore.instance
    ..settings = const Settings(persistenceEnabled: true);

  Future<void> addUserToDatabase(Map<String, dynamic> user) async {
    try {
      await store.collection('users').doc(auth.currentUser!.uid).set(user);
    } catch (e) {
      rethrow;
    }
  }

  Future<DocumentSnapshot<Map<String, dynamic>>> getUser(String id) async {
    try {
      return store.collection('users').doc(id).get();
    } catch (e) {
      rethrow;
    }
  }
}
