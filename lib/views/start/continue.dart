import 'package:flutter/material.dart';
import 'package:healthier_carbon_pregnancy_app/views/start/start_screen.dart';
import 'package:healthier_carbon_pregnancy_app/widgets/app_button.dart';

class ContinueScreen extends StatelessWidget {
  static const String routeName = 'continue-screen';

  const ContinueScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: SafeArea(
        child: Container(
          width: size.width,
          height: size.height,
          decoration: BoxDecoration(
            image: DecorationImage(
              fit: BoxFit.cover,
              colorFilter: ColorFilter.mode(
                Colors.black.withOpacity(0.2),
                BlendMode.darken,
              ),
              image: const AssetImage('assets/images/bg3.jpg'),
            ),
          ),
          child: Column(
            children: [
              const SizedBox(height: 60),
              const Text(
                'Healthier Carbon',
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
              const Spacer(),
              Container(
                width: 250,
                height: 250,
                decoration: const BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage('assets/images/white_logo.png'),
                  ),
                ),
              ),
              const Spacer(),
              const Text(
                'Nurse Guided Pregnancy \nand Postpartum Journey',
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
              const Spacer(),
              AppButton(
                text: 'CONTINUE',
                onTap: () =>
                    Navigator.of(context).pushNamed(StartScreen.routeName),
              ),
              const SizedBox(height: 60)
            ],
          ),
        ),
      ),
    );
  }
}
