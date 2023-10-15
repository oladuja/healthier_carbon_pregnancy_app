import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:healthier_carbon_pregnancy_app/views/video/constants/colors.dart';
import 'package:healthier_carbon_pregnancy_app/views/video/utils/toast.dart';
import 'package:healthier_carbon_pregnancy_app/views/video/widgets/common/chat/chat_view.dart';
import 'package:healthier_carbon_pregnancy_app/views/video/widgets/speaker/grid/participant_grid.dart';
import 'package:healthier_carbon_pregnancy_app/views/video/widgets/speaker/screenshare_view.dart';
import 'package:healthier_carbon_pregnancy_app/views/video/widgets/speaker/speaker_action_bar.dart';
import 'package:healthier_carbon_pregnancy_app/views/video/widgets/speaker/speaker_appbar.dart';
import 'package:videosdk/videosdk.dart';

class SpeakerView extends StatefulWidget {
  final Room meeting;
  final String token;
  const SpeakerView({super.key, required this.meeting, required this.token});

  @override
  State<SpeakerView> createState() => _SpeakerViewState();
}

class _SpeakerViewState extends State<SpeakerView> {
  bool showChatSnackbar = true;

  // Streams
  Stream? shareStream;
  Stream? videoStream;
  Stream? audioStream;
  Stream? remoteParticipantShareStream;

  bool fullScreen = false;

  @override
  void initState() {
    super.initState();
    // Register meeting events
    registerMeetingEvents(widget.meeting);
    subscribeToChatMessages(widget.meeting);
  }

  @override
  void setState(fn) {
    if (mounted) {
      super.setState(fn);
    }
  }

