import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:healthier_carbon_pregnancy_app/widgets/add_item.dart';

class ScheduleScreen extends StatelessWidget {
  const ScheduleScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: SafeArea(
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
                  const Text(
                    "Schedule",
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const Spacer(),
                ],
              ),
              const SizedBox(height: 15),
              const Row(
                children: [
                  Text(
                    'September 2023',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 16,
                    ),
                  ),
                  Spacer(),
                  Text(
                    'Add appointment',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 12,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 15),
              Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15),
                  color: const Color(0XFFFEF5F3),
                ),
                padding: const EdgeInsets.all(15.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      "Scheduled for Sept, 2023",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 10),
                    Row(
                      children: [
                        CircleAvatar(
                          backgroundColor:
                              const Color(0XFF808080).withOpacity(0.5),
                          radius: 4,
                        ),
                        const SizedBox(width: 10),
                        const Text(
                          'Check in with Healthier Carbon by 1pm',
                          style: TextStyle(),
                        )
                      ],
                    ),
                    const SizedBox(height: 5),
                    Row(
                      children: [
                        CircleAvatar(
                          backgroundColor:
                              const Color(0XFF808080).withOpacity(0.5),
                          radius: 4,
                        ),
                        const SizedBox(width: 10),
                        const Text(
                          'Yoga by 5pm',
                          style: TextStyle(),
                        )
                      ],
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 15),
              const Row(
                children: [
                  Text(
                    "Notes",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 16,
                    ),
                  ),
                  Spacer(),
                  FaIcon(
                    FontAwesomeIcons.plus,
                    size: 14,
                  ),
                ],
              ),
              const SizedBox(height: 5),
              const AddItem(),
              const SizedBox(height: 15),
              const Row(
                children: [
                  Text(
                    "Symptoms",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 16,
                    ),
                  ),
                  Spacer(),
                  FaIcon(
                    FontAwesomeIcons.plus,
                    size: 14,
                  ),
                ],
              ),
              const SizedBox(height: 5),
              const AddItem(),
              const SizedBox(height: 15),
              const Row(
                children: [
                  Text(
                    "Reminders",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 16,
                    ),
                  ),
                  Spacer(),
                  FaIcon(
                    FontAwesomeIcons.plus,
                    size: 14,
                  ),
                ],
              ),
              const SizedBox(height: 5),
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 8),
                width: size.width,
                height: 52,
                decoration: ShapeDecoration(
                  color: const Color(0xE5919191),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
                child: const Row(
                  children: [
                    Text(
                      "Morning walk",
                      style: TextStyle(
                          color: Colors.white, fontWeight: FontWeight.bold),
                    ),
                    Spacer(),
                    Text(
                      "7:30 AM",
                      style: TextStyle(
                          color: Colors.white, fontWeight: FontWeight.bold),
                    ),
                    SizedBox(width: 75),
                    Text(
                      "SEPT 20",
                      style: TextStyle(
                          color: Colors.white, fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 10),
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 8),
                width: size.width,
                height: 52,
                decoration: ShapeDecoration(
                  color: const Color(0xE5919191),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
                child: const Row(
                  children: [
                    Text(
                      "Yoga Workout",
                      style: TextStyle(
                          color: Colors.white, fontWeight: FontWeight.bold),
                    ),
                    Spacer(),
                    Text(
                      "5:00 AM",
                      style: TextStyle(
                          color: Colors.white, fontWeight: FontWeight.bold),
                    ),
                    SizedBox(width: 75),
                    Text(
                      "SEPT 20",
                      style: TextStyle(
                          color: Colors.white, fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 10),
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 8),
                width: size.width,
                height: 52,
                decoration: ShapeDecoration(
                  color: const Color(0xE5919191),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
                child: const Row(
                  children: [
                    Text(
                      "Live",
                      style: TextStyle(
                          color: Colors.white, fontWeight: FontWeight.bold),
                    ),
                    Spacer(),
                    Text(
                      "8:00 PM",
                      style: TextStyle(
                          color: Colors.white, fontWeight: FontWeight.bold),
                    ),
                    SizedBox(width: 75),
                    Text(
                      "SEPT 20",
                      style: TextStyle(
                          color: Colors.white, fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
