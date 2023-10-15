import 'package:cloud_firestore/cloud_firestore.dart';

Future<void> deleteId(room) async {
  try {
    FirebaseFirestore firestore = FirebaseFirestore.instance;
    CollectionReference collectionReference = firestore.collection('roomId');
    QuerySnapshot querySnapshot = await collectionReference.get();
    for (QueryDocumentSnapshot document in querySnapshot.docs) {
      await document.reference.delete();
    }
    print('Collection deleted from Firestore successfully.');
  } catch (e) {
    print(e);
  }
}

Future<void> sendIdToFirebase(String id) async {
  FirebaseFirestore firestore = FirebaseFirestore.instance;
  CollectionReference roomsCollection = firestore.collection('roomId');
  DocumentReference documentReference = roomsCollection.doc(id);
  await documentReference.set({
    'id': id,
  });
  // Success message
  print('ID saved to Firestore successfully.');
}
