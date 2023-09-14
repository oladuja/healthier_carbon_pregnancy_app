import 'package:flutter/material.dart';
import 'package:healthier_carbon_pregnancy_app/screens/start/login_screen.dart';
import 'package:healthier_carbon_pregnancy_app/screens/start/stage_screen.dart';
import 'package:healthier_carbon_pregnancy_app/widgets/app_button.dart';
import 'package:healthier_carbon_pregnancy_app/widgets/app_text_field.dart';
import 'package:healthier_carbon_pregnancy_app/widgets/app_text_field_password.dart';

class SignUpScreen extends StatelessWidget {
  static const String routeName = 'signup-screen';
  const SignUpScreen({super.key});

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
                image: AssetImage('assets/images/bg1.jpg'),
              ),
            ),
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 30),
              child: Column(
                children: [
                  const SizedBox(height: 15),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text(
                        'Sign Up',
                        style: TextStyle(fontSize: 18),
                      ),
                      GestureDetector(
                        onTap: () => Navigator.of(context)
                            .popAndPushNamed(LoginScreen.routeName),
                        child: const Text(
                          style: TextStyle(fontSize: 18),
                          'Sign In',
                        ),
                      ),
                    ],
                  ),
                  const Align(
                    alignment: Alignment.center,
                    child: Text(
                      'Create Account',
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
                      'Name',
                      style: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  const AppTextField(
                    type: TextInputType.name,
                  ),
                  const SizedBox(height: 5),
                  const Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      'Email',
                      style: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  const SizedBox(height: 5),
                  const AppTextField(
                    type: TextInputType.emailAddress,
                  ),
                  const SizedBox(height: 35),
                  const Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      'Password',
                      style: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  const SizedBox(height: 5),
                  const AppTextFieldPassword(),
                  const SizedBox(height: 45),
                  AppButton(
                    text: "SIGN IN",
                    onTap: () => Navigator.of(context).popAndPushNamed(
                      StageScreen.routeName,
                    ),
                  ),
                  const SizedBox(height: 15),
                  const Text(
                    'By clicking continue, you agree to our Terms of\nUse and Privacy Policy',
                    textAlign: TextAlign.center,
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
