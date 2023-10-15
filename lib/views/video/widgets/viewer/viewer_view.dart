import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:healthier_carbon_pregnancy_app/views/video/constants/colors.dart';
import 'package:healthier_carbon_pregnancy_app/views/video/utils/api.dart';
import 'package:healthier_carbon_pregnancy_app/views/video/utils/spacer.dart';
import 'package:healthier_carbon_pregnancy_app/views/video/utils/toast.dart';
import 'package:healthier_carbon_pregnancy_app/views/video/widgets/common/chat/chat_view.dart';
import 'package:healthier_carbon_pregnancy_app/views/video/widgets/viewer/livestream_player.dart';
import 'package:healthier_carbon_pregnancy_app/views/video/widgets/viewer/viewer_appbar.dart';
import 'package:healthier_carbon_pregnancy_app/views/video/widgets/viewer/waiting_for_hls.dart';
import 'package:videosdk/videosdk.dart';

class ViewerView extends StatefulWidget {
  final Room meeting;
  const ViewerView({
    super.key,
    required this.meeting,
  });

  @override
  State<ViewerView> createState() => _ViewerViewState();
}

class _ViewerViewState extends State<ViewerView> {
  bool showChatSnackbar = true;

  late String hlsState;
  String? downstreamUrl;
  bool showChat = true;
  bool isEnded = false;
  bool showOverlay = true;
  int participants = 1;

  @override
  void initState() {
    super.initState();
    // Register meeting events
    hlsState = widget.meeting.hlsState;
    if (widget.meeting.hlsDownstreamUrl != null) {
      downstreamUrl = widget.meeting.hlsDownstreamUrl;
    }
    participants = widget.meeting.participants.length + 1;

    registerMeetingEvents(widget.meeting);

    subscribeToChatMessages(widget.meeting);
  }

  @override
  void setState(VoidCallback fn) {
    if (mounted) {
      super.setState(fn);
    }
  }

  @override
  Widget build(BuildContext context) {
    return OrientationBuilder(builder: (context, orientation) {
      return Stack(
        children: [
          if (downstreamUrl == null ||
              hlsState == "HLS_STARTING" ||
              hlsState == "HLS_STOPPED" ||
              isEnded)
            WaitingForHLS(isStopped: isEnded),
          Flex(
            direction: orientation == Orientation.portrait
                ? Axis.vertical
                : Axis.horizontal,
            children: [
              if (orientation == Orientation.portrait) const VerticalSpacer(40),
              if (downstreamUrl != null &&
                  (hlsState == "HLS_PLAYABLE" || hlsState == "HLS_STOPPING") &&
                  !isEnded)
                Expanded(
                  flex: orientation == Orientation.landscape ? 2 : 1,
                  child: InkWell(
                    onTap: () {
                      if (!showOverlay) {
                        setState(() {
                          showOverlay = !showOverlay;
                        });
                        hideOverlay();
                      }
                    },
                    child: LivestreamPlayer(
                      downstreamUrl: downstreamUrl!,
                      orientation: orientation,
                      showChat: showChat,
                      showOverlay: showOverlay,
                      onChatButtonClicked: () {
                        setState(() {
                          showChat = !showChat;
                        });
                      },
                      onRaiseHandButtonClicked: () {
                        widget.meeting.pubSub.publish("RAISE_HAND", "message");
                      },
                      onPlaybackEnded: () {
                        setState(() {
                          isEnded = true;
                        });
                      },
                    ),
                  ),
                ),
              if (downstreamUrl != null &&
                  (hlsState == "HLS_PLAYABLE" || hlsState == "HLS_STOPPING") &&
                  (showChat || orientation == Orientation.portrait) &&
                  !isEnded)
                Expanded(
                    flex: orientation == Orientation.landscape ? 1 : 2,
                    child: ChatView(
                      meeting: widget.meeting,
                      showClose: orientation != Orientation.portrait,
                      orientation: orientation,
                      onClose: () {
                        setState(() {
                          showChat = !showChat;
                        });
                      },
                    ))
            ],
          ),
          if (showOverlay || orientation == Orientation.portrait)
            ViewerAppBar(
              participantCount: participants,
              hlsState: hlsState,
              onLeaveButtonPressed: () {
                showDialog(
                    context: context,
                    builder: (context) {
                      return AlertDialog(
                        content: const Text("Are you sure you want to leave?"),
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(12)),
                        backgroundColor: black750,
                        actionsAlignment: MainAxisAlignment.center,
                        actions: [
                          MaterialButton(
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(12)),
                              padding: const EdgeInsets.symmetric(vertical: 12),
                              color: black600,
                              child: const Text("No",
                                  style: TextStyle(fontSize: 16)),
                              onPressed: () {
                                Navigator.pop(context);
                              }),
                          MaterialButton(
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(12)),
                              padding: const EdgeInsets.symmetric(vertical: 12),
                              color: purple,
                              child: const Text("Yes",
                                  style: TextStyle(fontSize: 16)),
                              onPressed: () {
                                widget.meeting.leave();
                              }),
                        ],
                      );
                    });
              },
            ),
        ],
      );
    });
  }

  void registerMeetingEvents(Room meeting) {
    meeting.on(Events.participantJoined, (participant) {
      setState(() {
        participants = meeting.participants.length + 1;
      });
    });
    meeting.on(Events.participantLeft, (participant) {
      setState(() {
        participants = meeting.participants.length + 1;
      });
    });
    // Called when hls is started
    meeting.on(Events.hlsStateChanged, (Map<String, dynamic> data) {
      setState(() {
        hlsState = data['status'];
      });
      if (data['status'] == "HLS_PLAYABLE") {
        setState(() {
          downstreamUrl = data['downstreamUrl'];
          isEnded = false;
          showOverlay = true;
          hideOverlay();
        });
      } else if (data['status'] == "HLS_STOPPED") {
        setState(() {
          downstreamUrl = null;
        });
      }
    });
    meeting.on(
        Events.error,
        (error) => {
              showSnackBarMessage(
                  message: "${error['name']} :: ${error['message']}",
                  context: context)
            });
  }

  void subscribeToChatMessages(Room meeting) {
    meeting.pubSub.subscribe("CHAT", (message) {
      if (message.senderId != meeting.localParticipant.id) {
        if (mounted) {
          if (showChatSnackbar) {
            showSnackBarMessage(
                message: "${message.senderName}: ${message.message}",
                context: context);
          }
        }
      }
    });
  }

  Future<bool> isHlsPlayable(String url) async {
    int response = await fetchHls(url);
    if (response == 200) {
      return true;
    }
    return false;
  }

  void hideOverlay() {
    Timer(const Duration(seconds: 4), () {
      setState(() {
        showOverlay = false;
      });
    });
  }

  @override
  void dispose() {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.landscapeLeft,
      DeviceOrientation.landscapeRight,
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);
    super.dispose();
  }
}
