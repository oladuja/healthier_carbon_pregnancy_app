import 'package:another_flutter_splash_screen/another_flutter_splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:healthier_carbon_pregnancy_app/screens/start/continue.dart';

class SplashScreen extends StatelessWidget {
  static const String routeName = 'splash-screen';
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return FlutterSplashScreen.fadeIn(
      backgroundColor: Colors.white,
      onInit: () {
        debugPrint("On Init");
      },
      onEnd: () {
        debugPrint("On End");
      },
      childWidget: SizedBox(
        height: 200,
        width: 200,
        child: Image.asset("assets/images/logo.png"),
      ),
      onAnimationEnd: () => debugPrint("On Fade In End"),
      defaultNextScreen: const ContinueScreen(),
    );
  }
}
