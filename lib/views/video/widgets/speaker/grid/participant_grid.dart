import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:healthier_carbon_pregnancy_app/views/video/widgets/speaker/grid/participant_grid_tile.dart';
import 'package:videosdk/videosdk.dart';

class ParticipantGrid extends StatefulWidget {
  final Room meeting;
  final Orientation orientation;
  const ParticipantGrid(
      {Key? key, required this.meeting, required this.orientation})
      : super(key: key);

  @override
  State<ParticipantGrid> createState() => _ParticipantGridState();
}

class _ParticipantGridState extends State<ParticipantGrid> {
  late Participant localParticipant;
  String? activeSpeakerId;
  String? presenterId;
  int numberofColumns = 1;
  int numberOfMaxOnScreenParticipants = 6;
  String quality = "high";

  Map<String, Participant> participants = {};
  Map<String, Participant> onScreenParticipants = {};

  @override
  void initState() {
    localParticipant = widget.meeting.localParticipant;
    participants.putIfAbsent(localParticipant.id, () => localParticipant);
    participants.addAll(widget.meeting.participants);
    presenterId = widget.meeting.activePresenterId;
    numberOfMaxOnScreenParticipants = presenterId != null ? 2 : 6;
    updateOnScreenParticipants();
    // Setting meeting event listeners
    setMeetingListeners(widget.meeting);

    super.initState();
  }

  @override
  void setState(fn) {
    if (mounted) {
      super.setState(fn);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Flex(
      direction: widget.orientation == Orientation.portrait
          ? Axis.vertical
          : Axis.horizontal,
      children: [
        for (int i = 0;
            i < (onScreenParticipants.length / numberofColumns).ceil();
            i++)
          Flexible(
              child: Flex(
            direction: widget.orientation == Orientation.portrait
                ? Axis.horizontal
                : numberofColumns == 1
                    ? Axis.horizontal
                    : Axis.vertical,
            children: [
              for (int j = 0;
                  j <
                      onScreenParticipants.values
                          .toList()
                          .sublist(
                              i * numberofColumns,
                              (i + 1) * numberofColumns >
                                      onScreenParticipants.length
                                  ? onScreenParticipants.length
                                  : (i + 1) * numberofColumns)
                          .length;
                  j++)
                Flexible(
                  child: Padding(
                    padding: const EdgeInsets.all(4.0),
                    child: ParticipantGridTile(
                        key: Key(onScreenParticipants.values
                            .toList()
                            .sublist(
                                i * numberofColumns,
                                (i + 1) * numberofColumns >
                                        onScreenParticipants.length
                                    ? onScreenParticipants.length
                                    : (i + 1) * numberofColumns)
                            .elementAt(j)
                            .id),
                        participant: onScreenParticipants.values
                            .toList()
                            .sublist(
                                i * numberofColumns,
                                (i + 1) * numberofColumns >
                                        onScreenParticipants.length
                                    ? onScreenParticipants.length
                                    : (i + 1) * numberofColumns)
                            .elementAt(j),
                        activeSpeakerId: activeSpeakerId,
                        quality: quality),
                  ),
                )
            ],
          )),
      ],
    );
  }

  void setMeetingListeners(Room meeting) {
    // Called when participant joined meeting
    meeting.on(
      Events.participantJoined,
      (Participant participant) {
        final newParticipants = participants;
        newParticipants[participant.id] = participant;
        setState(() {
          participants = newParticipants;
          updateOnScreenParticipants();
        });
      },
    );

    // Called when participant left meeting
    meeting.on(
      Events.participantLeft,
      (participantId) {
        final newParticipants = participants;

        newParticipants.remove(participantId);
        setState(() {
          participants = newParticipants;
          updateOnScreenParticipants();
        });
      },
    );

    meeting.on(
      Events.speakerChanged,
      (activeSpeakerId) {
        setState(() {
          activeSpeakerId = activeSpeakerId;
          updateOnScreenParticipants();
        });
      },
    );

    meeting.on(
      Events.participantModeChanged,
      (data) {
        Map<String, Participant> participants = {};
        Participant localParticipant = widget.meeting.localParticipant;
        participants.putIfAbsent(localParticipant.id, () => localParticipant);
        participants.addAll(meeting.participants);
        // log("List Mode Change mode:: ${_participants[data['participantId']]?.mode.name}");

        setState(() {
          localParticipant = localParticipant;
          participants = participants;
          updateOnScreenParticipants();
        });
      },
    );

    meeting.on(Events.presenterChanged, (presenterId) {
      setState(() {
        presenterId = presenterId;
        numberOfMaxOnScreenParticipants = presenterId != null ? 2 : 6;
        updateOnScreenParticipants();
      });
    });

    meeting.localParticipant.on(Events.streamEnabled, (Stream stream) {
      if (stream.kind == "share") {
        setState(() {
          numberOfMaxOnScreenParticipants = 2;
          updateOnScreenParticipants();
        });
      }
    });
    meeting.localParticipant.on(Events.streamDisabled, (Stream stream) {
      if (stream.kind == "share") {
        setState(() {
          numberOfMaxOnScreenParticipants = 6;
          updateOnScreenParticipants();
        });
      }
    });
  }

  updateOnScreenParticipants() {
    Map<String, Participant> newScreenParticipants = <String, Participant>{};
    List<Participant> conferenceParticipants = participants.values
        .where((element) => element.mode == Mode.CONFERENCE)
        .toList();

    conferenceParticipants
        .sublist(
            0,
            conferenceParticipants.length > numberOfMaxOnScreenParticipants
                ? numberOfMaxOnScreenParticipants
                : conferenceParticipants.length)
        .forEach((participant) {
      newScreenParticipants.putIfAbsent(participant.id, () => participant);
    });
    if (!newScreenParticipants.containsKey(activeSpeakerId) &&
        activeSpeakerId != null) {
      newScreenParticipants.remove(newScreenParticipants.keys.last);
      newScreenParticipants.putIfAbsent(
          activeSpeakerId!,
          () => participants.values
              .firstWhere((element) => element.id == activeSpeakerId));
    }
    if (!listEquals(newScreenParticipants.keys.toList(),
        onScreenParticipants.keys.toList())) {
      setState(() {
        onScreenParticipants = newScreenParticipants;
        quality = newScreenParticipants.length > 4
            ? "low"
            : newScreenParticipants.length > 2
                ? "medium"
                : "high";
      });
    }
    if (numberofColumns !=
        (newScreenParticipants.length > 2 ||
                numberOfMaxOnScreenParticipants == 2
            ? 2
            : 1)) {
      setState(() {
        numberofColumns = newScreenParticipants.length > 2 ||
                numberOfMaxOnScreenParticipants == 2
            ? 2
            : 1;
      });
    }
  }
}
