import 'package:flutter/material.dart';
import 'package:healthier_carbon_pregnancy_app/models/about_user.dart';
import 'package:provider/provider.dart';
import 'package:healthier_carbon_pregnancy_app/screens/start/dob_screen.dart';

class StageScreen extends StatelessWidget {
  const StageScreen({super.key});

  static const String routeName = 'stage-screen';

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15.0),
        child: Column(
          children: [
            const SizedBox(height: 60),
            const Text(
              'What\'s your stage?',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 100),
            GestureDetector(
              onTap: () {
                Provider.of<AboutUser>(context, listen: false)
                    .selectUserCondition(UserCondition.pregnant);
                Navigator.of(context).pushNamed(DOBScreen.routeName);
              },
              child: Container(
                height: 58,
                width: size.width,
                decoration: BoxDecoration(
                  color: const Color(0XFFFEF5F3),
                  borderRadius: BorderRadius.circular(15),
                  border:
                      Border.all(width: 1.0, color: const Color(0XFF666666)),
                ),
                child: const Center(
                  child: Text(
                    'Pregnant',
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
            ),
            const SizedBox(height: 90),
            GestureDetector(
              onTap: () {
                Provider.of<AboutUser>(context, listen: false)
                    .selectUserCondition(UserCondition.postpartum);
                Navigator.of(context).pushNamed(DOBScreen.routeName);
              },
              child: Container(
                height: 58,
                width: size.width,
                decoration: BoxDecoration(
                  color: const Color(0XFFFEF5F3),
                  borderRadius: BorderRadius.circular(15),
                  border:
                      Border.all(width: 1.0, color: const Color(0XFF666666)),
                ),
                child: const Center(
                  child: Text(
                    'Postpartum',
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
            ),
            const Spacer(),
            Container(
              width: 150,
              height: 150,
              decoration: const BoxDecoration(
                image: DecorationImage(
                  image: AssetImage('assets/images/logo.png'),
                ),
              ),
            ),
            const SizedBox(height: 15),
          ],
        ),
      ),
    );
  }
}
