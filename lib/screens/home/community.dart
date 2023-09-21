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
      child: SizedBox(
        width: size.width,
        child: Column(
          children: [
            Container(
              decoration: BoxDecoration(
                color: const Color(0XFF666666).withOpacity(0.65),
              ),
              padding: EdgeInsets.symmetric(horizontal: 25, vertical: 10),
              child: Row(
                children: [
                  GestureDetector(
                    onTap: () => Navigator.of(context)
                        .pushNamed(ProfileScreen.routeName),
                    child: const CircleAvatar(
                      radius: 18,
                      backgroundImage: AssetImage('assets/images/dp.png'),
                    ),
                  ),
                  const Spacer(),
                  const SizedBox(
                    width: 219,
                    height: 38,
                    child: TextField(
                      keyboardType: TextInputType.text,
                      cursorColor: Colors.black,
                      decoration: InputDecoration(
                        fillColor: Colors.white,
                        filled: true,
                        hintText: 'Search',
                        hintStyle: TextStyle(
                          color: Colors.black,
                          fontSize: 14,
                        ),
                        enabled: true,
                        enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                            color: Colors.transparent,
                            width: 1.0,
                          ),
                          borderRadius: BorderRadius.all(
                            Radius.circular(14.0),
                          ),
                        ),
                        border: OutlineInputBorder(
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
                      color: Colors.white,
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 15),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 25.0),
              child: Row(
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
            ),
            const SizedBox(height: 15),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 25.0),
              child: const Row(
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
            ),
            const SizedBox(height: 15),
            Container(
                   padding: const EdgeInsets.symmetric(horizontal: 25.0 , vertical: 10) ,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15),
                color: const Color(0XFFFEF5F3),
              ),
              child: PostItem(
                size: size,
                image: "assets/images/feed.png",
              ),
            ),
            const SizedBox(height: 15),
            Container(
                   padding: const EdgeInsets.symmetric(horizontal: 25.0 , vertical: 10) ,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15),
                color: const Color(0XFFFEF5F3),
              ),
              child: PostItem(
                size: size,
                image: "assets/images/yoga.png",
              ),
            ),
          ],
        ),
      ),
    );
  }
}
