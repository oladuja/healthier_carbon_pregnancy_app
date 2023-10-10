import 'package:flutter/material.dart';
import 'package:healthier_carbon_pregnancy_app/helper/auth.dart';
import 'package:healthier_carbon_pregnancy_app/widgets/app_button.dart';
import 'package:healthier_carbon_pregnancy_app/widgets/app_text_field.dart';

class ForgotPasswordScreen extends StatelessWidget {
  ForgotPasswordScreen({super.key});

  static const String routeName = 'forgot-password-screen';

  final TextEditingController email = TextEditingController();

  @override
  Widget build(BuildContext context) {
    // Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15.0),
        child: Column(
          children: [
            const SizedBox(height: 60),
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
            const Text(
              'Recover Password',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
            AppTextField(type: TextInputType.emailAddress, controller: email),
            const SizedBox(height: 50),
            AppButton(
                text: "Recover",
                onTap: () {
                  Auth.resetPassword(email.text);
                  ScaffoldMessenger.of(context).hideCurrentSnackBar();
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(
                      content: Text('Link have been sent to your email'),
                    ),
                  );
                }),
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
          ],
        ),
      ),
    );
  }
}
