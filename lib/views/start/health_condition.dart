import 'package:flutter/material.dart';
import 'package:healthier_carbon_pregnancy_app/views/start/period_screen.dart';
import 'package:healthier_carbon_pregnancy_app/widgets/app_button.dart';

class HealthScreen extends StatelessWidget {
  const HealthScreen({super.key});
  static const String routeName = 'health-screen';

  @override
  Widget build(BuildContext context) {
    
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Container(
            width: size.width,
            height: size.height,
            padding: const EdgeInsets.symmetric(horizontal: 15.0),
            child: Column(
              children: [
                const SizedBox(height: 25),
                GestureDetector(
                  onTap: () => Navigator.of(context).pop(),
                  child: const Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      'Back',
                      style: TextStyle(
                        fontSize: 12,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 45),
                const Text(
                  'Do you have any of these \nreproductive health \nconditions?',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 5),
                const Text(
                  'We’re asking because we can provide you with\ncontent about these conditions',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 15),
                Container(
                  height: 58,
                  width: size.width,
                  decoration: BoxDecoration(
                    color: const Color(0XFFFEF5F3),
                    borderRadius: BorderRadius.circular(15),
                    border:
                        Border.all(width: 1.0, color: const Color(0XFF666666)),
                  ),
                  child: const Padding(
                    padding: EdgeInsets.all(20.0),
                    child: Text(
                      'Endometriosis',
                      style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 30),
                Container(
                  height: 58,
                  width: size.width,
                  decoration: BoxDecoration(
                    color: const Color(0XFFFEF5F3),
                    borderRadius: BorderRadius.circular(15),
                    border:
                        Border.all(width: 1.0, color: const Color(0XFF666666)),
                  ),
                  child: const Padding(
                    padding: EdgeInsets.all(20.0),
                    child: Text(
                      'I\'m not sure',
                      style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 30),
                Container(
                  height: 58,
                  width: size.width,
                  decoration: BoxDecoration(
                    color: const Color(0XFFFEF5F3),
                    borderRadius: BorderRadius.circular(15),
                    border:
                        Border.all(width: 1.0, color: const Color(0XFF666666)),
                  ),
                  child: const Padding(
                    padding: EdgeInsets.all(20.0),
                    child: Text(
                      'No, I dont',
                      style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 30),
                AppButton(
                  text: "NEXT",
                  onTap: () =>
                      Navigator.of(context).pushNamed(PeriodScreen.routeName),
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
                const SizedBox(height: 45),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
