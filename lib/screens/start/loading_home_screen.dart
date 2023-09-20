import 'dart:async';

import 'package:flutter/material.dart';
import 'package:healthier_carbon_pregnancy_app/screens/home/home_screen.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';

class LoadingHomeScreen extends StatefulWidget {
  static const String routeName = 'loading-home-screen';

  const LoadingHomeScreen({super.key});

  @override
  State<LoadingHomeScreen> createState() => _LoadingHomeScreenState();
}

class _LoadingHomeScreenState extends State<LoadingHomeScreen> {
  @override
  void initState() {
    super.initState();
    Timer(const Duration(seconds: 5), () {
      Navigator.of(context).pushNamedAndRemoveUntil(
        HomeScreen.routeName,
        (route) => false,
      );
    });
  }

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
                Colors.black.withOpacity(0.3),
                BlendMode.darken,
              ),
              image: const AssetImage('assets/images/bg3.jpg'),
            ),
          ),
          child: Column(
            children: [
              const SizedBox(height: 75),
              Container(
                width: 300,
                height: 300,
                decoration: const BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage('assets/images/white_logo.png'),
                  ),
                ),
              ),
              Center(
                child: LoadingAnimationWidget.prograssiveDots(
                  color: Colors.white,
                  size: 50,
                ),
              ),
              const Text(
                'Setting Up Profile',
                style: TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
              const Spacer(),
              const Text(
                'Healthier Carbon',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
              const SizedBox(height: 60)
            ],
          ),
        ),
      ),
    );
  }
}
