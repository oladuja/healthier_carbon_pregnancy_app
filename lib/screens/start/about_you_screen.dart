import 'package:flutter/material.dart';
import 'package:healthier_carbon_pregnancy_app/screens/start/health_condition.dart';
import 'package:healthier_carbon_pregnancy_app/widgets/about_textfield.dart';
import 'package:healthier_carbon_pregnancy_app/widgets/app_button.dart';

class AboutYouScreen extends StatelessWidget {
  const AboutYouScreen({super.key});
  static const String routeName = 'about-you-screen';

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
                  'About You',
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 5),
                const Text(
                  'Tell us your weight and size',
                  style: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.bold,
                  ),
                ),

                const SizedBox(height: 75),
                //  Date Picker
                const AboutAppTextField(text: "Height"),
                const SizedBox(height: 30),
                const AboutAppTextField(text: "Weight"),
                const Spacer(),
                AppButton(
                  text: 'NEXT',
                  onTap: () =>
                      Navigator.of(context).pushNamed(HealthScreen.routeName),
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
