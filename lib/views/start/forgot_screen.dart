import 'package:flutter/material.dart';
import 'package:healthier_carbon_pregnancy_app/helper/auth.dart';
import 'package:healthier_carbon_pregnancy_app/widgets/app_button.dart';
import 'package:healthier_carbon_pregnancy_app/widgets/app_text_field.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';

class ForgotPasswordScreen extends StatefulWidget {
  ForgotPasswordScreen({super.key});

  static const String routeName = 'forgot-password-screen';

  @override
  State<ForgotPasswordScreen> createState() => _ForgotPasswordScreenState();
}

class _ForgotPasswordScreenState extends State<ForgotPasswordScreen> {
  final TextEditingController email = TextEditingController();

  bool isLoggedInSelected = false;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15.0),
        child: SingleChildScrollView(
          child: FocusScope(
            child: SizedBox(
              height: size.height,
              width: size.width,
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
                  AppTextField(
                    type: TextInputType.emailAddress,
                    controller: email,
                  ),
                  const SizedBox(height: 50),
                  isLoggedInSelected
                      ? Center(
                          child: LoadingAnimationWidget.staggeredDotsWave(
                            color: const Color(0XFF666666),
                            size: 45,
                          ),
                        )
                      : AppButton(
                          text: "Recover",
                          onTap: () async {
                            FocusManager.instance.primaryFocus?.unfocus();

                            setState(() {
                              isLoggedInSelected = true;
                            });
                            try {
                              await Auth.resetPassword(email.text);
                              ScaffoldMessenger.of(context)
                                  .hideCurrentSnackBar();
                              ScaffoldMessenger.of(context).showSnackBar(
                                const SnackBar(
                                  content:
                                      Text('Link have been sent to your email'),
                                ),
                              );
                            } catch (e) {
                              ScaffoldMessenger.of(context)
                                  .hideCurrentSnackBar();
                              ScaffoldMessenger.of(context).showSnackBar(
                                const SnackBar(
                                  content: Text('An error has occured'),
                                ),
                              );
                              setState(() {
                                isLoggedInSelected = false;
                              });
                            }
                            setState(() {
                              isLoggedInSelected = false;
                            });
                          }),
                  // const SizedBox(height: 15),
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
          ),
        ),
      ),
    );
  }
}
