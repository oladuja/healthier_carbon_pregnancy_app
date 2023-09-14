import 'package:flutter/material.dart';
import 'package:healthier_carbon_pregnancy_app/screens/start/signup_screen.dart';
import 'package:healthier_carbon_pregnancy_app/screens/start/stage_screen.dart';
import 'package:healthier_carbon_pregnancy_app/widgets/app_button.dart';
import 'package:healthier_carbon_pregnancy_app/widgets/app_text_field.dart';
import 'package:healthier_carbon_pregnancy_app/widgets/app_text_field_password.dart';

class LoginScreen extends StatelessWidget {
  static const String routeName = 'login-screen';
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Container(
            width: size.width,
            height: size.height,
            decoration: const BoxDecoration(
              image: DecorationImage(
                fit: BoxFit.cover,
                image: AssetImage('assets/images/bg2.jpg'),
              ),
            ),
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 25, horizontal: 30),
              child: Column(
                children: [
                  Align(
                    alignment: Alignment.centerRight,
                    child: GestureDetector(
                      onTap: () => Navigator.of(context)
                          .popAndPushNamed(SignUpScreen.routeName),
                      child: const Text(
                        'Sign Up',
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 18,
                        ),
                      ),
                    ),
                  ),
                  const Align(
                    alignment: Alignment.center,
                    child: Text(
                      'Healthier Carbon',
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 28,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  const Spacer(),
                  const Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      'Email',
                      style: TextStyle(
                          color: Colors.black, fontWeight: FontWeight.bold),
                    ),
                  ),
                  const SizedBox(height: 5),
                  const AppTextField(type: TextInputType.emailAddress),
                  const SizedBox(height: 35),
                  const Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      'Password',
                      style: TextStyle(
                          color: Colors.black, fontWeight: FontWeight.bold),
                    ),
                  ),
                  const SizedBox(height: 5),
                  const AppTextFieldPassword(),
                  const SizedBox(height: 45),
                  AppButton(
                    text: "SIGN IN",
                    onTap: () => Navigator.of(context).popAndPushNamed(
                        StageScreen.routeName),
                  ),
                  const SizedBox(height: 15),
                  const Text(
                    'Forgot Password? Click HERE to recover',
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 15),
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
          ),
        ),
      ),
    );
  }
}
