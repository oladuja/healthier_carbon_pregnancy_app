import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:healthier_carbon_pregnancy_app/helper/log.dart';
import 'package:healthier_carbon_pregnancy_app/main.dart';
import 'package:healthier_carbon_pregnancy_app/models/msg.dart';

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

  Future<void> sendMessage(String message) async {
    try {
      await store
          .collection('chats')
          .doc('admin')
          .collection('message-sent')
          .doc(auth.currentUser!.uid)
          .set({
        'timeOfLastMessage': Timestamp.now(),
        'message': message,
      });

      await store
          .collection('chats')
          .doc('admin')
          .collection('message-sent')
          .doc(auth.currentUser!.uid)
          .collection('messages')
          .add(
            Message(
              isSender: auth.currentUser!.uid,
              message: message,
              timestamp: Timestamp.now(),
            ).toJson(),
          );
      await store
          .collection('chats')
          .doc(auth.currentUser!.uid)
          .collection('message-sent')
          .doc('admin')
          .set({
        'timeOfLastMessage': Timestamp.now(),
        'message': message,
      });

      await store
          .collection('chats')
          .doc(auth.currentUser!.uid)
          .collection('message-sent')
          .doc('admin')
          .collection('messages')
          .add(
            Message(
              isSender: auth.currentUser!.uid,
              message: message,
              timestamp: Timestamp.now(),
            ).toJson(),
          );
    } catch (e) {
      logger.e(e);
      rethrow;
    }
  }
}
