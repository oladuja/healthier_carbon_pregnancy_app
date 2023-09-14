import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:healthier_carbon_pregnancy_app/screens/start/login_screen.dart';
import 'package:healthier_carbon_pregnancy_app/widgets/app_button.dart';
import 'package:healthier_carbon_pregnancy_app/widgets/sign_with_button.dart';

class StartScreen extends StatelessWidget {
  static const String routeName = 'start-screen';

  const StartScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Scaffold(
      body: Container(
        width: size.width,
        height: size.height,
        decoration:  BoxDecoration(
          image: DecorationImage(
            fit: BoxFit.cover,      colorFilter: ColorFilter.mode(
                  Colors.grey.withOpacity(0.3), BlendMode.color),
            image: AssetImage('assets/images/bg4.jpg'),
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 25, horizontal: 45),
          child: Column(
            children: [
              const Spacer(),
              SignWithButton(
                size: size,
                icon: FontAwesomeIcons.google,
                text: 'SIGN UP WITH GOOGLE',
              ),
              const SizedBox(height: 15),
              SignWithButton(
                size: size,
                icon: FontAwesomeIcons.facebook,
                text: 'SIGN UP WITH FACEBOOK',
              ),
              const SizedBox(height: 30),
              AppButton(
                text: 'GET STARTED',
                onTap: () =>
                    Navigator.of(context).pushNamed(LoginScreen.routeName),
              ),
              const SizedBox(height: 15),
              GestureDetector(
                onTap: () =>
                    Navigator.of(context).pushNamed(LoginScreen.routeName),
                child: const Text(
                  'Have an account? SIGN IN',
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              const SizedBox(height: 30),
            ],
          ),
        ),
      ),
    );
  }
}
