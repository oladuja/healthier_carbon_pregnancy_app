import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:healthier_carbon_pregnancy_app/providers/create_new_user.dart';
import 'package:healthier_carbon_pregnancy_app/widgets/you_widgets.dart';
import 'package:provider/provider.dart';

class PostpartumScreen extends StatelessWidget {
  const PostpartumScreen({
    super.key,
    required this.size,
  });

  final Size size;

  @override
  Widget build(BuildContext context) {
    CreateNewUser user = Provider.of<CreateNewUser>(context);

    return SingleChildScrollView(
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 15),
        width: size.width,
        // height: size.height,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 25.0),
              child: HomeAppBar(
                name: user.user.name,
                url: user.user.imageUrl,
              ),
            ),
            const SizedBox(height: 15),
            Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 25.0,
              ),
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15),
                  color: const Color(0XFFA6A6A6),
                ),
                child: Padding(
                  padding: const EdgeInsets.symmetric(
                      horizontal: 18.0, vertical: 10),
                  child: Row(
                    children: [
                      Container(
                        decoration: BoxDecoration(
                          color: const Color(0XFFFEF5F3),
                          borderRadius: BorderRadius.circular(10),
                        ),
                        padding: const EdgeInsetsDirectional.all(8),
                        child: Text(
                          '${(DateTime.now().difference(user.user.period.toDate()).inDays).floor().toString()} Weeks',
                          style: const TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 18),
                        ),
                      ),
                      const SizedBox(width: 5),
                      const Text(
                        'Weeks into \npostpartum',
                        style: TextStyle(
                          fontSize: 12,
                          color: Colors.white,
                        ),
                      ),
                      const Spacer(),
                      Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(15),
                          color: const Color(0XFFFEF5F3),
                        ),
                        padding: const EdgeInsets.all(10),
                        child: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            const FaIcon(
                              FontAwesomeIcons.person,
                              color: Color(0XFF666666),
                            ),
                            const SizedBox(width: 15),
                            Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                const Text(
                                  "Weight",
                                  style: TextStyle(fontSize: 10),
                                ),
                                Text(
                                  user.user.weight,
                                  style: const TextStyle(
                                      fontSize: 12,
                                      fontWeight: FontWeight.bold),
                                ),
                              ],
                            ),
                            const SizedBox(width: 15),
                            Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                const Text(
                                  "Height",
                                  style: TextStyle(fontSize: 10),
                                ),
                                Text(
                                  user.user.height,
                                  style: const TextStyle(
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
              ),
            ),
            const SizedBox(height: 15),
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 25.0),
              child: CalendarandChatWithNurse(),
            ),
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
