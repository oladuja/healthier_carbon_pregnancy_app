import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:healthier_carbon_pregnancy_app/widgets/you_widgets.dart';

class YouScreen extends StatelessWidget {
  const YouScreen({
    super.key,
    required this.size,
  });

  final Size size;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 15),
        width: size.width,
        // height: size.height,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 25.0),
              child: HomeAppBar(),
            ),
            const SizedBox(height: 15),
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 25.0),
              child: DisplayDashBoard(),
            ),
            const SizedBox(height: 15),
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 25.0),
              child: CalendarandChatWithNurse(),
            ),
            const SizedBox(height: 15),

    
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 25.0),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15),
                color: const Color(0XFFFEF9F8),
              ),
              child: const DisplayCalendar(),
            ),
            Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15),
                color: const Color(0XFFFEF5F3),
              ),
              margin: const EdgeInsets.symmetric(horizontal: 25.0),
              padding: const EdgeInsets.all(10),
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
            const SizedBox(height: 30),
            Container(
              padding:
                  const EdgeInsets.symmetric(horizontal: 25.0, vertical: 30),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15),
                color: const Color(0XFF808080).withOpacity(0.65),
              ),
              child: const ServiceToPurchase(),
            ),
            const SizedBox(height: 30),
            Container(
              padding:
                  const EdgeInsets.symmetric(horizontal: 25.0, vertical: 30),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15),
                color: const Color(0XFFFEF5F3),
              ),
              child: const ServiceToPurchaseList(),
            ),
          ],
        ),
      ),
    );
  }
}
