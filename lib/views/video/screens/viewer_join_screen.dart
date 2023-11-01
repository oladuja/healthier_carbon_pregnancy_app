import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:healthier_carbon_pregnancy_app/helper/log.dart';
import 'package:healthier_carbon_pregnancy_app/views/video/screens/ils_screen.dart';
import 'package:healthier_carbon_pregnancy_app/views/video/utils/api.dart';
import 'package:videosdk/videosdk.dart';

import '../constants/colors.dart';
import '../utils/spacer.dart';
import '../utils/toast.dart';

class ViewerJoinScreen extends StatefulWidget {
  const ViewerJoinScreen({Key? key}) : super(key: key);

  @override
  State<ViewerJoinScreen> createState() => _ViewerJoinScreenState();
}

class _ViewerJoinScreenState extends State<ViewerJoinScreen> {
  final FirebaseFirestore firestore = FirebaseFirestore.instance;

  String _token = "";
  TextEditingController meetingIdTextController = TextEditingController();
  TextEditingController nameTextController = TextEditingController();

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) async {
      final token = await fetchToken(context);
      setState(() {
        _token = token;
      });
    });
  }

  @override
  setState(fn) {
    if (mounted) {
      super.setState(fn);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.grey,
        title: const Text(
          "Join as a viewer",
          style: TextStyle(
            fontSize: 20,
            color: Colors.white,
          ),
          textAlign: TextAlign.center,
        ),
      ),
      body: SafeArea(
          child: SingleChildScrollView(
        child: ConstrainedBox(
          constraints:
              BoxConstraints(maxHeight: MediaQuery.of(context).size.height),
          child: Column(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Padding(
                padding: const EdgeInsets.all(36.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    FutureBuilder(
                      future: firestore.collection('roomId').get(),
                      builder: (context, snapshot) {
                        if (snapshot.connectionState ==
                            ConnectionState.waiting) {
                          return const Center(
                            child: Text(
                              'No meeting for now',
                              style: TextStyle(
                                color: Colors.black,
                                fontSize: 16,
                              ),
                            ),
                          );
                        }
                        if (snapshot.data!.docs.isEmpty) {
                          return const Center(
                            child: Text(
                              'No meeting for now',
                              style: TextStyle(
                                color: Colors.black,
                                fontSize: 16,
                              ),
                            ),
                          );
                        }
                        logger.i(snapshot.data!.docs[0]['id']);
                        return Center(
                          child: Text(
                            'Meeting code: ${snapshot.data!.docs[0]['id']}',
                            style: const TextStyle(
                              color: Colors.black,
                              fontSize: 16,
                            ),
                          ),
                        );
                      },
                    ),
                    const VerticalSpacer(8),
                    Container(
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(12),
                          color: black750),
                      child: TextField(
                        textAlign: TextAlign.center,
                        style: const TextStyle(
                          fontWeight: FontWeight.w500,
                          color: Colors.white
                        ),
                        controller: nameTextController,
                        decoration: const InputDecoration(
                          hintText: "Enter your name",
                          hintStyle: TextStyle(
                            color: Colors.white,
                          ),
                          border: InputBorder.none,
                        ),
                      ),
                    ),
                    const VerticalSpacer(16),
                    Container(
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(12),
                          color: black750),
                      child: TextField(
                        textAlign: TextAlign.center,
                        style: const TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.w500,
                        ),
                        controller: meetingIdTextController,
                        decoration: const InputDecoration(
                          hintText: "Enter meeting code",
                          hintStyle: TextStyle(
                            color: Colors.white,
                          ),
                          border: InputBorder.none,
                        ),
                      ),
                    ),
                    const VerticalSpacer(16),
                    MaterialButton(
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(12)),
                        padding: const EdgeInsets.symmetric(vertical: 16),
                        color: Colors.grey,
                        child: const Text("Join as a viewer",
                            style: TextStyle(fontSize: 16, color: Colors.white)),
                        onPressed: () => {joinMeeting()}),
                  ],
                ),
              )
            ],
          ),
        ),
      )),
    );
  }

  Future<void> joinMeeting() async {
    if (meetingIdTextController.text.isEmpty) {
      showSnackBarMessage(
          message: "Please enter Valid Meeting ID", context: context);
      return;
    }

    if (nameTextController.text.isEmpty) {
      showSnackBarMessage(message: "Please enter Name", context: context);
      return;
    }
    String meetingId = meetingIdTextController.text;
    String name = nameTextController.text;
    var validMeeting = await validateMeeting(_token, meetingId);
    if (context.mounted) {
      if (validMeeting) {
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(
            builder: (context) => ILSScreen(
              token: _token,
              meetingId: meetingId,
              displayName: name,
              micEnabled: false,
              camEnabled: false,
              mode: Mode.VIEWER,
            ),
          ),
        );
      } else {
        showSnackBarMessage(message: "Invalid Meeting ID", context: context);
      }
    }
  }

  @override
  void dispose() {
    meetingIdTextController.dispose();
    nameTextController.dispose();
    super.dispose();
  }
}
