import 'package:email_validator/email_validator.dart';
import 'package:flutter/material.dart';
import 'package:healthier_carbon_pregnancy_app/helper/auth.dart';
import 'package:healthier_carbon_pregnancy_app/providers/create_new_user.dart';
import 'package:healthier_carbon_pregnancy_app/views/start/login_screen.dart';
import 'package:healthier_carbon_pregnancy_app/views/start/stage_screen.dart';
import 'package:healthier_carbon_pregnancy_app/widgets/app_button.dart';
import 'package:healthier_carbon_pregnancy_app/widgets/app_text_field.dart';
import 'package:healthier_carbon_pregnancy_app/widgets/app_text_field_password.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import 'package:provider/provider.dart';

class SignUpScreen extends StatefulWidget {
  static const String routeName = 'signup-screen';
  const SignUpScreen({super.key});
  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  final TextEditingController email = TextEditingController();
  final TextEditingController password = TextEditingController();
  final TextEditingController name = TextEditingController();

  bool isLoggedInSelected = false;

  @override
  Widget build(BuildContext context) {
    CreateNewUser user = Provider.of<CreateNewUser>(context, listen: false);

    Size size = MediaQuery.of(context).size;

    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Container(
            width: size.width,
            height: size.height,
            decoration: BoxDecoration(
              image: DecorationImage(
                fit: BoxFit.cover,
                image: const AssetImage('assets/images/bg1.jpg'),
                colorFilter: ColorFilter.mode(
                  Colors.black.withOpacity(0.2),
                  BlendMode.darken,
                ),
              ),
            ),
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 30),
              child: Form(
                key: formKey,
                child: Column(
                  children: [
                    const SizedBox(height: 15),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        // const Text(
                        //   'Sign Up',
                        //   style: TextStyle(fontSize: 12),
                        // ),
                        const Spacer(),
                        GestureDetector(
                          onTap: () => Navigator.of(context)
                              .popAndPushNamed(LoginScreen.routeName),
                          child: const Text(
                            style: TextStyle(fontSize: 12),
                            'Sign In',
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 15),
                    const Align(
                      alignment: Alignment.center,
                      child: Text(
                        'Create Account',
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
                        'Name',
                        style: TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    AppTextField(
                      type: TextInputType.name,
                      controller: name,
                      validator: (value) {
                        if (value!.length < 3) {
                          return 'Name must be more than 3 Characters';
                        }
                        return null;
                      },
                    ),
                    const SizedBox(height: 15),
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
                    AppTextField(
                      type: TextInputType.emailAddress,
                      controller: email,
                      validator: (value) {
                        if (!EmailValidator.validate(email.text.trim())) {
                          return 'Invalid Email';
                        }
                        return null;
                      },
                    ),
                    const SizedBox(height: 15),
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
                    AppTextFieldPassword(
                        controller: password,
                        validator: (value) {
                          if (value!.length < 6) {
                            return 'Password must be more than 5 Characters';
                          }
                          return null;
                        }),
                        const SizedBox(height: 45),
                    isLoggedInSelected
                        ? Center(
                            child: LoadingAnimationWidget.staggeredDotsWave(
                              color: Colors.white,
                              size: 45,
                            ),
                          );
                    AppButton(
                        text: "CONTINUE",
                        onTap: () async {
                          if (formKey.currentState!.validate()) {
                            setState(() {
                              isLoggedInSelected = true;
                            });
                            try {
                              await Auth.account(email.text, password.text,
                                      AuthMode.register)
                                  .then((_) async {
                                user.setName(name.text.trim());
                                user.setEmail(email.text.trim());
                                Navigator.of(context)
                                    .popAndPushNamed(StageScreen.routeName);
                              });
                            } catch (e) {
                              ScaffoldMessenger.of(context)
                                  .hideCurrentSnackBar();
                              ScaffoldMessenger.of(context).showSnackBar(
                                const SnackBar(
                                  content: Text('An error occured'),
                                ),
                              );
                              setState(() {
                                isLoggedInSelected = true;
                              });
                            }
                            setState(() {
                              isLoggedInSelected = true;
                            });
                          }
                        }),
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
      ),
    );
  }
}
