import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:healthier_carbon_pregnancy_app/providers/about_user.dart';
import 'package:healthier_carbon_pregnancy_app/views/home/advice_screen.dart';
import 'package:healthier_carbon_pregnancy_app/views/home/check_in_screen.dart';
import 'package:healthier_carbon_pregnancy_app/views/home/community.dart';
import 'package:healthier_carbon_pregnancy_app/views/home/postpartum_screen.dart';
import 'package:healthier_carbon_pregnancy_app/views/home/wellness.dart';
import 'package:healthier_carbon_pregnancy_app/views/home/you_screen.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatefulWidget {
  static const String routeName = 'home-screen';
  const HomeScreen({super.key});
  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  PageController pageController = PageController(
    keepPage: true,
    initialPage: 0,
  );

  int index = 0;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Scaffold(
      body: SafeArea(
        child: PageView(
          onPageChanged: (value) {
            setState(() {
              index = value;
            });
          },
          controller: pageController,
          children: [
            (Provider.of<AboutUser>(context).userCondition ==
                    UserCondition.pregnant)
                ? YouScreen(size: size)
                : PostpartumScreen(size: size),
            const CheckInScreen(),
            const AdviceScreen(),
            const WellnessScreen(),
            const Community(),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: index,
        type: BottomNavigationBarType.fixed,
        selectedFontSize: 10,
        unselectedFontSize: 10,
        onTap: (value) {
          setState(() {
            pageController.jumpToPage(value);
            index = value;
          });
        },
        selectedItemColor: const Color.fromARGB(255, 61, 61, 61),
        unselectedItemColor: Colors.grey,
        items: const [
          BottomNavigationBarItem(
            icon: FaIcon(FontAwesomeIcons.solidUser),
            label: "You",
          ),
          BottomNavigationBarItem(
            icon: FaIcon(FontAwesomeIcons.video),
            label: "Check-In",
          ),
          BottomNavigationBarItem(
            icon: FaIcon(FontAwesomeIcons.userDoctor),
            label: "Advice",
          ),
          BottomNavigationBarItem(
            icon: FaIcon(FontAwesomeIcons.spa),
            label: "Wellness",
          ),
          BottomNavigationBarItem(
            icon: FaIcon(FontAwesomeIcons.peopleGroup),
            label: "Community",
          ),
        ],
      ),
    );
  }
}
