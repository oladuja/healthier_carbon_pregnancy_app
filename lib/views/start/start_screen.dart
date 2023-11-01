import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:healthier_carbon_pregnancy_app/helper/auth.dart';
import 'package:healthier_carbon_pregnancy_app/helper/log.dart';
import 'package:healthier_carbon_pregnancy_app/main.dart';
import 'package:healthier_carbon_pregnancy_app/views/start/login_screen.dart';
import 'package:healthier_carbon_pregnancy_app/views/start/signup_screen.dart';
import 'package:healthier_carbon_pregnancy_app/views/start/stage_screen.dart';
import 'package:healthier_carbon_pregnancy_app/widgets/app_button.dart';
import 'package:healthier_carbon_pregnancy_app/widgets/sign_with_button.dart';

class StartScreen extends StatefulWidget {
  static const String routeName = 'start-screen';

  const StartScreen({super.key});

  @override
  State<StartScreen> createState() => _StartScreenState();
}

class _StartScreenState extends State<StartScreen> {
  bool showLoadingAnimationWidget = false;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Scaffold(
      body: Container(
              width: size.width,
              height: size.height,
              decoration: BoxDecoration(
                image: DecorationImage(
                  fit: BoxFit.cover,
                  colorFilter: ColorFilter.mode(
                    Colors.black.withOpacity(0.2),
                    BlendMode.darken,
                  ),
                  image: const AssetImage('assets/images/bg4.jpg'),
                ),
              ),
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(vertical: 25, horizontal: 45),
                child: Column(
                  children: [
                    const Spacer(),
                    SignWithButton(
                      onTap: () async {
                        try {
                          await Auth.signInWithGoogle();
                          logger.i(auth.currentUser!.email);
                          prefs.setBool('isUserLoggedIn', true);
                          Navigator.of(context).pushAndRemoveUntil(
                            MaterialPageRoute(
                              builder: (_) => const StageScreen(),
                            ),
                            (route) => false,
                          );
                        } on FirebaseAuthException catch (e) {
                          logger.e(e);
                          ScaffoldMessenger.of(context).removeCurrentSnackBar();
                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(
                              content: Text("An error has occurred"),
                            ),
                          );
                        } catch (e) {
                          logger.e(e);
                          ScaffoldMessenger.of(context).removeCurrentSnackBar();
                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(
                              content: Text("An error has occurred"),
                            ),
                          );
                        }
                      },
                      size: size,
                      icon: FontAwesomeIcons.google,
                      text: 'SIGN IN WITH GOOGLE',
                    ),
                    // const SizedBox(height: 15),
                    // SignWithButton(
                    //   size: size,
                    //   icon: FontAwesomeIcons.facebook,
                    //   text: 'SIGN UP WITH FACEBOOK',
                    // ),
                    const SizedBox(height: 30),
                    AppButton(
                      text: 'GET STARTED',
                      onTap: () => Navigator.of(context)
                          .pushNamed(SignUpScreen.routeName),
                    ),
                    const SizedBox(height: 15),
                    GestureDetector(
                      onTap: () => Navigator.of(context)
                          .pushNamed(LoginScreen.routeName),
                      child: const Text(
                        'Have an account? SIGN IN',
                        style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 14,
                        ),
                      ),
                    ),
                    const SizedBox(height: 30),
                  ],
                ),
              ),
            )
          
    );
  }
}
