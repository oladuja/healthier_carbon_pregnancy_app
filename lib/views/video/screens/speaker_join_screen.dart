import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:healthier_carbon_pregnancy_app/helper/log.dart';
import 'package:healthier_carbon_pregnancy_app/views/video/screens/ils_screen.dart';
import 'package:healthier_carbon_pregnancy_app/views/video/utils/api.dart';
import 'package:videosdk/videosdk.dart';

import '../constants/colors.dart';
import '../utils/spacer.dart';
import '../utils/toast.dart';

class SpeakerJoinScreen extends StatefulWidget {
  final bool isCreateMeeting;
  const SpeakerJoinScreen({Key? key, required this.isCreateMeeting})
      : super(key: key);

  @override
  State<SpeakerJoinScreen> createState() => _SpeakerJoinScreenState();
}

class _SpeakerJoinScreenState extends State<SpeakerJoinScreen> {
  final FirebaseFirestore firestore = FirebaseFirestore.instance;

  String _token = "";

  // Control Status
  bool isMicOn = false;
  bool isCameraOn = true;

  CustomTrack? cameraTrack;
  RTCVideoRenderer? cameraRenderer;

  TextEditingController meetingIdTextController = TextEditingController();
  TextEditingController nameTextController = TextEditingController();
  @override
  void initState() {
    initCameraPreview();
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) async {
      final token = await fetchToken(context);
      setState(() {
        _token = token;
      });
      if (widget.isCreateMeeting) {
        final meetingId = await createMeeting(token);
        setState(() {
          meetingIdTextController.value = TextEditingValue(text: meetingId);
        });
      }
    });
  }

  @override
  void dispose() {
    super.dispose();
    cameraTrack!.dispose();
    cameraRenderer!.dispose();
    meetingIdTextController.dispose();
    nameTextController.dispose();
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
        leading:  IconButton(
          icon: const Icon(Icons.arrow_back_ios),
          color: Colors.black,
          onPressed: () => Navigator.of(context).pop(),
        ),
        backgroundColor: Colors.white,
        title: Text(
          widget.isCreateMeeting ? "Create Meeting" : "Join as a speaker",
          style: const TextStyle(fontSize: 20, color: Colors.black),
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
              // Camera Preview
              SizedBox(
                height: 300,
                width: 200,
                child: Stack(
                  alignment: Alignment.topCenter,
                  children: [
                    if (cameraRenderer != null)
                      SizedBox(
                        height: 300,
                        width: 200,
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(12),
                          child: RTCVideoView(
                            cameraRenderer as RTCVideoRenderer,
                            objectFit: RTCVideoViewObjectFit
                                .RTCVideoViewObjectFitCover,
                          ),
                        ),
                      ),
                    Positioned(
                      bottom: 16,

                      // Meeting ActionBar
                      child: Center(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            // Mic Action Button
                            ElevatedButton(
                              onPressed: () => setState(
                                () => isMicOn = !isMicOn,
                              ),
                              style: ElevatedButton.styleFrom(
                                shape: const CircleBorder(),
                                padding: const EdgeInsets.all(12),
                                primary: isMicOn ? Colors.white : red,
                                onPrimary: Colors.black,
                              ),
                              child: Icon(isMicOn ? Icons.mic : Icons.mic_off,
                                  color: isMicOn ? grey : Colors.white),
                            ),
                            ElevatedButton(
                              onPressed: () {
                                if (isCameraOn) {
                                  disposeCameraPreview();
                                } else {
                                  initCameraPreview();
                                }
                                setState(() => isCameraOn = !isCameraOn);
                              },
                              style: ElevatedButton.styleFrom(
                                shape: const CircleBorder(),
                                padding: const EdgeInsets.all(12),
                                primary: isCameraOn ? Colors.white : red,
                              ),
                              child: Icon(
                                isCameraOn
                                    ? Icons.videocam
                                    : Icons.videocam_off,
                                color: isCameraOn ? grey : Colors.white,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
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
                    const VerticalSpacer(15),
                    if (widget.isCreateMeeting)
                      Container(
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(12),
                            color: black750),
                        padding: const EdgeInsets.all(16),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              "Meeting code: ${meetingIdTextController.text}",
                              style: const TextStyle(
                                  fontWeight: FontWeight.w500, fontSize: 16),
                            ),
                            GestureDetector(
                              child: const Padding(
                                padding: EdgeInsets.fromLTRB(8, 0, 0, 0),
                                child: Icon(
                                  Icons.copy,
                                  size: 16,
                                ),
                              ),
                              onTap: () {
                                Clipboard.setData(ClipboardData(
                                    text: meetingIdTextController.text));
                                showSnackBarMessage(
                                    message: "Meeting ID has been copied.",
                                    context: context);
                              },
                            ),
                          ],
                        ),
                      ),
                    if (widget.isCreateMeeting) const VerticalSpacer(16),
                    Container(
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(12),
                          color: black750),
                      child: TextField(
                        textAlign: TextAlign.center,
                        style: const TextStyle(
                          fontWeight: FontWeight.w500,
                        ),
                        controller: nameTextController,
                        decoration: const InputDecoration(
                            hintText: "Enter your name",
                            hintStyle: TextStyle(
                              color: textGray,
                            ),
                            border: InputBorder.none),
                      ),
                    ),
                    const VerticalSpacer(16),
                    if (!widget.isCreateMeeting)
                      Container(
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(12),
                            color: black750),
                        child: TextField(
                          textAlign: TextAlign.center,
                          style: const TextStyle(
                            fontWeight: FontWeight.w500,
                          ),
                          controller: meetingIdTextController,
                          decoration: const InputDecoration(
                              hintText: "Enter meeting code",
                              hintStyle: TextStyle(
                                color: textGray,
                              ),
                              border: InputBorder.none),
                        ),
                      ),
                    if (!widget.isCreateMeeting) const VerticalSpacer(16),
                    MaterialButton(
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(12)),
                        padding: const EdgeInsets.symmetric(vertical: 16),
                        color: grey,
                        child: Text(
                            widget.isCreateMeeting
                                ? "Create Meeting"
                                : "Join as a speaker",
                            style: const TextStyle(
                                fontSize: 16, color: Colors.white)),
                        onPressed: () {
                          joinMeeting();
                        }),
                  ],
                ),
              )
            ],
          ),
        ),
      )),
    );
  }

  void initCameraPreview() async {
    CustomTrack track = await VideoSDK.createCameraVideoTrack();
    RTCVideoRenderer render = RTCVideoRenderer();
    await render.initialize();
    render.setSrcObject(stream: track.mediaStream);
    setState(() {
      cameraTrack = track;
      cameraRenderer = render;
    });
  }

  void disposeCameraPreview() {
    cameraTrack?.dispose();
    setState(() {
      cameraRenderer = null;
      cameraTrack = null;
    });
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
        disposeCameraPreview();
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(
            builder: (context) => ILSScreen(
              token: _token,
              meetingId: meetingId,
              displayName: name,
              micEnabled: isMicOn,
              camEnabled: isCameraOn,
              mode: Mode.CONFERENCE,
            ),
          ),
        );
      } else {
        showSnackBarMessage(message: "Invalid Meeting ID", context: context);
      }
    }
  }
}
