import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:healthier_carbon_pregnancy_app/widgets/notification_item.dart';

class NotificationScreen extends StatelessWidget {
  static const String routeName = 'notfication-screen';

  const NotificationScreen({super.key});

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
                    "Notifications",
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const Spacer(),
                  GestureDetector(
                    onTap: () {},
                    child: const FaIcon(
                      FontAwesomeIcons.ellipsisVertical,
                      color: Color(0XFF666666),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 15),
              // const Text("You have 1 unread message"),
              ...List<Widget>.generate(
                2,
                (index) => NotifcationItem(
                  index: index,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
