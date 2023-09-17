import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:healthier_carbon_pregnancy_app/screens/home/notification_screen.dart';
import 'package:healthier_carbon_pregnancy_app/screens/home/profile_screen.dart';
import 'package:healthier_carbon_pregnancy_app/screens/home/schedule_screen.dart';

class HomeScreen extends StatelessWidget {
  static const String routeName = 'home-screen';

  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 15),
            width: size.width,
            // height: size.height,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
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
                    const Text(
                      "Welcome Judith",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
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
                const SizedBox(height: 15),
                Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 15,
                    vertical: 15,
                  ),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15),
                    color: const Color(0XFFA6A6A6),
                  ),
                  child: Column(
                    children: [
                      Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(15),
                          color: const Color(0XFFFEF5F3),
                        ),
                        padding: const EdgeInsets.all(10),
                        child: const Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            FaIcon(
                              FontAwesomeIcons.person,
                              color: Color(0XFF666666),
                            ),
                            SizedBox(width: 15),
                            Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Text(
                                  "Weight",
                                  style: TextStyle(fontSize: 10),
                                ),
                                Text(
                                  "234lb",
                                  style: TextStyle(
                                      fontSize: 12,
                                      fontWeight: FontWeight.bold),
                                ),
                              ],
                            ),
                            SizedBox(width: 15),
                            Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Text(
                                  "Height",
                                  style: TextStyle(fontSize: 10),
                                ),
                                Text(
                                  "5 ft 7\"",
                                  style: TextStyle(
                                      fontSize: 12,
                                      fontWeight: FontWeight.bold),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(height: 15),
                      Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(15),
                          color: const Color(0XFFFEF5F3),
                        ),
                        padding: const EdgeInsets.all(10.0),
                        child: const Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Text(
                                  "Baby's Growth",
                                  style: TextStyle(fontSize: 10),
                                ),
                                Text(
                                  "18 weeks",
                                  style: TextStyle(
                                      fontSize: 12,
                                      fontWeight: FontWeight.bold),
                                ),
                              ],
                            ),
                            SizedBox(width: 15),
                            Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  "Estimated time of delivery in",
                                  style: TextStyle(fontSize: 10),
                                ),
                                Text(
                                  "22 weeks",
                                  style: TextStyle(
                                      fontSize: 12,
                                      fontWeight: FontWeight.bold),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 15),
                Row(
                  children: [
                    GestureDetector(
                      onTap: () => Navigator.of(context).push(MaterialPageRoute(
                          builder: (_) => const ScheduleScreen())),
                      child: const Text(
                        "Calendar",
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                    ),
                    const Spacer(),
                    Container(
                      padding: const EdgeInsets.all(5),
                      decoration: BoxDecoration(
                        color: const Color(0XFFE6E6E6),
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: const Text(
                        "Chat with nurse",
                        style: TextStyle(fontSize: 10),
                      ),
                    ),
                  ],
                ),
                CalendarDatePicker(
                  initialDate: DateTime.now(),
                  firstDate: DateTime(2023),
                  lastDate: DateTime(2024),
                  onDateChanged: (_) {},
                ),
                Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15),
                    color: const Color(0XFFFEF5F3),
                  ),
                  padding: const EdgeInsets.all(10.0),
                  child: Row(
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            children: [
                              CircleAvatar(
                                backgroundColor: Colors.black.withOpacity(0.77),
                                radius: 4,
                              ),
                              const SizedBox(width: 10),
                              const Text(
                                'Notes',
                                style: TextStyle(fontWeight: FontWeight.bold),
                              )
                            ],
                          ),
                          const Row(
                            children: [
                              CircleAvatar(
                                backgroundColor: Colors.red,
                                radius: 4,
                              ),
                              SizedBox(width: 10),
                              Text(
                                'Symptoms',
                                style: TextStyle(fontWeight: FontWeight.bold),
                              )
                            ],
                          ),
                        ],
                      ),
                      const Spacer(),
                      const Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          CircleAvatar(
                            backgroundColor: Color(0XFF919191),
                            radius: 9,
                            child: Center(
                              child: FaIcon(
                                FontAwesomeIcons.plus,
                                color: Colors.white,
                                size: 10,
                              ),
                            ),
                          ),
                          SizedBox(height: 5),
                          Text(
                            'Schedule monthly\ncheck up',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              fontSize: 9,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      )
                    ],
                  ),
                ),
                const SizedBox(height: 15),
                const Row(
                  children: [
                    Text(
                      "Services to Purchase",
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    Spacer(),
                    Text(
                      "See All",
                      style: TextStyle(fontSize: 10),
                    ),
                  ],
                ),
                const SizedBox(height: 15),
                SizedBox(
                  height: 180,
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemBuilder: (_, i) => Container(
                      margin: const EdgeInsets.only(right: 10),
                      width: 150,
                      decoration: const BoxDecoration(
                        image: DecorationImage(
                          image: AssetImage('assets/images/baby.png'),
                        ),
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          const Spacer(),
                          const Text(
                            "Birth Rate",
                            style: TextStyle(color: Colors.white, fontSize: 14),
                          ),
                          const Spacer(),
                          const Text(
                            "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Donec ac",
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 12,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          const Spacer(),
                          Container(
                            width: 40,
                            decoration: const BoxDecoration(
                              color: Colors.white,
                              borderRadius:
                                  BorderRadius.all(Radius.circular(7)),
                            ),
                            padding: const EdgeInsets.symmetric(
                                vertical: 8, horizontal: 15),
                            child: const Icon(
                              FontAwesomeIcons.plus,
                              color: Color(0XFF919191),
                              size: 12,
                            ),
                          ),
                          const Spacer(),
                        ],
                      ),
                    ),
                    itemCount: 3,
                  ),
                ),
                const SizedBox(height: 15),
                const Row(
                  children: [
                    Text(
                      "Services to Purchase",
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    Spacer(),
                    Text(
                      "See All",
                      style: TextStyle(fontSize: 10),
                    ),
                  ],
                ),
                const SizedBox(height: 15),
                SizedBox(
                  height: 180,
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemBuilder: (_, i) => Container(
                      margin: const EdgeInsets.only(right: 10),
                      width: 150,
                      decoration: BoxDecoration(
                        image: DecorationImage(
                          image: AssetImage('assets/images/${i + 1}.png'),
                        ),
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          const Spacer(),
                          const Text(
                            "Live Check In",
                            style: TextStyle(color: Colors.white, fontSize: 14),
                          ),
                          const Spacer(),
                          const Text(
                            "SEP 29 2023",
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 12,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          const Text(
                            "9:30 AM",
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 12,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          const Spacer(),
                          Container(
                            width: 60,
                            decoration: const BoxDecoration(
                              color: Colors.white,
                              borderRadius:
                                  BorderRadius.all(Radius.circular(7)),
                            ),
                            padding: const EdgeInsets.symmetric(
                                vertical: 8, horizontal: 5),
                            child: const Center(child: Text("View")),
                          ),
                          const Spacer(),
                        ],
                      ),
                    ),
                    itemCount: 2,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: 0,
        type: BottomNavigationBarType.fixed,
        selectedFontSize: 10,
        unselectedFontSize: 10,
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
