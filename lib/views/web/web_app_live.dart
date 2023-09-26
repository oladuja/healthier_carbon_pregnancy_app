import 'package:flutter/material.dart';
import 'package:flutter_webrtc/flutter_webrtc.dart';
import 'package:healthier_carbon_pregnancy_app/views/video/signaling.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class WebApp extends StatelessWidget {
  const WebApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: WebAppScreen(),
    );
  }
}

class WebAppScreen extends StatefulWidget {
  const WebAppScreen({Key? key}) : super(key: key);

  @override
  State<WebAppScreen> createState() => _WebAppScreenState();
}

class _WebAppScreenState extends State<WebAppScreen> {
  Signaling signaling = Signaling();

  RTCVideoRenderer _localRenderer = RTCVideoRenderer();

  RTCVideoRenderer _remoteRenderer = RTCVideoRenderer();

  String? roomId;

  TextEditingController textEditingController = TextEditingController(text: '');

  @override
  void initState() {
    _localRenderer.initialize();
    _remoteRenderer.initialize();

    signaling.onAddRemoteStream = ((stream) {
      _remoteRenderer.srcObject = stream;
      setState(() {});
    });

    super.initState();
  }

  @override
  void dispose() {
    _localRenderer.dispose();
    _remoteRenderer.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Go Live"),
      ),
      body: Column(
        children: [
          const SizedBox(height: 8),
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ElevatedButton(
                  onPressed: () {
                    signaling.openUserMedia(_localRenderer, _remoteRenderer);
                  },
                  child: const Text("Open camera & microphone"),
                ),
                const SizedBox(
                  width: 8,
                ),
                ElevatedButton(
                  onPressed: () async {
                    try {
                      roomId = await signaling.createRoom(_remoteRenderer);
                      // textEditingController.text = roomId!;

                      FirebaseFirestore firestore = FirebaseFirestore.instance;

                      CollectionReference roomsCollection =
                          firestore.collection('roomId');

                      DocumentReference documentReference =
                          roomsCollection.doc(roomId);
                      await documentReference.set({
                        'id': roomId,
                      });

                      // Success message
                      print('ID saved to Firestore successfully.');
                    } catch (e) {
                      // Error handling
                      print('Error saving ID to Firestore: $e');
                    }

                    setState(() {});
                  },
                  child: const Text("Create room"),
                ),
                const SizedBox(
                  width: 8,
                ),
                const SizedBox(
                  width: 8,
                ),
                ElevatedButton(
                  onPressed: () async {
                    try {
                      signaling.hangUp(_localRenderer);

                      FirebaseFirestore firestore = FirebaseFirestore.instance;

                      // Reference the collection
                      CollectionReference collectionReference =
                          firestore.collection('roomId');

                      QuerySnapshot querySnapshot =
                          await collectionReference.get();

                      for (QueryDocumentSnapshot document
                          in querySnapshot.docs) {
                        await document.reference.delete();
                      }

                      // Success message
                      print('Collection deleted from Firestore successfully.');
                    } catch (e) {}
                  },
                  child: const Text("End Session"),
                )
              ],
            ),
          ),
          const SizedBox(height: 8),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child:
                  RTCVideoView(_localRenderer, mirror: true),
            ),
          ),
        ],
      ),
    );
  }
}
