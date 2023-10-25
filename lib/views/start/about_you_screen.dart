import 'package:flutter/material.dart';
import 'package:healthier_carbon_pregnancy_app/providers/create_new_user.dart';
import 'package:healthier_carbon_pregnancy_app/views/start/health_condition.dart';
import 'package:healthier_carbon_pregnancy_app/widgets/about_textfield.dart';
import 'package:healthier_carbon_pregnancy_app/widgets/app_button.dart';
import 'package:provider/provider.dart';

class AboutYouScreen extends StatelessWidget {
  AboutYouScreen({super.key});
  static const String routeName = 'about-you-screen';

  final TextEditingController height = TextEditingController();
  final TextEditingController weight = TextEditingController();
  
  @override
  Widget build(BuildContext context) {
    CreateNewUser user = Provider.of<CreateNewUser>(context);

    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Container(
            width: size.width,
            height: size.height,
            padding: const EdgeInsets.symmetric(horizontal: 15.0),
            child: Column(
              children: [
                const SizedBox(height: 25),
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
                const SizedBox(height: 45),
                const Text(
                  'About You',
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 5),
                const Text(
                  'Tell us your weight and size',
                  style: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.bold,
                  ),
                ),

                const SizedBox(height: 75),
                //  Date Picker
                AboutAppTextField(
                  text: "Height",
                  controller: height,
                ),
                const SizedBox(height: 30),
                AboutAppTextField(
                  text: "Weight",
                  controller: weight,
                ),
                const Spacer(),
                AppButton(
                  text: 'NEXT',
                  onTap: () {
                    user
                      ..setWeight(weight.text)
                      ..setHeight(height.text);
                    Navigator.of(context).pushNamed(HealthScreen.routeName);
                  },
                ),
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
                const SizedBox(height: 45),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
