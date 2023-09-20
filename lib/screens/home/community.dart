import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:healthier_carbon_pregnancy_app/screens/home/chat_screen.dart';
import 'package:healthier_carbon_pregnancy_app/screens/home/profile_screen.dart';
import 'package:healthier_carbon_pregnancy_app/widgets/post_item.dart';

class Community extends StatelessWidget {
  const Community({super.key});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return SingleChildScrollView(
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 15),
        width: size.width,
        child: Column(
          children: [
            Row(
              children: [
                GestureDetector(
                  onTap: () =>
                      Navigator.of(context).pushNamed(ProfileScreen.routeName),
                  child: const CircleAvatar(
                    radius: 18,
                    backgroundImage: AssetImage('assets/images/dp.png'),
                  ),
                ),
                const Spacer(),
                SizedBox(
                  width: 219,
                  height: 38,
                  child: TextField(
                    keyboardType: TextInputType.text,
                    cursorColor: Colors.black,
                    decoration: InputDecoration(
                      fillColor: const Color(0XFF808080).withOpacity(0.1),
                      filled: true,
                      hintText: 'Search',
                      hintStyle: const TextStyle(
                        color: Colors.black,
                        fontSize: 14,
                      ),
                      enabled: true,
                      enabledBorder: const OutlineInputBorder(
                        borderSide: BorderSide(
                          color: Colors.transparent,
                          width: 1.0,
                        ),
                        borderRadius: BorderRadius.all(
                          Radius.circular(14.0),
                        ),
                      ),
                      border: const OutlineInputBorder(
                        borderRadius: BorderRadius.all(
                          Radius.circular(14.0),
                        ),
                      ),
                    ),
                  ),
                ),
                const Spacer(),
                GestureDetector(
                  onTap: () {},
                  child: const FaIcon(
                    FontAwesomeIcons.userPlus,
                    color: Color(0XFF666666),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 15),
            Row(
              children: [
                const Text(
                  "Feed",
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                const Spacer(),
                Container(
                  padding: const EdgeInsets.all(5),
                  decoration: BoxDecoration(
                    color: const Color(0XFFE6E6E6),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: GestureDetector(
                    onTap: () => Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (_) => const ChatScreen(),
                      ),
                    ),
                    child: const Text(
                      "Chat with nurse",
                      style: TextStyle(
                        fontSize: 12,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 15),
            const Row(
              children: [
                Chip(
                  label: Text(
                    "Popular",
                    style: TextStyle(fontSize: 12),
                  ),
                  backgroundColor: Color(0XFFFEF5F3),
                  side: BorderSide(color: Colors.black),
                ),
                SizedBox(width: 5),
                Chip(
                  label: Text(
                    "Latest",
                    style: TextStyle(fontSize: 12),
                  ),
                  backgroundColor: Color(0XFFFEF5F3),
                  side: BorderSide(color: Colors.black),
                ),
                SizedBox(width: 5),
                Chip(
                  label: Text(
                    "Saved",
                    style: TextStyle(fontSize: 12),
                  ),
                  backgroundColor: Color(0XFFFEF5F3),
                  side: BorderSide(color: Colors.black),
                ),
              ],
            ),
            const SizedBox(height: 15),
            PostItem(
              size: size,
              image: "assets/images/feed.png",
            ),
            const SizedBox(height: 15),
            PostItem(
              size: size,
              image: "assets/images/yoga.png",
            ),
          ],
        ),
      ),
    );
  }
}