  @override
  Widget build(BuildContext context) {
    final statusbarHeight = MediaQuery.of(context).padding.top;

    return Scaffold(
      backgroundColor: primaryColor,
      body: Column(
        mainAxisSize: MainAxisSize.max,
        children: [
          SpeakerAppBar(
            meeting: widget.meeting,
            token: widget.token,
            isFullScreen: fullScreen,
          ),
          Expanded(
            child: GestureDetector(
                onDoubleTap: () => {
                      setState(() {
                        fullScreen = !fullScreen;
                      })
                    },
                child: OrientationBuilder(builder: (context, orientation) {
                  return Flex(
                    direction: orientation == Orientation.portrait
                        ? Axis.vertical
                        : Axis.horizontal,
                    children: [
                      ScreenShareView(meeting: widget.meeting),
                      Flexible(
                          child: ParticipantGrid(
                              meeting: widget.meeting,
                              orientation: orientation))
                    ],
                  );
                })),
          ),
          AnimatedCrossFade(
            duration: const Duration(milliseconds: 300),
            crossFadeState: !fullScreen
                ? CrossFadeState.showFirst
                : CrossFadeState.showSecond,
            secondChild: const SizedBox.shrink(),
            firstChild: SpeakerActionBar(
              id: widget.meeting.id,
              isMicEnabled: audioStream != null,
              isCamEnabled: videoStream != null,
              isScreenShareEnabled: shareStream != null,
              // Called when Call End button is pressed
              onCallEndButtonPressed: () {
                widget.meeting.end();
              },

              onCallLeaveButtonPressed: () {
                widget.meeting.leave();
              },
              // Called when mic button is pressed
              onMicButtonPressed: () {
                if (audioStream != null) {
                  widget.meeting.muteMic();
                } else {
                  widget.meeting.unmuteMic();
                }
              },
              // Called when camera button is pressed
              onCameraButtonPressed: () {
                if (videoStream != null) {
                  widget.meeting.disableCam();
                } else {
                  widget.meeting.enableCam();
                }
              },

              onSwitchMicButtonPressed: (details) async {
                List<MediaDeviceInfo> outptuDevice =
                    widget.meeting.getAudioOutputDevices();
                double bottomMargin = (70.0 * outptuDevice.length);
                final screenSize = MediaQuery.of(context).size;
                await showMenu(
                  context: context,
                  color: black700,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12)),
                  position: RelativeRect.fromLTRB(
                    screenSize.width - details.globalPosition.dx,
                    details.globalPosition.dy - bottomMargin,
                    details.globalPosition.dx + 50,
                    (bottomMargin),
                  ),
                  items: outptuDevice.map((e) {
                    return PopupMenuItem(value: e, child: Text(e.label));
                  }).toList(),
                  elevation: 8.0,
                ).then((value) {
                  if (value != null) {
                    widget.meeting.switchAudioDevice(value);
                  }
                });
              },

              onSwitchCameraButtonPressed: (details) async {
                List<MediaDeviceInfo> outptuDevice =
                    widget.meeting.getCameras();
                double bottomMargin = (70.0 * outptuDevice.length);
                final screenSize = MediaQuery.of(context).size;
                await showMenu(
                  context: context,
                  color: black700,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12)),
                  position: RelativeRect.fromLTRB(
                    screenSize.width - details.globalPosition.dx,
                    details.globalPosition.dy - bottomMargin,
                    details.globalPosition.dx,
                    (bottomMargin),
                  ),
                  items: outptuDevice.map((e) {
                    return PopupMenuItem(value: e, child: Text(e.label));
                  }).toList(),
                  elevation: 8.0,
                ).then((value) {
                  if (value != null) {
                    widget.meeting.changeCam(value.deviceId);
                  }
                });
              },

              onChatButtonPressed: () {
                setState(() {
                  showChatSnackbar = false;
                });
                showModalBottomSheet(
                  context: context,
                  constraints: BoxConstraints(
                      maxHeight: MediaQuery.of(context).size.height -
                          statusbarHeight -
                          32),
                  isScrollControlled: true,
                  builder: (context) => ChatView(
                    key: const Key("ChatScreen"),
                    meeting: widget.meeting,
                    showClose: true,
                    orientation: Orientation.portrait,
                    onClose: () {
                      Navigator.pop(context);
                    },
                  ),
                ).whenComplete(() => setState(() {
                      showChatSnackbar = true;
                    }));
              },

              // Called when more options button is pressed
              onScreenShareButtonPressed: () {
                if (remoteParticipantShareStream == null) {
                  if (shareStream == null) {
                    widget.meeting.enableScreenShare();
                  } else {
                    widget.meeting.disableScreenShare();
                  }
                } else {
                  showSnackBarMessage(
                      message: "Someone is already presenting",
                      context: context);
                }
              },
            ),
          ),
        ],
      ),
    );
  }

  void registerMeetingEvents(Room meeting) {
    // Called when stream is enabled
    meeting.localParticipant.on(Events.streamEnabled, (Stream stream) {
      if (stream.kind == 'video') {
        setState(() {
          videoStream = stream;
        });
      } else if (stream.kind == 'audio') {
        setState(() {
          audioStream = stream;
        });
      } else if (stream.kind == 'share') {
        setState(() {
          shareStream = stream;
        });
      }
    });

    // Called when stream is disabled
    meeting.localParticipant.on(Events.streamDisabled, (Stream stream) {
      if (stream.kind == 'video' && videoStream?.id == stream.id) {
        setState(() {
          videoStream = null;
        });
      } else if (stream.kind == 'audio' && audioStream?.id == stream.id) {
        setState(() {
          audioStream = null;
        });
      } else if (stream.kind == 'share' && shareStream?.id == stream.id) {
        setState(() {
          shareStream = null;
        });
      }
    });

    // Called when presenter is changed
    meeting.on(Events.presenterChanged, (activePresenterId) {
      Participant? activePresenterParticipant =
          meeting.participants[activePresenterId];

      // Get Share Stream
      Stream? stream = activePresenterParticipant?.streams.values
          .singleWhere((e) => e.kind == "share");

      setState(() => remoteParticipantShareStream = stream);
    });

    meeting.on(
        Events.error,
        (error) => {
              if (mounted)
                {
                  showSnackBarMessage(
                      message: "${error['name']} :: ${error['message']}",
                      context: context)
                }
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

    meeting.pubSub.subscribe("RAISE_HAND", (message) {
      if (message.senderId != meeting.localParticipant.id) {
        if (mounted) {
          if (showChatSnackbar) {
            showSnackBarMessage(
                icon: SvgPicture.asset(
                  "assets/ic_hand.svg",
                  color: Colors.black,
                ),
                message: "${message.senderName} raised hand ",
                context: context);
          }
        }
      }
    });
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
  }
}
