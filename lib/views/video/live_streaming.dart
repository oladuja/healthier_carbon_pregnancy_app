// import 'package:flutter/material.dart';
// import 'package:flutter_webrtc/flutter_webrtc.dart';
// import 'package:healthier_carbon_pregnancy_app/views/video/signaling.dart';

// class MyHomePage extends StatefulWidget {
//   MyHomePage({Key? key}) : super(key: key);

//   @override
//   _MyHomePageState createState() => _MyHomePageState();
// }

// class _MyHomePageState extends State<MyHomePage> {
//   Signaling signaling = Signaling();
//   RTCVideoRenderer _localRenderer = RTCVideoRenderer();
//   RTCVideoRenderer _remoteRenderer = RTCVideoRenderer();
//   String? roomId;
//   TextEditingController textEditingController = TextEditingController(text: '');

//   @override
//   void initState() {
//     _localRenderer.initialize();
//     _remoteRenderer.initialize();

//     signaling.onAddRemoteStream = ((stream) {
//       _remoteRenderer.srcObject = stream;
//       setState(() {});
//     });

//     super.initState();
//   }

//   @override
//   void dispose() {
//     _localRenderer.dispose();
//     _remoteRenderer.dispose();
//     super.dispose();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: const Text("Welcome to Flutter Explained - WebRTC"),
//       ),
//       body: Column(
//         children: [
//           const SizedBox(height: 8),
//           SingleChildScrollView(
//             scrollDirection: Axis.horizontal,
//             child: Row(
//               mainAxisAlignment: MainAxisAlignment.center,
//               children: [
//                 ElevatedButton(
//                   onPressed: () {
//                     signaling.openUserMedia(_localRenderer, _remoteRenderer);
//                   },
//                   child: const Text("Open camera & microphone"),
//                 ),
//                 const SizedBox(
//                   width: 8,
//                 ),
//                 ElevatedButton(
//                   onPressed: () async {
//                     roomId = await signaling.createRoom(_remoteRenderer);
//                     textEditingController.text = roomId!;
//                     setState(() {});
//                   },
//                   child: const Text("Create room"),
//                 ),
//                 const SizedBox(
//                   width: 8,
//                 ),
//                 ElevatedButton(
//                   onPressed: () {
//                     // Add roomId
//                     signaling.joinRoom(
//                       textEditingController.text.trim(),
//                       _remoteRenderer,
//                     );
//                   },
//                   child: const Text("Join room"),
//                 ),
//                 const SizedBox(
//                   width: 8,
//                 ),
//                 ElevatedButton(
//                   onPressed: () {
//                     signaling.hangUp(_localRenderer);
//                   },
//                   child: const Text("Hangup"),
//                 )
//               ],
//             ),
//           ),
//           const SizedBox(height: 8),
//           Expanded(
//             child: Padding(
//               padding: const EdgeInsets.all(8.0),
//               child: Row(
//                 mainAxisAlignment: MainAxisAlignment.center,
//                 children: [
//                   Expanded(child: RTCVideoView(_localRenderer, mirror: true)),
//                   Expanded(child: RTCVideoView(_remoteRenderer)),
//                 ],
//               ),
//             ),
//           ),
//           Padding(
//             padding: const EdgeInsets.all(8.0),
//             child: Row(
//               mainAxisAlignment: MainAxisAlignment.center,
//               children: [
//                 const Text("Join the following Room: "),
//                 Flexible(
//                   child: TextFormField(
//                     controller: textEditingController,
//                   ),
//                 )
//               ],
//             ),
//           ),
//           const SizedBox(height: 8)
//         ],
//       ),
//     );
//   }
// }

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_webrtc/flutter_webrtc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:healthier_carbon_pregnancy_app/helper/log.dart';
import 'package:healthier_carbon_pregnancy_app/views/video/signaling.dart';

class LiveScreen extends StatefulWidget {
  LiveScreen({Key? key}) : super(key: key);

  @override
  _LiveScreenState createState() => _LiveScreenState();
}

class _LiveScreenState extends State<LiveScreen> {
  Signaling signaling = Signaling();
  RTCVideoRenderer _localRenderer = RTCVideoRenderer();
  RTCVideoRenderer _remoteRenderer = RTCVideoRenderer();
  String? roomId;
  TextEditingController textEditingController = TextEditingController(text: '');

  bool isLive = false;

  @override
  void initState() {
    _localRenderer.initialize();
    _remoteRenderer.initialize();

    signaling.onAddRemoteStream = ((stream) {
      _remoteRenderer.srcObject = stream;
      setState(() {});
    });

    signaling.openUserMedia(_localRenderer, _remoteRenderer);

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
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: SizedBox(
        width: size.width,
        height: size.height,
        child: RTCVideoView(_remoteRenderer),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          if (isLive) {
            signaling.hangUp(_localRenderer);
            Navigator.of(context).pop();
          } else {
            try {
              FirebaseFirestore firestore = FirebaseFirestore.instance;

              var documentReference =
                  await firestore.collection('roomId').get();
              var id = documentReference.docs[0].id;

              if (id.isNotEmpty) {
                signaling.joinRoom(
                  id,
                  _remoteRenderer,
                );
              } else {
                // ScaffoldMessenger.of(context).showSnackBar(
                //     SnackBar(content: Text('No Live Video For Now')));
              }
            } catch (e) {
              // Error handling
              logger.e('Error getting document: $e');
            }
          }
        },
        backgroundColor: const Color(0XFF666666),
        child: FaIcon(
          isLive ? FontAwesomeIcons.videoSlash : FontAwesomeIcons.video,
          color: Colors.white,
        ),
      ),
    );
  }
}
