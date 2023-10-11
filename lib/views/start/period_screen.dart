import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:healthier_carbon_pregnancy_app/helper/fire_store.dart';
import 'package:healthier_carbon_pregnancy_app/main.dart';
import 'package:healthier_carbon_pregnancy_app/models/user.dart';
import 'package:healthier_carbon_pregnancy_app/providers/create_new_user.dart';
import 'package:healthier_carbon_pregnancy_app/views/start/loading_home_screen.dart';
import 'package:healthier_carbon_pregnancy_app/widgets/app_button.dart';
import 'package:provider/provider.dart';

class PeriodScreen extends StatelessWidget {
  const PeriodScreen({super.key});
  static const String routeName = 'period-screen';

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
            padding: const EdgeInsets.symmetric(horizontal: 15.0),
            child: Column(
              children: [
                const SizedBox(height: 15),
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
                const SizedBox(height: 50),
                const Text(
                  'Log the first day of your last \nperiod?',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 15),
                CalendarDatePicker(
                  initialDate: DateTime.now(),
                  firstDate: DateTime(DateTime.now().year),
                  lastDate: DateTime.now(),
                  onDateChanged: (date) {
                    user.setPeriod(Timestamp.fromDate(date));
                  },
                  currentDate: DateTime.now(),
                ),
                const SizedBox(height: 15),

                AppButton(
                  text: "NEXT",
                  onTap: () async {
                    try {
                      await FireStore().addUserToDatabase(
                        User(
                          id: auth.currentUser!.uid,
                          imageUrl: auth.currentUser!.photoURL ??
                              'https://www.nicepng.com/png/full/933-9332131_profile-picture-default-png.png',
                          name: auth.currentUser!.displayName ?? user.user.name,
                          email: auth.currentUser!.email ?? user.user.email,
                          stage: user.user.stage,
                          dob: user.user.dob,
                          height: user.user.height,
                          weight: user.user.weight,
                          healthCondition: user.user.healthCondition,
                          period: user.user.period,
                        ).toJson(),
                      );
                      await prefs.setBool('isUserLoggedIn', true);
                      var data =
                          await FireStore().getUser(auth.currentUser!.uid);
                      user.setProfile(data.data()!);
                      Navigator.of(context)
                          .pushNamed(LoadingHomeScreen.routeName);
                    } catch (e) {
                      ScaffoldMessenger.of(context).hideCurrentSnackBar();
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(
                          content: Text('An error occured'),
                        ),
                      );
                    }
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
                // const SizedBox(height: 45),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
