import 'package:chatview/chatview.dart';

class Data {
  static const profileImage =
      "https://raw.githubusercontent.com/SimformSolutionsPvtLtd/flutter_showcaseview/master/example/assets/simform.png";


  static final messageList = [
    Message(
      id: '2',
      message:
          "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nullam volutpat, neque",
      createdAt: DateTime.now(),
      sendBy: '1', // userId of who sends the message
      status: MessageStatus.read,
    ),
    Message(
      id: '2',
      message:
          "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nullam volutpat, neque",
      createdAt: DateTime.now(),
      sendBy: '2', // userId of who sends the message
      status: MessageStatus.read,
    ),
    Message(
      id: '1',
      message:
          "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nullam volutpat, neque",
      createdAt: DateTime.now(),
      sendBy: '2', // userId of who sends the message
      status: MessageStatus.read,
    ),
    Message(
      id: '2',
      message: "https://miro.medium.com/max/1000/0*s7of7kWnf9fDg4XM.jpeg",
      createdAt: DateTime.now(),
      messageType: MessageType.image,
      sendBy: '1',
      status: MessageStatus.read,
    ),
    Message(
      id: '1',
      message:
          "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nullam volutpat, neque",
      createdAt: DateTime.now(),
      sendBy: '1', // userId of who sends the message
      status: MessageStatus.read,
    ),
  ];
}
