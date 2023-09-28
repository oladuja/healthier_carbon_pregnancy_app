import 'package:flutter/material.dart';
import 'api_call.dart';
import 'ils_screen.dart';
import 'package:videosdk/videosdk.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class JoinScreen extends StatelessWidget {
  final _meetingIdController = TextEditingController();

  JoinScreen({super.key});

  //Creates new Meeting Id and joins it in CONFERNCE mode.
  void onCreateButtonPressed(BuildContext context) async {
    // call api to create meeting and navigate to ILSScreen with meetingId,token and mode
    await createMeeting().then((meetingId) {
      if (!context.mounted) return;
      Navigator.of(context).push(
        MaterialPageRoute(
          builder: (context) => ILSScreen(
            meetingId: meetingId,
            token: token,
            mode: Mode.CONFERENCE,
          ),
        ),
      );
    });
  }

  //Join the provided meeting with given Mode and meetingId
  void onJoinButtonPressed(BuildContext context, Mode mode) {
    // check meeting id is not null or invaild
    // if meeting id is vaild then navigate to ILSScreen with meetingId, token and mode
    String meetingId = _meetingIdController.text;
    var re = RegExp("\\w{4}\\-\\w{4}\\-\\w{4}");
    if (meetingId.isNotEmpty && re.hasMatch(meetingId)) {
      _meetingIdController.clear();
      Navigator.of(context).push(
        MaterialPageRoute(
          builder: (context) => ILSScreen(
            meetingId: meetingId,
            token: token,
            mode: mode,
          ),
        ),
      );
    } else {
      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
        content: Text("Please enter valid meeting id"),
      ));
    }
  }

  Future<String> loadId() async {
    FirebaseFirestore firestore = FirebaseFirestore.instance;
    var documentReference = await firestore.collection('roomId').get();
    var id = documentReference.docs[0].id;
    return id;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios),
          onPressed: () => Navigator.of(context).pop(),
        ),
        title: const Text(
          'Live Session',
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: const Color.fromARGB(116, 102, 102, 102),
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(12.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              FutureBuilder(
                future: loadId(),
                builder: (_, snapShot) {
                  if (snapShot.connectionState == ConnectionState.waiting) {
                    return const Text('loading');
                  }
                  return Text(snapShot.hasData
                      ? 'Live Meeting ID: ${snapShot.data}'
                      : 'No Live Meeting, Come Back Later');
                },
              ),
              const SizedBox(height: 40),
              TextField(
                style: const TextStyle(color: Colors.black),
                decoration: const InputDecoration(
                  hintText: 'Enter Meeting Id',
                  border: OutlineInputBorder(),
                  hintStyle: TextStyle(color: Colors.black),
                ),
                controller: _meetingIdController,
              ),
              ElevatedButton(
                onPressed: () => onJoinButtonPressed(context, Mode.VIEWER),
                child: const Text('Join Meeting as Viewer'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
