import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:healthier_carbon_pregnancy_app/screens/home/advice_screen.dart';
import 'package:healthier_carbon_pregnancy_app/screens/home/check_in_screen.dart';
import 'package:healthier_carbon_pregnancy_app/screens/home/community.dart';
import 'package:healthier_carbon_pregnancy_app/screens/home/wellness.dart';
import 'package:healthier_carbon_pregnancy_app/screens/home/you_screen.dart';

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

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Scaffold(
      body: SafeArea(
        child: PageView(
          controller: pageController,
          children: [
            You_Screen(size: size),
            const CheckInScreen(),
            const AdviceScreen(),
            const WellnessScreen(),
            const Community(),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: 0,
        type: BottomNavigationBarType.fixed,
        selectedFontSize: 10,
        unselectedFontSize: 10,
        onTap: (value) {
          setState(() {
            pageController.jumpToPage(value);
          });
        },
        selectedItemColor: const Color(0XFFA6A6A6),
        items: const [
          BottomNavigationBarItem(
            icon: FaIcon(FontAwesomeIcons.user),
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
