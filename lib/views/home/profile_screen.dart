import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:healthier_carbon_pregnancy_app/helper/auth.dart';
import 'package:healthier_carbon_pregnancy_app/helper/location.dart';
import 'package:healthier_carbon_pregnancy_app/helper/log.dart';
import 'package:healthier_carbon_pregnancy_app/main.dart';
import 'package:healthier_carbon_pregnancy_app/providers/create_new_user.dart';
import 'package:healthier_carbon_pregnancy_app/views/start/start_screen.dart';
import 'package:healthier_carbon_pregnancy_app/widgets/profile_item.dart';
import 'package:image_picker/image_picker.dart';
import 'package:provider/provider.dart';

class ProfileScreen extends StatefulWidget {
  static const String routeName = 'profle-screen';

  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
   String data = '';

  Future<void> loadAddress() async {
    data = await Place().getAddress();
  }

  @override
  void initState() {
    super.initState();
    loadAddress();
  }

  Future<void> deleteAllFilesInDirectory() async {
    Reference reference =
        FirebaseStorage.instance.ref().child(auth.currentUser!.uid);
    try {
      ListResult result = await reference.listAll();
      for (Reference ref in result.items) {
        await ref.delete();
      }
    } catch (error) {
      rethrow;
      // Handle error accordingly
    }
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    CreateNewUser user = Provider.of<CreateNewUser>(context);

    late String url;

    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 15),
            width: size.width,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    GestureDetector(
                      onTap: () => Navigator.of(context).pop(),
                      child: const FaIcon(
                        Icons.arrow_back_ios,
                        color: Color(0XFFA6A6A6),
                      ),
                    ),
                    const Spacer(),
                    // const FaIcon(
                    //   FontAwesomeIcons.gear,
                    //   color: Color(0XFF666666),
                    // ),
                  ],
                ),
                Center(
                  child: GestureDetector(
                    onTap: () async {
                      final picker = ImagePicker();
                      final pickedFile = await picker.pickImage(
                        source: ImageSource.gallery,
                        imageQuality: 30,
                      );

                      try {
                        await deleteAllFilesInDirectory();
                      } catch (e) {
                        logger.e(e);
                      }

                      if (pickedFile != null) {
                        String fileName = DateTime.now()
                            .millisecondsSinceEpoch
                            .toString(); // Generate a unique filename
                        Reference storageReference = FirebaseStorage.instance
                            .ref()
                            .child(auth.currentUser!.uid)
                            .child(fileName);
                        UploadTask uploadTask =
                            storageReference.putFile(File(pickedFile.path));
                        // Wait for the upload to complete and get the download URL
                        TaskSnapshot taskSnapshot =
                            await uploadTask.whenComplete(() {});
                        String downloadURL =
                            await taskSnapshot.ref.getDownloadURL();
                        url = downloadURL;
                        if (auth.currentUser != null) {
                          try {
                            // Reference the Firestore collection and document
                            CollectionReference collection =
                                FirebaseFirestore.instance.collection('users');
                            DocumentReference docRef =
                                collection.doc(auth.currentUser!.uid);
                            // Update the 'pictures' field in Firestore with the updated list
                            await docRef.update({'imageUrl': url});
                            logger.i('imageUrl updated successfully');
                          } catch (e) {
                            logger.i('Error updating picture list: $e');
                          }
                        }
                        setState(() {
                          user.user.imageUrl = url;
                        });
                      }
                    },
                    child: CircleAvatar(
                      radius: 60,
                      backgroundColor: Colors.white,
                      backgroundImage: NetworkImage(user.user.imageUrl),
                    ),
                  ),
                ),
                const SizedBox(height: 15),
                Center(
                  child: Text(
                    user.user.name,
                    style: const TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                const SizedBox(height: 15),
                Center(
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      const FaIcon(
                        FontAwesomeIcons.solidEnvelope,
                        color: Color(0XFFA6A6A6),
                        size: 12,
                      ),
                      const SizedBox(width: 10),
                      Text(user.user.email),
                    ],
                  ),
                ),
                const SizedBox(height: 5),
                Center(
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      const FaIcon(
                        FontAwesomeIcons.locationPin,
                        color: Color(0XFFA6A6A6),
                        size: 12,
                      ),
                      const SizedBox(width: 10),
                      Text(data),
                    ],
                  ),
                ),
                const SizedBox(height: 15),
                Center(
                  child: Container(
                    width: size.width,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15),
                      color: const Color(0XFFFEF5F3),
                    ),
                    padding: const EdgeInsets.all(15),
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        const Spacer(),
                        const FaIcon(
                          FontAwesomeIcons.person,
                          color: Color(0XFF666666),
                        ),
                        const Spacer(),
                        Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            const Text(
                              "Weight",
                              style: TextStyle(fontSize: 12),
                            ),
                            Text(
                              user.user.weight,
                              style: const TextStyle(
                                  fontSize: 14, fontWeight: FontWeight.bold),
                            ),
                          ],
                        ),
                        const Spacer(),
                        Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            const Text(
                              "Height",
                              style: TextStyle(fontSize: 12),
                            ),
                            Text(
                              user.user.height,
                              style: const TextStyle(
                                  fontSize: 14, fontWeight: FontWeight.bold),
                            ),
                          ],
                        ),
                        const Spacer(),
                        const FaIcon(
                          FontAwesomeIcons.circle,
                          size: 14,
                        ),
                        const Spacer(),
                      ],
                    ),
                  ),
                ),
                const SizedBox(height: 15),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text(
                      'Status',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 14,
                      ),
                    ),
                    Container(
                      padding: const EdgeInsets.symmetric(
                        vertical: 8.0,
                        horizontal: 15,
                      ),
                      decoration: const BoxDecoration(
                        color: Color(0XFF666666),
                        borderRadius: BorderRadius.all(
                          Radius.circular(10),
                        ),
                      ),
                      child: Text(
                        toTitleCase(user.user.stage),
                        style: const TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 15),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text(
                      'Est. weeks to delivery',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 14,
                      ),
                    ),
                    Container(
                      padding: const EdgeInsets.symmetric(
                        vertical: 8.0,
                        horizontal: 15,
                      ),
                      decoration: const BoxDecoration(
                        color: Color(0XFF666666),
                        borderRadius: BorderRadius.all(
                          Radius.circular(10),
                        ),
                      ),
                      child: Text(
                        '${((user.user.period.toDate().subtract(const Duration(days: 90)).add(const Duration(days: 372))).day / 7).floor().toString()} weeks',
                        style: const TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 15),
                // const ProfileItem(
                //   icon: FontAwesomeIcons.creditCard,
                //   text: "Purchases",
                // ),
                // const ProfileItem(
                //   icon: FontAwesomeIcons.bell,
                //   text: "Reminders",
                // ),
                // const ProfileItem(
                //   icon: FontAwesomeIcons.question,
                //   text: "Purchases",
                // ),
                // const ProfileItem(
                //   icon: FontAwesomeIcons.circleInfo,
                //   text: "Private Policy & Terms of use",
                // ),
                GestureDetector(
                  onTap: () {
                    Auth.signOut();
                    prefs.remove('isUserLoggedIn');
                    Navigator.of(context).pushNamedAndRemoveUntil(
                        StartScreen.routeName, (route) => false);
                  },
                  child: const Text(
                    "Logout",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 18,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  String toTitleCase(String text) {
    if (text == null || text.isEmpty) {
      return '';
    }

    List<String> words = text.toLowerCase().split(' ');
    words = words
        .map((word) =>
            word.isEmpty ? '' : '${word[0].toUpperCase()}${word.substring(1)}')
        .toList();
    return words.join(' ');
  }
}
