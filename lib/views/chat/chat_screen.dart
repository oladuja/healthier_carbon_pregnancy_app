import 'package:chat_bubbles/bubbles/bubble_normal.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:healthier_carbon_pregnancy_app/helper/fire_store.dart';
import 'package:healthier_carbon_pregnancy_app/helper/log.dart';
import 'package:healthier_carbon_pregnancy_app/models/msg.dart';
import 'package:healthier_carbon_pregnancy_app/providers/create_new_user.dart';
import 'package:provider/provider.dart';

class ChatScreen extends StatefulWidget {
  static const String routeName = 'chat-screen';

  const ChatScreen({super.key});

  @override
  State<ChatScreen> createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  FirebaseAuth firebaseAuth = FirebaseAuth.instance;
  FirebaseFirestore firebaseFirestore = FirebaseFirestore.instance;

  @override
  Widget build(BuildContext context) {
    CreateNewUser user = Provider.of<CreateNewUser>(context);
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () => Navigator.of(context).pop(),
          icon: const Icon(Icons.arrow_back_ios),
          color: Colors.black,
        ),
        backgroundColor: Colors.white,
        title: const Text(
          'Chat with Nurse',
          style: TextStyle(
            color: Colors.black,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      body: Container(
        width: double.infinity,
        color: Colors.transparent,
        child: Column(
          mainAxisSize: MainAxisSize.max,
          //mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Expanded(
              child: StreamBuilder(
                stream: firebaseFirestore
                    .collection('chats')
                    .doc(firebaseAuth.currentUser!.uid)
                    .collection('message-sent')
                    .doc('admin')
                    .collection('messages')
                    .orderBy('timestamp')
                    .snapshots(),
                builder: (context, snapshot) {
                  try {
                    if (snapshot.connectionState == ConnectionState.waiting) {
                      return const Center(child: Text('Loading messages'));
                    }
                    if (snapshot.data!.docs.isEmpty) {
                      return const Center(
                        child: Text('No message'),
                      );
                    }
                    if (snapshot.connectionState == ConnectionState.active) {
                      // logger.i(snapshot.data!.docs);
                      return ListView.builder(
                        padding: EdgeInsets.zero,
                        // reverse: true,
                        itemBuilder: (context, index) {
                          Message message = Message.fromJson(
                              snapshot.data!.docs[index].data());
                          return BubbleNormal(
                            bubbleRadius: 20,
                            tail: true,
                            isSender: (message.isSender ==
                                firebaseAuth.currentUser!.uid),
                            color: (message.isSender ==
                                    firebaseAuth.currentUser!.uid)
                                ? const Color(0XFFf3f3f3)
                                : const Color(0xffc420d2),
                            text: message.message,
                            textStyle: TextStyle(
                              color: (message.isSender ==
                                      firebaseAuth.currentUser!.uid)
                                  ? Colors.black
                                  : Colors.white,
                            ),
                          );
                        },
                        itemCount: snapshot.data!.docs.length,
                      );
                    }
                    return const CircularProgressIndicator();
                  } catch (e) {
                    logger.e(e);
                    return Container();
                  }
                },
              ),
            ),
            const Align(
              alignment: Alignment.bottomCenter,
              child: SendMessage(),
            ),
          ],
        ),
      ),
    );
  }
}

class SendMessage extends StatefulWidget {
  const SendMessage({super.key});

  @override
  State<SendMessage> createState() => _SendMessageState();
}

class _SendMessageState extends State<SendMessage> {
 final TextEditingController controller = TextEditingController();

 @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(8),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10),
      ),
      child: TextField(
        controller: controller,
        onSubmitted: (_) {
          setState(() {
            logger.i(controller.text += '\n');
            logger.i(controller.text);
            controller.text += '\n';
          });
        },
        enabled: true,
        keyboardType: TextInputType.multiline,
        textInputAction: TextInputAction.newline,
        decoration: InputDecoration(
          enabled: true,
          isDense: true,
          hintText: 'Type your message...',
          hintStyle: const TextStyle(
            color: Colors.grey,
            fontSize: 14,
          ),
          suffixIcon: GestureDetector(
            onTap: () async {
              if (controller.text.trim().isNotEmpty) {
                FocusScope.of(context).unfocus();
                logger.i(controller.text);
                try {
                  await FireStore().sendMessage(controller.text.trim());
                  controller.clear();
                } catch (e) {
                  ScaffoldMessenger.of(context).removeCurrentSnackBar();
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      content: Text(e.toString()),
                    ),
                  );
                  logger.i(e);
                }
              }
            },
            child: const CircleAvatar(
              backgroundColor: Colors.grey,
              child: Padding(
                padding: EdgeInsets.symmetric(vertical: 15),
                child: FaIcon(
                  FontAwesomeIcons.solidPaperPlane,
                  size: 18,
                  color: Colors.white,
                ),
              ),
            ),
          ),
          enabledBorder: InputBorder.none,
          focusedBorder: InputBorder.none,
        ),
      ),
    );
  }
}
