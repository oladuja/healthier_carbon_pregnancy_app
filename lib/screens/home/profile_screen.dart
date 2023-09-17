import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:healthier_carbon_pregnancy_app/screens/start/start_screen.dart';
import 'package:healthier_carbon_pregnancy_app/widgets/profile_item.dart';

class ProfileScreen extends StatelessWidget {
  static const String routeName = 'profle-screen';

  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

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
                    const FaIcon(
                      FontAwesomeIcons.gear,
                      color: Color(0XFF666666),
                    ),
                  ],
                ),
                const Center(
                  child: CircleAvatar(
                    radius: 60,
                    backgroundImage: AssetImage('assets/images/main_dp.png'),
                  ),
                ),
                const SizedBox(height: 15),
                const Center(
                  child: Text(
                    "Judith Fisher",
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                const SizedBox(height: 15),
                const Center(
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      FaIcon(
                        FontAwesomeIcons.solidEnvelope,
                        color: Color(0XFFA6A6A6),
                        size: 12,
                      ),
                      SizedBox(width: 10),
                      Text("Judyfisher@gmail.com"),
                    ],
                  ),
                ),
                const SizedBox(height: 5),
                const Center(
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      FaIcon(
                        FontAwesomeIcons.locationPin,
                        color: Color(0XFFA6A6A6),
                        size: 12,
                      ),
                      SizedBox(width: 10),
                      Text("Florida, USA"),
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
                    child: const Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Spacer(),
                        FaIcon(
                          FontAwesomeIcons.person,
                          color: Color(0XFF666666),
                        ),
                        Spacer(),
                        Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Text(
                              "Weight",
                              style: TextStyle(fontSize: 12),
                            ),
                            Text(
                              "234lb",
                              style: TextStyle(
                                  fontSize: 14, fontWeight: FontWeight.bold),
                            ),
                          ],
                        ),
                        Spacer(),
                        Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Text(
                              "Height",
                              style: TextStyle(fontSize: 12),
                            ),
                            Text(
                              "5 ft 7\"",
                              style: TextStyle(
                                  fontSize: 14, fontWeight: FontWeight.bold),
                            ),
                          ],
                        ),
                        Spacer(),
                        FaIcon(
                          FontAwesomeIcons.circle,
                          size: 14,
                        ),
                        Spacer(),
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
                      child: const Text(
                        'Pregnant',
                        style: TextStyle(
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
                      child: const Text(
                        '22 Weeks',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 15),
                const ProfileItem(
                  icon: FontAwesomeIcons.creditCard,
                  text: "Purchases",
                ),
                const ProfileItem(
                  icon: FontAwesomeIcons.bell,
                  text: "Reminders",
                ),
                const ProfileItem(
                  icon: FontAwesomeIcons.question,
                  text: "Purchases",
                ),
                const ProfileItem(
                  icon: FontAwesomeIcons.circleInfo,
                  text: "Private Policy & Terms of use",
                ),
                GestureDetector(
                  onTap: () => Navigator.of(context).pushNamedAndRemoveUntil(
                      StartScreen.routeName, (route) => false),
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
}
