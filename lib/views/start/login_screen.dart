import 'package:email_validator/email_validator.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:healthier_carbon_pregnancy_app/helper/auth.dart';
import 'package:healthier_carbon_pregnancy_app/helper/fire_store.dart';
import 'package:healthier_carbon_pregnancy_app/main.dart';
import 'package:healthier_carbon_pregnancy_app/providers/create_new_user.dart';
import 'package:healthier_carbon_pregnancy_app/views/home/home_screen.dart';
import 'package:healthier_carbon_pregnancy_app/views/start/forgot_screen.dart';
import 'package:healthier_carbon_pregnancy_app/views/start/signup_screen.dart';
import 'package:healthier_carbon_pregnancy_app/widgets/app_button.dart';
import 'package:healthier_carbon_pregnancy_app/widgets/app_text_field.dart';
import 'package:healthier_carbon_pregnancy_app/widgets/app_text_field_password.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import 'package:provider/provider.dart';

class LoginScreen extends StatefulWidget {
  static const String routeName = 'login-screen';
  LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  bool isLoggedInSelected = false;
  final TextEditingController email = TextEditingController();
  final TextEditingController password = TextEditingController();
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  @override
  void dispose() {
    email.dispose();
    password.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    CreateNewUser user = Provider.of<CreateNewUser>(context);

    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
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
                image: const AssetImage('assets/images/bg2.jpg'),
              ),
            ),
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 25, horizontal: 30),
              child: FocusScope(
                child: Form(
                  key: formKey,
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
                              fontSize: 12,
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
                            fontSize: 24,
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
                      AppTextField(
                        validator: (value) {
                          if (!EmailValidator.validate(email.text.trim())) {
                            return 'Invalid Email';
                          }
                          return null;
                        },
                        type: TextInputType.emailAddress,
                        controller: email,
                      ),
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
                      AppTextFieldPassword(
                        controller: password,
                        validator: (value) {
                          if (value!.isEmpty) {
                            return 'Enter a value';
                          }
                          return null;
                        },
                      ),
                      const SizedBox(height: 45),
                      isLoggedInSelected
                          ? Center(
                              child: LoadingAnimationWidget.staggeredDotsWave(
                                color: Colors.white,
                                size: 45,
                              ),
                            )
                          : AppButton(
                              text: "SIGN IN",
                              onTap: () async {
                                if (formKey.currentState!.validate()) {
                                  FocusManager.instance.primaryFocus?.unfocus();
                                  setState(() {
                                    isLoggedInSelected = true;
                                  });
                                  try {
                                    await Auth.account(
                                      email.text,
                                      password.text,
                                      AuthMode.login,
                                    ).then((value) async {
                                      await prefs.setBool(
                                          'isUserLoggedIn', true);
                                      var data = await FireStore()
                                          .getUser(auth.currentUser!.uid);
                                      user.setProfile(data.data()!);
                                      Navigator.of(context).popAndPushNamed(
                                          HomeScreen.routeName);
                                    });
                                  } on FirebaseAuthException catch (e) {
                                    setState(() {
                                      isLoggedInSelected = false;
                                    });
                                    ScaffoldMessenger.of(context)
                                        .hideCurrentSnackBar();
                                    ScaffoldMessenger.of(context).showSnackBar(
                                      SnackBar(
                                        content: Text(e.code),
                                      ),
                                    );
                                  } catch (e) {
                                    setState(() {
                                      isLoggedInSelected = false;
                                    });
                                    ScaffoldMessenger.of(context)
                                        .hideCurrentSnackBar();
                                    ScaffoldMessenger.of(context).showSnackBar(
                                      SnackBar(
                                        content: Text('An error has occurred'),
                                      ),
                                    );
                                  }
                                  setState(() {
                                    isLoggedInSelected = false;
                                  });
                                }
                              },
                            ),
                      const SizedBox(height: 15),
                      GestureDetector(
                        onTap: () => Navigator.of(context)
                            .pushNamed(ForgotPasswordScreen.routeName),
                        child: const Text(
                          'Forgot Password? Click HERE to recover',
                          style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                          ),
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
        ),
      ),
    );
  }
}
