import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:healthier_carbon_pregnancy_app/views/home/blog_read_more.dart';
import 'package:healthier_carbon_pregnancy_app/views/home/notification_screen.dart';
import 'package:healthier_carbon_pregnancy_app/views/home/profile_screen.dart';
import 'package:healthier_carbon_pregnancy_app/widgets/article._widget.dart';

class AdviceScreen extends StatelessWidget {
  const AdviceScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return SingleChildScrollView(
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 15),
        width: size.width,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 25.0),
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
                  SizedBox(
                    width: 219,
                    height: 38,
                    child: TextField(
                      keyboardType: TextInputType.text,
                      cursorColor: Colors.black,
                      decoration: InputDecoration(
                        fillColor: const Color(0XFF808080).withOpacity(0.1),
                        filled: true,
                        hintText: 'Type keyword',
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
                    onTap: () => Navigator.of(context)
                        .pushNamed(NotificationScreen.routeName),
                    child: const FaIcon(
                      FontAwesomeIcons.bell,
                      color: Color(0XFF666666),
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 15),
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 25.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Categories",
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Row(
                      children: [
                        Chip(
                          label: Text(
                            "1st Trimester",
                            style: TextStyle(fontSize: 12),
                          ),
                          backgroundColor: Color(0XFFFEF5F3),
                          side: BorderSide(color: Colors.black),
                        ),
                        SizedBox(width: 5),
                        Chip(
                          label: Text(
                            "2nd Trimester",
                            style: TextStyle(fontSize: 12),
                          ),
                          backgroundColor: Color(0XFFFEF5F3),
                          side: BorderSide(color: Colors.black),
                        ),
                        SizedBox(width: 5),
                        Chip(
                          label: Text(
                            "3rd Trimester",
                            style: TextStyle(fontSize: 12),
                          ),
                          backgroundColor: Color(0XFFFEF5F3),
                          side: BorderSide(color: Colors.black),
                        ),
                        SizedBox(width: 5),
                        Chip(
                          label: Text(
                            "4th Trimester",
                            style: TextStyle(fontSize: 12),
                          ),
                          backgroundColor: Color(0XFFFEF5F3),
                          side: BorderSide(color: Colors.black),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 5),
            Container(
              padding:
                  const EdgeInsets.symmetric(horizontal: 25.0, vertical: 15),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15),
                color: const Color(0XFFFEF5F3),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  GestureDetector(
                    onTap: () => Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (_) => const BlogReaMoreScreen(),
                      ),
                    ),
                    child: Container(
                      decoration: const BoxDecoration(
                        image: DecorationImage(
                          image: AssetImage("assets/images/categories.png"),
                        ),
                        borderRadius: BorderRadius.all(
                          Radius.circular(5),
                        ),
                      ),
                      width: size.width,
                      height: 165,
                    ),
                  ),
                  const SizedBox(height: 5),
                  const Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'HEALTHY EATING',
                        style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.bold,
                          color: Colors.grey,
                        ),
                      ),
                      SizedBox(height: 5),
                      Text(
                        'These five food types should be in your diet if you feel fatigue',
                        style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(height: 5),
                      Row(
                        children: [
                          Text(
                            'Healthier Carbon',
                            style: TextStyle(
                              fontSize: 12,
                              fontWeight: FontWeight.bold,
                              color: Colors.grey,
                            ),
                          ),
                          Spacer(),
                          FaIcon(
                            FontAwesomeIcons.solidBookmark,
                            size: 14,
                            color: Color(0XFF666666),
                          ),
                          SizedBox(width: 10),
                          FaIcon(
                            FontAwesomeIcons.share,
                            color: Color(0XFF666666),
                            size: 14,
                          ),
                        ],
                      ),
                    ],
                  ),
                ],
              ),
            ),
            const SizedBox(height: 15),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 25),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    "Related Articles",
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 15),
                  ArticleWidget(size: size),
                  const Divider(),
                  const SizedBox(height: 10),
                  ArticleWidget(size: size),
                  const Divider(),
                  const SizedBox(height: 10),
                  ArticleWidget(size: size),
                  const Divider(),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
